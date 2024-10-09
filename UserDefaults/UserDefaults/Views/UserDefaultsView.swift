//
//  UserDefaultsView.swift
//  UserDefaults
//
//  Created by 오현민 on 10/7/24.
//

import Foundation
import UIKit
import Then
import SnapKit

class UserDefaultsView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setStackView()
        addViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 상단 스택뷰 컴포넌트 구현
    
    public lazy var titleLabel = UILabel().then {
        $0.text = "UserDefaults 실습 뷰"
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 20)
        
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var inputTextField = UITextField().then {
        $0.placeholder = "아무 텍스트나 입력해주세요"
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 14)
        
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0))
        $0.leftViewMode = .always
        
        $0.borderStyle = .none
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 10
    }
    
    public lazy var saveButton = UIButton().then {
        $0.setTitle("UserDefaults에 저장하기", for: .normal)
        $0.setTitleColor(UIColor.red, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.backgroundColor = UIColor.gray
    }
    
    private lazy var topStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.spacing = 26
    }
    
    //MARK: - 하단 스택뷰 컴포넌트 구현
    private lazy var subTitleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.text = "UserDefaults 값 출력 라벨"
        $0.textColor = UIColor.black
        $0.textAlignment = .center
    }
    
    public lazy var showTextValue = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.text = "UserDefaults 값이 출력됩니다."
        $0.textColor = UIColor.black
        $0.textAlignment = .center
                
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.blue.cgColor
        $0.layer.cornerRadius = 10
    }
    
    private lazy var bottomStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.spacing = 21
    }
    
    private func setStackView() {
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(inputTextField)
        topStackView.addArrangedSubview(saveButton)
        
        bottomStackView.addArrangedSubview(subTitleLabel)
        bottomStackView.addArrangedSubview(showTextValue)
    }
    
    private func addViewConstraints() {
        self.addSubview(topStackView)
        self.addSubview(bottomStackView)
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(197)
            $0.left.equalToSuperview().offset(42)
            $0.right.equalToSuperview().offset(-42)
        }
        
        inputTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.width.equalTo(309)
        }
        
        saveButton.snp.makeConstraints {
            $0.height.equalTo(42)
            $0.width.equalTo(222)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(114)
            $0.left.equalToSuperview().offset(56.5)
            $0.right.equalToSuperview().offset(-56.5)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.width.equalTo(280)
            $0.height.equalTo(24)
        }
        
        showTextValue.snp.makeConstraints {
            $0.width.equalTo(280)
            $0.height.equalTo(172)
        }
    }
}
