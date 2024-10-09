//
//  UserDefaultsModel.swift
//  UserDefaults
//
//  Created by 오현민 on 10/7/24.
//

import Foundation

class UserDefaultsModel {
    private let userDefaults = UserDefaults.standard
    private let userTextKey : String = "userText"
    
    // 유저가 입력한 텍스트값 userDefaults 에 저장
    // parameter : 유저가 입력한 텍스트 값
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    
    // userDefaults 값 불러오기
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
}
