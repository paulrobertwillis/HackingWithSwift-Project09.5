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
        view.addSubview(currentAnswer)
        



        NSLayoutConstraint.activate([
            livesLabel.topAnchor.constraint(equalTo:
            view.layoutMarginsGuide.topAnchor),
            livesLabel.trailingAnchor.constraint(equalTo:
            view.layoutMarginsGuide.trailingAnchor),

            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

