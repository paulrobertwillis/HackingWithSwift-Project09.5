//
//  ViewController.swift
//  Project09.5
//
//  Created by Paul Willis on 15/07/2021.
//

import UIKit

class ViewController: UIViewController {
    var livesLeft = 0
    var livesLabel: UILabel!
    var currentAnswer: UITextField!
//    var answer: String
    var letterButtons = [UIButton]()
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)

        let interfaceView = UIView()
        interfaceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(interfaceView)
        interfaceView.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)

        
        livesLabel = UILabel()
        livesLabel.translatesAutoresizingMaskIntoConstraints = false
        livesLabel.textAlignment = .right
        livesLabel.text = "Lives Left: \(livesLeft)"
        view.addSubview(livesLabel)
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 44)
        currentAnswer.isUserInteractionEnabled = false
        interfaceView.addSubview(currentAnswer)
        
        let submit = UIButton(type: .system)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.setTitle("SUBMIT", for: .normal)
        interfaceView.addSubview(submit)

        let clear = UIButton(type: .system)
        clear.translatesAutoresizingMaskIntoConstraints = false
        clear.setTitle("CLEAR", for: .normal)
        interfaceView.addSubview(clear)


        
        NSLayoutConstraint.activate([
            livesLabel.topAnchor.constraint(equalTo:
            view.layoutMarginsGuide.topAnchor),
            livesLabel.trailingAnchor.constraint(equalTo:
            view.layoutMarginsGuide.trailingAnchor),

            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.centerYAnchor.constraint(equalTo: interfaceView.centerYAnchor),
            
            submit.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor),
            submit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submit.heightAnchor.constraint(equalToConstant: 44),

            clear.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clear.centerYAnchor.constraint(equalTo: submit.centerYAnchor),
            clear.heightAnchor.constraint(equalToConstant: 44),
            
            interfaceView.widthAnchor.constraint(equalToConstant: 750),
            interfaceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            interfaceView.topAnchor.constraint(equalTo: livesLabel.bottomAnchor),
            
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submit.bottomAnchor,
            constant: 20),
            buttonsView.bottomAnchor.constraint(equalTo:
            view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
        
        buttonsView.backgroundColor = .red
        livesLabel.backgroundColor = .gray
        currentAnswer.backgroundColor = .green
        interfaceView.backgroundColor = .blue

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

