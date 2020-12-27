//
//  ViewController.swift
//  MessageBubbleViewExample
//
//  Created by Josh Arnold on 12/26/20.
//

import UIKit
import MessageBubbleView


class ViewController: UIViewController {
    
    var bubbleView:MessageBubbleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bubbleView.drawBubble(text: NSAttributedString(string: "Yo.", attributes: [.foregroundColor:UIColor.white, .font:UIFont.systemFont(ofSize: 15)]), color: .systemBlue, corners: [.allCorners])
        bubbleView.center = view.center                
    }

    func setupUI() {
        bubbleView = MessageBubbleView(maxWidth: self.view.frame.width*0.7)
        view.addSubview(bubbleView)
    }

}

