//
//  InputViewController.swift
//  MentorsJoy
//

import UIKit

class CommonInputViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
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
        tableView.delegate = self
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: TextFieldCell.reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100 // estimate the initial height for the cells
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
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
