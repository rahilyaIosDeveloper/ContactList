//
//  ViewController.swift
//  ContactList
//
//  Created by Rahilya Nazaralieva on 21/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var loginLabel = MakerView().makeLabel(text: "Login", textColor: UIColor.black, textSize: 18, numberOfLines: 1, weight: .bold)
    
    private lazy var userImage = MakerView().makeImg(cornerRadius: 0, image: UIImage(named: "UserImage"))
    
    private lazy var welcomelabel = MakerView().makeLabel(text: "Welcome back , Rohit thakur", textColor: .lightGray, textSize: 14, numberOfLines: 1, weight: .regular)
    
    private lazy var illustrationImg = MakerView().makeImg(cornerRadius: 0, image: UIImage(named: "illustrationIMG"))
    
    private lazy var enterYourLabel = MakerView().makeLabel(text: "Enter Your Mobile Number", textColor: .orange, textSize: 17, numberOfLines: 1, weight: .bold)
    
    private lazy var centerTF = MakerView().makeTF(placeholder: "Enter Number", backgroundColor: .white, placeholderFontSize: 13, placeholderColor: .lightGray)
    
    private lazy var changeNumberLabel = MakerView().makeLabel(text: "Change Number ?", textColor: .lightGray, textSize: 12, numberOfLines: 1, weight: .regular)
    
    private lazy var loginBT = MakerView().makeButton(setTitle: "Login", tintColor: .white, backgroundColor: .orange, cornerRadius: 16, borderColor: .orange, borderWidth: 1)
    
    
    private lazy var googleImage = MakerView().makeImg(cornerRadius: 0, image: UIImage(named: "google"))
    
    private lazy var googleLabel = MakerView().makeLabel(text: "Google", textColor: .black, textSize: 14, numberOfLines: 1, weight: .regular)
    
    private lazy var dontHaveAccLabel = MakerView().makeLabel(text: "You Don’t have an account ?", textColor: .lightGray, textSize: 12, numberOfLines: 1, weight: .regular)
    
    private lazy var signUpLabel = MakerView().makeLabel(text: "Sign up", textColor: .black, textSize: 12, numberOfLines: 1, weight: .bold)
    
    
    private var isButtonActive: Bool = false {
        didSet {
            loginBT.isEnabled = isButtonActive
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTextField()
        setupButtonAction()
    }
    
    private func setupButtonAction() {
        loginBT.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {
        guard isButtonActive else { return }
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
   
    
    private func setupTextField() {
        centerTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            isButtonActive = isKyrgyzstanNum(text)
        } else {
            isButtonActive = false
        }
    }
    
    private func isKyrgyzstanNum(_ number: String) -> Bool {
        return number.hasPrefix("+996") || number.hasPrefix("055")
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.secondarySystemBackground
        
        
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(344)
        }
        
        view.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().offset(-320)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        view.addSubview(welcomelabel)
        welcomelabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel).offset(25)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(213)
        }
        
        view.addSubview(illustrationImg)
        illustrationImg.snp.makeConstraints { make in
            make.top.equalTo(welcomelabel).offset(49)
            make.trailing.equalToSuperview().offset(-61)
            make.leading.equalToSuperview().offset(57)
            make.height.equalTo(231)
            make.width.equalTo(296)
        }
        
        view.addSubview(enterYourLabel)
        enterYourLabel.snp.makeConstraints { make in
            make.bottom.equalTo(illustrationImg).offset(50)
            make.leading.equalToSuperview().offset(94)
            make.trailing.equalToSuperview().offset(-85)
        }
        
        view.addSubview(centerTF)
        centerTF.snp.makeConstraints { make in
            make.bottom.equalTo(enterYourLabel).offset(70)
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(43)
        }
        
        view.addSubview(changeNumberLabel)
        changeNumberLabel.snp.makeConstraints { make in
            make.bottom.equalTo(centerTF).offset(30)
            make.leading.equalToSuperview().offset(240)
            make.trailing.equalToSuperview().offset(-41)
        }
        
        view.addSubview(loginBT)
        loginBT.snp.makeConstraints { make in
            make.bottom.equalTo(changeNumberLabel).offset(70)
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(43)
            
        }
       
        view.addSubview(googleImage)
        googleImage.snp.makeConstraints { make in
            make.bottom.equalTo(loginBT).offset(70)
            make.leading.equalToSuperview().offset(160)
            make.trailing.equalToSuperview().offset(-235)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
            
        view.addSubview(googleLabel)
        googleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginBT).offset(70)
            make.leading.equalToSuperview().offset(193)
            make.trailing.equalToSuperview().offset(-150)
        }
        
        view.addSubview(dontHaveAccLabel)
        dontHaveAccLabel.snp.makeConstraints { make in
            make.bottom.equalTo(googleLabel).offset(90)
            make.leading.equalToSuperview().offset(97)
            make.trailing.equalToSuperview().offset(-100)
        }
        
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.bottom.equalTo(googleLabel).offset(90)
            make.leading.equalToSuperview().offset(260)
            make.trailing.equalToSuperview().offset(-70)
        }
    }
}

