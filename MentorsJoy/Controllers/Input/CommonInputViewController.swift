//
//  InputViewController.swift
//  MentorsJoy
//

import UIKit

final class CommonInputViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private let currentType: DocumentType
    
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
    
    private func setupView() {
        
        self.view.backgroundColor = .systemGray6
        tableView.backgroundColor = .systemGray6
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.keyboardDismissMode = .onDrag
        
        tableView.setHeight(self.view.frame.height)
        
        self.view.addSubview(tableView)
    }
}

// MARK: realise tableView delegate and dataSource

extension CommonInputViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentType {
        case .common:
            return TextConst.texts.count
        case .task:
            return TextConst.taskTexts.count
        case .note:
            return TextConst.noteTexts.count
        case .testing:
            return TextConst.testingTexts.count
        case .manual:
            return TextConst.manualTexts.count
        case .programm:
            return TextConst.programTexts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch currentType {
        case .common:
            return getCellCommon(tableView: tableView, indexPath: indexPath)
        case .task:
            return getCellTask(tableView: tableView, indexPath: indexPath)
        case .note:
            return getCellNote(tableView: tableView, indexPath: indexPath)
        case .testing:
            return getCellTesting(tableView: tableView, indexPath: indexPath)
        case .manual:
            return getCellManual(tableView: tableView, indexPath: indexPath)
        case .programm:
            return getCellProgram(tableView: tableView, indexPath: indexPath)
        }
        
        /*
        switch indexPath.row {
        case 0...2, 4...8, 10...12:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell {
                cell.currentIndex = indexPath.row
                cell.textField.placeholder = TextConst.getText(i: indexPath.row)
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
            break
        }
        return UITableViewCell()*/
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
        let maxComponents = DateComponents(year: year + 5, month: 12, day: 31)
        let minComponents = DateComponents(year: year - 5, month: 1, day: 1)
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
        
        StyleLibrary.setupButtonWithoutPlace(button: button, title: text[i]?.name ?? "TITLE")
        
        /*
        cell.contentView.layoutIfNeeded() // Ensure that the constraints have been activated before setting the frame
        button.frame = cell.contentView.bounds */
        
        button.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            button.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            button.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            button.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
        ])

        
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
        let year = components.year ?? 0
        
        let dateString = "«_\(day)_» ___\(TextConst.getMonth(i: month))___"
        print("Selected date: \(dateString)")
        
        PDF.pdf.setupDate(date: dateString)
        PDF.pdf.setupYear(year: "\(year)")
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
        let i = sender.i
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
        
        // Open screen to fill list
        print("opening extra screen...")
        let vc = text[i]?.vc
        if let controller = vc {
            print("successfully got controller")
            controller.setupTitle(tableTitle: text[i]?.name ?? "TITLE")
            controller.setupNum(num: sender.i)
            
            let attributes = [
                NSAttributedString.Key.font: StyleLibrary.timesFont20
            ]
            controller.navigationController?.navigationBar.titleTextAttributes = attributes
            
            navigationController?.pushViewController(controller, animated: true)
        } else {
            print("could not get controller")
        }
    }
}

extension CommonInputViewController {
    
    private func changeCommonMaxLength(cell: TextFieldCell, i: Int) {
        switch i {
        case 0...2, 4...6:
            cell.maxLength = 50
            break;
        case 7:
            cell.maxLength = 5
            break;
        case 8:
            cell.maxLength = 10
            break
        case 10...12, 16, 19:
            cell.maxLength = 2000
            break
        default:
            break;
        }
    }
    
    private func changeNoteMaxLength(cell: TextFieldCell, i: Int) {
        switch i {
        case 0, 3:
            cell.maxLength = 500
            break;
        default:
            break;
        }
    }
    
    // for testing
    
    private func changeManualMaxLength(cell: TextFieldCell, i: Int) {
        switch i {
        case 3, 4, 6:
            cell.maxLength = 700
        default:
            break;
        }
    }
    
    private func changeProgramMaxLength(cell: TextFieldCell, i: Int) {
        switch i {
        case 0, 1:
            cell.maxLength = 50
            break;
        case 2:
            cell.maxLength = 500
        default:
            break;
        }
    }
    
    private func getCellCommon(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0...2, 4...8, 10...12, 23, 26:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell {
                cell.currentType = .common
                cell.currentIndex = indexPath.row
                changeCommonMaxLength(cell: cell, i: indexPath.row);
                cell.textField.placeholder = TextConst.getText(i: indexPath.row, type: currentType)
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
        case 13...22, 24, 25:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getButton(cell: cell, i: indexPath.row)
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    private func getCellTask(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0...1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getButton(cell: cell, i: indexPath.row)
            return cell
        default:
            break;
        }
        return UITableViewCell()
    }
    
    private func getCellNote(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 1...2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getButton(cell: cell, i: indexPath.row)
            return cell
        case 0, 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell {
                cell.currentType = .note
                cell.currentIndex = indexPath.row
                changeNoteMaxLength(cell: cell, i: indexPath.row);
                cell.textField.placeholder = TextConst.getText(i: indexPath.row, type: currentType)
                return cell
            }
            break;
        default:
            break;
        }
        return UITableViewCell()
    }
    
    private func getCellTesting(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0...7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getButton(cell: cell, i: indexPath.row)
            return cell
        default:
            break;
        }
        return UITableViewCell()
    }
    
    private func getCellManual(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0...2, 5, 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getButton(cell: cell, i: indexPath.row)
            return cell
        case 3, 4, 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell {
                cell.currentType = .manual
                cell.currentIndex = indexPath.row
                changeManualMaxLength(cell: cell, i: indexPath.row);
                cell.textField.placeholder = TextConst.getText(i: indexPath.row, type: currentType)
                return cell
            }
            break;
        default:
            break;
        }
        return UITableViewCell()
    }
    
    private func getCellProgram(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getButton(cell: cell, i: indexPath.row)
            return cell
        case 0...2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.reuseIdentifier, for: indexPath) as? TextFieldCell {
                cell.currentType = .programm
                cell.currentIndex = indexPath.row
                changeProgramMaxLength(cell: cell, i: indexPath.row);
                cell.textField.placeholder = TextConst.getText(i: indexPath.row, type: currentType)
                return cell
            }
            break;
        default:
            break;
        }
        return UITableViewCell()
    }
}
