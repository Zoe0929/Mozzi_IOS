//
//  LoginViewController.swift
//  Mozzi_dev
//
//  Created by 지희의 MAC on 2023/03/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var idField = UITextField()
    lazy var passwordField = UITextField()
    lazy var loginImageView = UIImageView()
    lazy var logoImageView = UIImageView()
    lazy var loginButton = UIButton()
    lazy var signinButton = UIButton()
    let backgroundImage = UIImage(named: "loginBackground")
    let logoImage = UIImage(named: "logo_w")
    let idPlaceholder = "이메일을 입력해주세요"
    let passwordPlaceholder = "비밀번호를 입력해주세요"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure(){
        
        
        view.backgroundColor = .white
        view.addSubview(loginImageView)
        
        loginImageView.addSubview(logoImageView)
        view.addSubview(idField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(signinButton)
        
        loginImageView.image = backgroundImage
        loginImageView.snp.makeConstraints{make in
            make.top.width.equalToSuperview()
        }
        
        logoImageView.image = logoImage
        logoImageView.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(160)
        }
        
        
        idField.placeholder = idPlaceholder
        idField.keyboardType = .emailAddress
        idField.autocapitalizationType = .none
        idField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.top.equalTo(loginImageView.snp.bottom).offset(30)
        }
        
        passwordField.placeholder = passwordPlaceholder
        passwordField.isSecureTextEntry = true
        passwordField.autocapitalizationType = .none
        passwordField.snp.makeConstraints{ make in
                   make.centerX.equalTo(self.view)
                   make.leading.equalTo(50)
                   make.trailing.equalTo(-50)
                   make.top.equalTo(idField.snp.bottom).offset(50)
               }
        
        loginButton.backgroundColor = UIColor(named: "Dark Color")
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.snp.makeConstraints{make in
            make.width.equalTo(312)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordField.snp.bottom).offset(50)
        }
        
        signinButton.setTitle("Sign up", for: .normal)
        signinButton.setTitleColor(.secondaryLabel, for: .normal)
        signinButton.snp.makeConstraints{make in
            make.width.equalTo(312)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(10)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
