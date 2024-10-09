//
//  DiceCell.swift
//  TableView
//
//  Created by 오현민 on 10/8/24.
//

import UIKit
import SnapKit
import Then

class DiceCell: UITableViewCell {
    
    /// 테이블 뷰애서 Cell을 연결하기 위한 식별자
    static let identifier = "DiceCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// 셀을 초기화 할 때 호출되는 메서드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 셀이 재사용 되기 전 초기화된 상태로 만들어주는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    /// 셀의 이미지와 레이블 설정
    public func configure(model: DiceModel) {
        self.diceImageView.image = UIImage(named: model.diceImage)
        self.diceName.text = model.diceName
    }
    
    //MARK: - 컴포넌트 설정
    private lazy var diceImageView = UIImageView()
    
    private lazy var diceName = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = UIColor.black
    }
    
    private func setViews() {
        self.addSubview(diceImageView)
        self.addSubview(diceName)
    }
    
    private func setConstaints() {
        diceImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.height.equalTo(75)
        }
        
        diceName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(36.5)
            $0.left.equalTo(diceImageView.snp.right).offset(87)
            $0.right.equalToSuperview().offset(-144)
        }
    }
}
