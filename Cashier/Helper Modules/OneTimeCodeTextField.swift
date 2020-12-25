//
//  OneTimeCodeTextField.swift
//  PyramidGold
//
//  Created by MAC on 12/12/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class OneTimeCodeTextField: UITextField {

    private var isConfigured = false
    var digitLabels = [UILabel]()
    var digitCircleViews = [UIView]()
    var defaultCharacter = "-"
    
    var didEnterCompleteDigits : ((String)->())?
    
    private lazy var tapGestureRecognizer: UITapGestureRecognizer  = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with slotCount: Int = 4) {
        guard isConfigured == false else { return  }
        isConfigured.toggle()
        configureTextField()
        
        let labelsStackView = createLabelsStackViewWith(with: slotCount)
        addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        if #available(iOS 12.0, *) {
            textContentType = .oneTimeCode
        }
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    func createLabelsStackViewWith(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1 ... count {
            let label = UILabel()
            let circleView = UIView()
            circleView.isUserInteractionEnabled = false
            circleView.translatesAutoresizingMaskIntoConstraints = false
            circleView.layer.borderColor = UIColor.darkGray.cgColor
            circleView.layer.borderWidth = 0.6
            circleView.layer.cornerRadius = 20
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont(name: UIFont.AppFont, size: 25)!
            label.text = defaultCharacter
            label.isUserInteractionEnabled = false

            stackView.addArrangedSubview(label)
            digitLabels.append(label)
            digitCircleViews.append(circleView)
        }
        
        return stackView
    }

    @objc
    func textDidChange() {
        
        guard let text = self.text, text.count <= digitLabels.count else { return  }
        for i in 0 ..< digitLabels.count{
            let currentLabel = digitLabels[i]
            
            if(i <  text.count){
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            }else{
                currentLabel.text = defaultCharacter
            }
            
        }
        
        if(text.count == digitLabels.count){
            didEnterCompleteDigits?(text)
        }
        
    }
    
}

extension OneTimeCodeTextField : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let charaterCount = textField.text?.count else { return false }
        return charaterCount < digitLabels.count || string == ""
    }
    
}
