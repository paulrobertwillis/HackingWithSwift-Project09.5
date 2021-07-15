//
//  ViewController.swift
//  Project09.5
//
//  Created by Paul Willis on 15/07/2021.
//

import UIKit

class ViewController: UIViewController {
    var livesLeft = 5 {
        didSet {
            livesLabel.text = "Lives Left: \(livesLeft)"
        }
    }
    var livesLabel: UILabel!
    var currentAnswer: UITextField!
    var usedLetters = [String]()
    var answer = ""
    var words = [String]()
    var clue = ""
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
                
        livesLabel = UILabel()
        livesLabel.translatesAutoresizingMaskIntoConstraints = false
        livesLabel.textAlignment = .right
        livesLabel.text = "Lives Left: \(livesLeft)"
        view.addSubview(livesLabel)
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Press Reset"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        view.addSubview(submit)
        submit.addTarget(self, action: #selector(submitTapped), for:
        .touchUpInside)

        let reset = UIButton(type: .system)
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.setTitle("RESET", for: .normal)
        view.addSubview(reset)
        reset.addTarget(self, action: #selector(resetTapped), for:
        .touchUpInside)

        NSLayoutConstraint.activate([
            livesLabel.topAnchor.constraint(equalTo:
            view.layoutMarginsGuide.topAnchor),
            livesLabel.trailingAnchor.constraint(equalTo:
            view.layoutMarginsGuide.trailingAnchor),

            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),

            reset.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            reset.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            reset.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLevel()
    }
    
    func loadLevel() {
            if let dictionaryURL = Bundle.main.url(forResource:
            "start", withExtension: "txt") {
                if let dictionaryContents = try? String(contentsOf: dictionaryURL) {
                    var lines = dictionaryContents.components(separatedBy: "\n")
                    lines.shuffle()
                    
                    for line in lines {
                        words.append(line.uppercased())
                    }
                    
                    answer = words[0]
                                        
                    for _ in answer {
                        clue += "?"
                    }
                    
                    currentAnswer.text? = clue
                }
            }
        print("loadLevel() finished")
    }
    
    func updateClue() {
        clue = ""
        
        for letter in answer {
            let strLetter = String(letter)

            if usedLetters.contains(strLetter) {
                clue += strLetter
            } else {
                clue += "?"
            }
        }

        currentAnswer.text? = clue
    }
    
    @objc func submitTapped(_ sender: UIButton) {
    
        let ac = UIAlertController(title: "Enter answer", message: nil,
        preferredStyle: .alert)
        ac.addTextField()
                
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(letter: answer)
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc func resetTapped(_ sender: UIButton) {
        reset()
    }
    
    @objc func submit(letter: String) {
        let upperLetter = letter.uppercased()
        
        guard isSubmissionOneLetter(letter: upperLetter) == true else {
            displayAlert(title: "Too Many Letters", message: "Only enter one letter at a time")
            return
        }
        
        //TODO: Delete this print statement
        print(answer)
        
        usedLetters.append(upperLetter)
        
        if answer.contains(upperLetter) {
            print("contains letter")
            usedLetters.append(upperLetter)
            updateClue()
            checkWinLoseConditions()
        } else {
            print("does not contain letter")
            livesLeft = livesLeft - 1
            checkWinLoseConditions()
        }
    }
        
    func isSubmissionOneLetter(letter: String) -> Bool {
        return letter.count == 1
    }
    
    func checkWinLoseConditions() {
        if livesLeft == 0 {
            displayWinLoseAlert(didWin: false)
        }
        
        if clue == answer {
            displayWinLoseAlert(didWin: true)
        }
    }
    
    func displayWinLoseAlert(didWin: Bool) {
        var alertTitle = ""
        
        if didWin == true {
            alertTitle = "Well done!"
        } else {
            alertTitle = "Terrible!"
        }
        
        let ac = UIAlertController(title: "\(alertTitle)", message: "Play again?",
        preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: {_ in
            self.reset()
        }))
        present(ac, animated: true)
    }
    
    func displayAlert(title: String, message: String) {
        let ac = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
    @objc func reset() {
        usedLetters = []
        answer = words.randomElement()!
        updateClue()
        livesLeft = 5
    }

}

