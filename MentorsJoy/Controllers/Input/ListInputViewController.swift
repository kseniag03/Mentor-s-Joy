//
//  ListInputViewController.swift
//  MentorsJoy
//

import UIKit

final class ListInputViewController: UIViewController {
    
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
