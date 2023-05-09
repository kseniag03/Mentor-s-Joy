//
//  InputViewController.swift
//  MentorsJoy
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    let textField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(textField)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textField.frame = self.contentView.bounds.inset(by: UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15))
    }
}

class CommonInputViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }

}

extension CommonInputViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...2, 4...8, 10...12:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TextFieldTableViewCell {
                cell.textField.placeholder = getText(i: indexPath.row)
                return cell
            }
            break;
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getDatePicker(cell: cell)
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getCity(cell: cell)
            return cell
        case 13...14:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TextFieldTableViewCell {
                cell.textField.placeholder = getText(i: indexPath.row)
                return cell
            }
            break;
        default:
            break;
        }
        return UITableViewCell()
    }

}


extension CommonInputViewController {
    
    private func getDatePicker(cell: UITableViewCell) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        let currentDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        let maxComponents = DateComponents(year: year, month: 12, day: 31)
        let minComponents = DateComponents(year: year, month: 1, day: 1)
        datePicker.maximumDate = calendar.date(from: maxComponents)
        datePicker.minimumDate = calendar.date(from: minComponents)
        
        cell.contentView.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            datePicker.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            datePicker.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
    }
    
    private func getChoiceList(cell: UITableViewCell, options: [String]) {
        let segmentedControl = UISegmentedControl(items: options)
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
        cell.contentView.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
        ])
    }
    
    private func getCity(cell: UITableViewCell) {
        getChoiceList(cell: cell, options: ["Москва", "Санкт-Петербург", "Нижний Новогород", "Пермь"])
    }
    
    private func getText(i: Int) -> String {
        switch i {
        case 0:
            return "ФИО исполнителя"
        case 1:
            return "ФИО научного руководителя"
        case 2:
            return "Год"
        case 3:
            return "Дата (день, месяц)"
        case 4:
            return "Тема проекта"
        case 5:
            return "Название проекта"
        case 6:
            return "Название проекта на английском языке"
        case 7:
            return "Кодификатор (строка вида «xx.xx»"
        case 8:
            return "Группа (название группы)"
        case 10:
            return "Краткая характеристика области применения"
        case 11:
            return "Функциональное назначение"
        case 12:
            return "Эксплуатационное назначение"
        default:
            return ""
        }
    }
    
    @objc
    private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Handle the selection of an option
    }
}





class TaskInputViewController: CommonInputViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}

class TestingInputViewController: CommonInputViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemPurple
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}

class ProgrammInputViewController: CommonInputViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemYellow
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}

class NoteInputViewController: CommonInputViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemCyan
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}

class ManualInputViewController: CommonInputViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemMint
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}
