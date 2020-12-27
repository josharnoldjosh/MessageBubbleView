//
//  MessageBubbleView.swift
//  MessageBubbleView
//
//  Created by Josh Arnold on 12/26/20.
//

import UIKit
import SnapKit


public final class MessageBubbleView : UIView {
    
    private var maxWidth:CGFloat
    private var inset:CGSize
    private var text:NSAttributedString = NSAttributedString(string: "")
    private var label:UILabel = UILabel()
    
    /// Returns the shape of the drawn bubble.
    public var bubbleShape:CAShapeLayer = CAShapeLayer()
    
    /// Returns an integral frame of the bubble.
    public var bubbleFrame:CGRect {
        get {
            return self.layer.frame.integral
        }
    }
                
    /// Initializes the bubble.
    public init(maxWidth:CGFloat = UIScreen.main.bounds.width*0.7, inset:CGSize = CGSize(width: 16, height: 8)) {
        self.maxWidth = maxWidth
        self.inset = inset
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Draws a bubble with the given parameters.
    public func drawBubble(text:NSAttributedString, color:UIColor=UIColor.systemBlue, corners:UIRectCorner=[.allCorners], radius: CGFloat=15) {
        self.text = text
        self.updateFrame()
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        bubbleShape = CAShapeLayer()
        bubbleShape.path = path.cgPath
        bubbleShape.fillColor = color.cgColor
        self.layer.addSublayer(bubbleShape)
        bringSubviewToFront(self.label)
    }
}


extension MessageBubbleView {
    
    private func setupLabel() {
        label.numberOfLines = 0
        addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(self.inset.height)
            make.left.equalToSuperview().inset(self.inset.width)
            make.right.equalToSuperview().inset(self.inset.width)
        }
    }
                        
    private func updateFrame() {
        let constraintBox = CGSize(width: self.maxWidth, height: .greatestFiniteMagnitude)
        let rect = self.text.boundingRect(with: constraintBox, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).integral
        self.label.attributedText = self.text
        self.frame = rect.insetBy(dx: -self.inset.width, dy: -self.inset.height)
    }
}
