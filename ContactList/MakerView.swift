//
//  MakerView.swift
//  ContactList
//
//  Created by Rahilya Nazaralieva on 21/1/24.
//

import Foundation
import SnapKit
import UIKit

class MakerView {
    
    static let made = MakerView()
 
    func makeLabel(text: String,
                   textColor: UIColor,
                   textSize: CGFloat,
                   numberOfLines: Int,
                   lineBreakMode: NSLineBreakMode = .byWordWrapping,
                   textAlignment: NSTextAlignment = .left,
                   weight: UIFont.Weight) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: textSize, weight: weight)
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.textAlignment = textAlignment
        
        return label
    }

    
    func makeImg(contentMode: UIView.ContentMode = .scaleAspectFill,
                        clipsToBounds: Bool = true,
                        cornerRadius: CGFloat,
                        image: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = contentMode
        imageView.clipsToBounds = clipsToBounds
        imageView.layer.cornerRadius = cornerRadius
        imageView.image = image ?? UIImage(named: "UserImage")
        return imageView
    }
    
    
    func makeTF(placeholder: String,
                textColor: UIColor = .black,
                keyboardType: UIKeyboardType = .default,
                leftViewMode: UITextField.ViewMode = .always,
                cornerRadius: CGFloat = 16,
                backgroundColor: UIColor,
                placeholderFontSize: CGFloat,
                placeholderColor: UIColor) -> UITextField {
        
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = textColor
        textField.keyboardType = keyboardType
        textField.backgroundColor = backgroundColor
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: UIFont.systemFont(ofSize: placeholderFontSize)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 4))
        textField.leftView = view
        textField.leftViewMode = leftViewMode
        textField.layer.cornerRadius = cornerRadius
        
        return textField
    }


    func makeButton(setTitle: String,
                    for state: UIControl.State = .normal,
                    tintColor: UIColor,
                    backgroundColor: UIColor,
                    cornerRadius: CGFloat,
                    setImage: UIImage? = nil,
                    borderColor: UIColor,
                    borderWidth: CGFloat,
                    titleFont: UIFont? = nil) -> UIButton {
        
        let button = UIButton(type: .system)
        button.setTitle(setTitle, for: state)
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        
        if let titleFont = titleFont {
            button.titleLabel?.font = titleFont
        }
        
        if let setImage = setImage {
            button.setImage(setImage, for: state)
        }
        
        return button
    }

}
