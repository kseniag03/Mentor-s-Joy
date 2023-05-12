//
//  InputViewController.swift
//  MentorsJoy
//

import UIKit

/*
protocol CellDelegate {
    func cellValueDidChange(_ cell: UITableViewCell)
}
 
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
    
    private let tableView = UITableView()
    
    private var tableTitle: String = "Table"
    
    private var num: Int = 0
    
    private var data: [String] = []
    
    //private var dataDict: [String:String] = [:]
    
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
    }
    
    func setupNum(num: Int) {
        self.num = num
    }
    
    /*
    func setupList(data: [String]) {
        self.data = data
    }
    
    func setupDict(data: [String:String]) {
        self.dataDict = data
    }*/
    
    private func setupView() {
        print("starting setup list input vc...")
        self.view.backgroundColor = .systemGray6
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseIdentifier)
        tableView.register(AddListItemCell.self, forCellReuseIdentifier: AddListItemCell.reuseIdentifier)
        
        print("tableView has been registered")
        
        let label = UILabel()
        label.text = tableTitle
        label.textAlignment = .center
        label.font = StyleLibrary.timesFont
        label.textColor = .systemTeal
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        print("before constraint")
/*
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])*/
        
        print("after constraint")
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        self.view.addSubview(tableView)
    }
}

extension ListInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return data.count
        }
        //return data.count + 1 // or dataDict?
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddListItemCell.reuseIdentifier, for: indexPath) as? AddListItemCell {
                cell.delegate = self
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell {
                //cell.textField.placeholder = TextConst.getText(i: indexPath.row)
                //cell.delegate = self
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
    }
}

class CommonInputViewController: UIViewController {
    
    let tableView = UITableView()
    /*
    let tableView1 = UITableView()
    let tableView2 = UITableView()
    let tableView3 = UITableView()
    let tableView4 = UITableView()
    let tableView5 = UITableView()
    
    var efficiencyData: [String] = []
    var rivalsData: [String] = []
    var advantagesData: [String] = []
    var sourceData: [String] = []
    var glossaryData: [String:String] = [:]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
        
        /*
        tableView1.frame = self.view.bounds
        tableView2.frame = self.view.bounds
        tableView3.frame = self.view.bounds
        tableView4.frame = self.view.bounds
        tableView5.frame = self.view.bounds*/
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        /*
        let allTables = [
            tableView,
            tableView1,
            tableView2,
            tableView3,
            tableView4,
            tableView5
        ]
        
        let label = UILabel()
        label.text = "Your Text Here"
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        allTables.forEach { table  in
            table.dataSource = self
            table.delegate = self
            table.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
            self.view.addSubview(table)
        }*/
        
        
        self.view.addSubview(tableView)
    }
}

// MARK: realise tableView delegate and dataSource

extension CommonInputViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...2, 4...8, 10...12:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell {
                cell.textField.placeholder = TextConst.getText(i: indexPath.row)
                //cell.delegate = self
                //cell.textField.addTarget(self, action: #selector(<#T##@objc method#>), for: .editingChanged)
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
        case 13...17:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getButton(cell: cell, i: indexPath.row)
            return cell
        default:
            break;
        }
        return UITableViewCell()
    }
}

// MARK: add content to tableView cells

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
        
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)

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
    
    private func getButton(cell: UITableViewCell, i: Int) {
        let button = CustomButton()
        button.i = i
        StyleLibrary.setupButton(button: button, title: ListControllers.vc[i]?.0 ?? "TITLE", view: cell.contentView, constY: 10)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    private func getCity(cell: UITableViewCell) {
        getChoiceList(cell: cell, options: ["Москва", "Санкт-Петербург", "Нижний Новогород", "Пермь"])
    }
    
    @objc
    private func datePickerValueChanged(_ sender: UIDatePicker) {
        // Get the day, month, and year components of the selected date
        let selectedDate = sender.date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: selectedDate)

        let day = components.day ?? 0
        let month = components.month ?? 0
        //let year = components.year ?? 0
        
        let dateString = "«_\(day)_» ___\(TextConst.getMonth(i: month))___"
        print("Selected date: \(dateString)")
        
        PDF.pdf.setupDate(date: dateString)
    }
    
    @objc
    private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Handle the selection of an option
        let selectedSegmentIndex = sender.selectedSegmentIndex
        guard let selectedItem = sender.titleForSegment(at: selectedSegmentIndex) else { return }
        print("Selected item: \(selectedItem)")
        
        PDF.pdf.setupCity(city: selectedItem)
    }
    
    @objc
    private func buttonPressed(_ sender: CustomButton) {
        // Open screen to fill list
        print("opening extra screen...")
        let vc = ListControllers.vc[sender.i]
        print("successfully gor controller")
        if let (title, controller) = vc {
            print("trying to present screen...")
            controller.setupTitle(tableTitle: title)
            controller.setupNum(num: sender.i)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
