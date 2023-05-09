//
//  ViewController.swift
//  MentorsJoy
//

import TPPDF
import UIKit

class ViewController: UIViewController {
    
    private var currentDocType = DocumentType.task
    
    private let picker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        setupButtons()
        setupPicker()
    }
    
    private func setupButton(button: UIButton, title : String, constY: CGFloat,
                             _ backColor: UIColor = .systemRed, _ fontColor: UIColor = .white) {
        // Edit an empty button
        button.backgroundColor = backColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        // Center the button horizontally and vertically
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: constY),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupButtons() {
        let generateButton = UIButton()
        setupButton(button: generateButton, title: "GENERATE", constY: 30)
        generateButton.addTarget(self, action: #selector(openPDFButtonPressed), for: .touchUpInside)

        let inputButton = UIButton()
        setupButton(button: inputButton, title: "INPUT", constY: -30, .systemBlue)
        inputButton.addTarget(self, action: #selector(inputTableButtonPressed), for: .touchUpInside)
    }

    @objc
    private func openPDFButtonPressed(_ sender: Any) {
        let pdf = PDFViewController()
        pdf.generate(type: currentDocType)
        navigationController?.pushViewController(pdf, animated: true)
    }
    
    @objc
    private func inputTableButtonPressed(_ sender: Any) {
        let vc = TabBarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController {
    
    private func setupPicker() {
        picker.backgroundColor = .white
        picker.layer.cornerRadius = 10
        
        view.addSubview(picker)
        
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker.pinBottom(to: view.bottomAnchor)
        
        picker.dataSource = self
        picker.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "Техническое задание"
        case 1:
            return "Программа и методика испытаний"
        case 2:
            return "Текст программы"
        case 3:
            return "Пояснительная записка"
        case 4:
            return "Руководство оператора"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            print("Выбран док: ТЗ\n")
            currentDocType = DocumentType.task
            break
        case 1:
            print("Выбран док: ПМИ\n")
            currentDocType = DocumentType.testing
            break
        case 2:
            print("Выбран док: ТП\n")
            currentDocType = DocumentType.programm
            break
        case 3:
            print("Выбран док: ПЗ\n")
            currentDocType = DocumentType.note
            break
        case 4:
            print("Выбран док: РО\n")
            currentDocType = DocumentType.manual
            break
        default:
            break
        }
    }
}
