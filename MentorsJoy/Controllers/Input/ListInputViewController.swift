//
//  ListInputViewController.swift
//  MentorsJoy
//

import UIKit

final class ListInputViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private var tableTitle: String = "Table"
    
    private let currentType: DocumentType
    
    private var num: Int = 0
    
    private var data: [String] = []
    
    init(type: DocumentType) {
        self.currentType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        //self.title = tableTitle
    }
    
    func setupNum(num: Int) {
        self.num = num
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        setupTitle()
        setupTable()
    }
    
    private func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = tableTitle
        titleLabel.textAlignment = .center
        titleLabel.font = StyleLibrary.timesFont20
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
    }
    
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(TextLabelCell.self, forCellReuseIdentifier: TextLabelCell.reuseIdentifier)
        tableView.register(AddListItemCell.self, forCellReuseIdentifier: AddListItemCell.reuseIdentifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.keyboardDismissMode = .onDrag
        
        tableView.setHeight(self.view.frame.height)
        self.view.addSubview(tableView)
    }
    
    private func handleDelete(indexPath: IndexPath) {
        
        data.remove(at: indexPath.row)
        
        // remove in pdf data

        // choose necessary block of actions
        var text = TextConst.texts
        switch currentType {
        case .common:
            break
        case .task:
            text = TextConst.taskTexts
            break
        case .note:
            text = TextConst.noteTexts
            break
        case .testing:
            text = TextConst.testingTexts
            break
        case .manual:
            text = TextConst.manualTexts
            break
        case .programm:
            text = TextConst.programTexts
            break
        }
        
        // launch necessary action
        guard let change = text[num] else { return }
        guard let removeAction = change.removeAction else { return }
        removeAction(indexPath.row)
        
        // update table
        tableView.reloadData()
    }
}

extension ListInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 250
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: .none) {
            [weak self] (action, view, completion) in
            self?.handleDelete(indexPath: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(
            systemName: "trash.fill",
            withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
        )?.withTintColor(.white)
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension ListInputViewController: AddListItemDelegate {
    
    func newListItem(item: String) {
        
        data.append(item)
        
        // add in pdf data

        // choose necessary block of actions
        var text = TextConst.texts
        switch currentType {
        case .common:
            break
        case .task:
            text = TextConst.taskTexts
            break
        case .note:
            text = TextConst.noteTexts
            break
        case .testing:
            text = TextConst.testingTexts
            break
        case .manual:
            text = TextConst.manualTexts
            break
        case .programm:
            text = TextConst.programTexts
            break
        }
        
        // launch necessary action
        guard let change = text[num] else { return }
        change.action(item)
        
        // update table
        tableView.reloadData()
    }
}
