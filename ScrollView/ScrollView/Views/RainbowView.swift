//
//  RainbowView.swift
//  ScrollView
//
//  Created by 오현민 on 10/15/24.
//

import UIKit
import Then
import SnapKit

class RainbowView: UIView {

    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupColorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(scrollView)
        
        // 뷰컨트롤러가 아니라 뷰 안에서 명시적으로 사이즈 먼저 잡아주는 방법
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    private func setupColorViews() {
        var previousView: UIView? = nil
        
        for color in RainbowColors.colors {
            let colorView = UIView().then {
                $0.backgroundColor = color
            }
            
            scrollView.addSubview(colorView)
            
            colorView.snp.makeConstraints {
                $0.horizontalEdges.equalToSuperview()
                $0.width.equalTo(self.snp.width) // self 는 RainbowView 를 가르킴
                $0.height.equalTo(176)
                
                //if 문으로 top 관리
                if let previousView = previousView {
                    $0.top.equalTo(previousView.snp.bottom) // 이전 뷰 하단에 배치
                } else {
                    $0.top.equalToSuperview() // 첫번째 뷰는 스크롤뷰(colorView 의 superView)의 상단에
                }
            }
            
            previousView = colorView
        }
        
        // 마지막 뷰의 하단을 스크롤 뷰(colorView 의 superView)의 하단에 맞춤으로써 스크롤 가능하게 설정
        if let lastView = previousView {
            lastView.snp.makeConstraints {
                $0.bottom.equalToSuperview()
            }
        }
    }
    
}
