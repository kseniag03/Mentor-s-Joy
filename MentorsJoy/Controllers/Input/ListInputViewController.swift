//
//  ListInputViewController.swift
//  MentorsJoy
//

import UIKit

/*
 
 func addEfficiencyItem(item: String)
 func addRivalItem(item: String)
 func addAdvantageItem(item: String)
 func addGlossaryDictItem(key: String, value: String)
 func addSourceListItem(item: String)
 
 func addFuncItem(item: String)
 func addInputItem(item: String)
 func addOutputItem(item: String)
 func addSafetyItem(item: String)
 func addInterfaceItem(item: String)
 func addHardwareItem(item: String)
 func addSoftwareItem(item: String)
 func addSpecialItem(item: String)
 
 */

class ListControllers {
    
    static let sources = ListInputViewController()
    static let glossary = ListInputViewController()
    
    static let efficiency = ListInputViewController()
    static let rivals = ListInputViewController()
    static let advantages = ListInputViewController()
    
    static let functionality = ListInputViewController()
    static let input = ListInputViewController()
    static let output = ListInputViewController()
    static let safety = ListInputViewController()
    static let interface = ListInputViewController()
    static let hardware = ListInputViewController()
    static let software = ListInputViewController()
    static let special = ListInputViewController()
    
    static let vc: [Int: (String, ListInputViewController)] = [
        13: ("Глоссарий", glossary),
        14: ("Источники", sources),
        
        15: ("Эконом. эффект.", efficiency),
        16: ("Аналоги", rivals),
        17: ("Преимущества", advantages)//,
        
        // in task
        /*
        0: ("Функционал", functionality),
        1: ("Входные данные", input),
        2: ("Выходные данные", output),
        
        3: ("Надёжность", safety),
        4: ("Интерфейс", interface),
        5: ("Технические парам.", hardware),
        6: ("Программная совм.", software),
        7: ("Спец.", special)*.*/
    ]
    
}

class CustomButton: UIButton {
    var i: Int = 0
}

class ListInputViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private var tableTitle: String = "Table"
    
    private var num: Int = 0
    
    private var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    func setupTitle(tableTitle: String) {
        self.tableTitle = tableTitle
        self.title = tableTitle
    }
    
    func setupNum(num: Int) {
        self.num = num
    }
    
    private func setupView() {
        print("starting setup list input vc...")
        self.view.backgroundColor = .systemGray6
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(TextLabelCell.self, forCellReuseIdentifier: TextLabelCell.reuseIdentifier)
        tableView.register(AddListItemCell.self, forCellReuseIdentifier: AddListItemCell.reuseIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.keyboardDismissMode = .onDrag
        
        tableView.setHeight(self.view.frame.height)
        
        print("tableView has been registered")
        
        self.view.addSubview(tableView)
    }
}

extension ListInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        default:
            return 75
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return data.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddListItemCell.reuseIdentifier, for: indexPath) as? AddListItemCell {
                cell.delegate = self
                return cell
            }
        default:
            let text = data[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextLabelCell.reuseIdentifier, for: indexPath) as? TextLabelCell {
                cell.configure(text: text)
                return cell
            }
        }
        return UITableViewCell()
    }
    
}

extension ListInputViewController: AddListItemDelegate {
    
    func newListItem(item: String) {
        data.append(item)
        // add in pdf data
        guard let change = TextConst.texts[num] else { return }
        change.action(item)
        // update table
        tableView.reloadData()
    }
}
