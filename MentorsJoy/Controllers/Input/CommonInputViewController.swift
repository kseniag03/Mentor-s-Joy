//
//  InputViewController.swift
//  MentorsJoy
//

import UIKit

/*
protocol CellDelegate {
    func cellValueDidChange(_ cell: UITableViewCell)
}*/

typealias Action = (String) -> Void

struct Fragment {
    
    let name: String
    
    let action: Action
}

class TextConst {
    
    static let texts: [Int: Fragment] = [
        0: Fragment(name: "ФИО исполнителя", action: PDF.pdf.setupPerformerName),
        1: Fragment(name: "ФИО научного руководителя", action: PDF.pdf.setupMentorName),
        2: Fragment(name: "Год", action: PDF.pdf.setupYear),
        3: Fragment(name: "Дата (день, месяц)", action: PDF.pdf.setupDate),
        4: Fragment(name: "Тема проекта", action: PDF.pdf.setupProjectTopic),
        5: Fragment(name: "Название проекта", action: PDF.pdf.setupProjectName),
        6: Fragment(name: "Название проекта на английском языке", action: PDF.pdf.setupProjectNameEng),
        7: Fragment(name: "Кодификатор (строка вида «xx.xx»)", action: PDF.pdf.setupCodifier),
        8: Fragment(name: "Группа (название группы)", action: PDF.pdf.setupGroup),
        10: Fragment(name: "Краткая характеристика области применения", action: PDF.pdf.setupShortDecription),
        11: Fragment(name: "Функциональное назначение", action: PDF.pdf.setupFunctionPurpose),
        12: Fragment(name: "Эксплуатационное назначение", action: PDF.pdf.setupExploitPurpose)
    ] // MARK: maybe move to static field in some class...
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

// MARK: realise tableView delegate and dataSource

extension CommonInputViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...2, 4...8, 10...12:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TextFieldTableViewCell {
                cell.textField.placeholder = getText(i: indexPath.row)
                //cell.delegate = self
                return cell
            }
            break;
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getDatePicker(cell: cell)
            //cell.delegate = self
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            getCity(cell: cell)
            //cell.delegate = self
            return cell
        case 13...14:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TextFieldTableViewCell {
                cell.textField.placeholder = getText(i: indexPath.row)
                //cell.delegate = self
                return cell
            }
            break;
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
    
    private func getCity(cell: UITableViewCell) {
        getChoiceList(cell: cell, options: ["Москва", "Санкт-Петербург", "Нижний Новогород", "Пермь"])
    }
    
    private func getText(i: Int) -> String {
        return TextConst.texts[i]?.name ?? ""
    }
    
    /*
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
     */
    
    @objc
    private func datePickerValueChanged(_ sender: UIDatePicker) {
        // Get the selected date
        let selectedDate = sender.date

        // Get the day, month, and year components of the selected date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: selectedDate)

        // Convert the components to a string
        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 0
        
        let dateString = "«_\(day)_» _____\(month)_____"

        // Do something with the selected date string
        print("Selected date: \(dateString)")
        
        
       // DocsCommon().setupDate(date: )
        
        PDF.pdf.setupDate(date: dateString)
    }
    
    @objc
    private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Handle the selection of an option
        let selectedSegmentIndex = sender.selectedSegmentIndex
        guard let selectedItem = sender.titleForSegment(at: selectedSegmentIndex) else { return }

        // Do something with the selected item
        print("Selected item: \(selectedItem)")
        
        PDF.pdf.setupCity(city: selectedItem)
        
    }
}

