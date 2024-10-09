//
//  ViewController.swift
//  TableView
//
//  Created by 오현민 on 10/8/24.
//

import UIKit

class DiceViewController: UIViewController {

    let data = dummyDiceModel.diceDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = diceView
    }

    private lazy var diceView = DiceView().then {
        $0.tableView.dataSource = self
        $0.tableView.delegate = self
        
    }
}

extension DiceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiceCell.identifier, for: indexPath) as? DiceCell else {
            return UITableViewCell()
        }
        // 각 행의 정보에 따른 이미지, 레이블 설정
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    
}
