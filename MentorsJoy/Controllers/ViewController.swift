//
//  ViewController.swift
//  MentorsJoy
//

import TPPDF
import UIKit

final class ViewController: UIViewController {
    
    private var currentDocType = DocumentType.task
    
    private let picker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        setupTitle()
        setupButtons()
        setupPicker()
    }
    
    private func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Радость Научника"
        titleLabel.textAlignment = .center
        titleLabel.font = StyleLibrary.timesFont36
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        navigationItem.titleView = titleLabel
    }
    
    private func setupButtons() {
        let generateButton = UIButton()
        StyleLibrary.setupButton(button: generateButton, title: "ГЕНЕРАЦИЯ", view: self.view, constY: 40)
        generateButton.addTarget(self, action: #selector(openPDFButtonPressed), for: .touchUpInside)

        let inputButton = UIButton()
        StyleLibrary.setupButton(button: inputButton, title: "ВВОД", view: self.view, constY: -40, .systemBlue)
        inputButton.addTarget(self, action: #selector(inputTableButtonPressed), for: .touchUpInside)
    }

    @objc
    private func openPDFButtonPressed(_ sender: Any) {
        PDF.pdf.generate(type: currentDocType)
        navigationController?.pushViewController(PDF.pdf, animated: true)
    }
    
    @objc
    private func inputTableButtonPressed(_ sender: Any) {
        navigationController?.pushViewController(PDF.vc, animated: true)
    }
}

extension ViewController {
    
    private func setupPicker() {
        picker.backgroundColor = .white
        picker.layer.cornerRadius = 12
        
        view.addSubview(picker)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        
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
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.backgroundColor = .systemBlue
        pickerLabel.textColor = .white
        var docName = ""
        switch row {
        case 0:
            docName = DocumentType.task.getRus()
            break
        case 1:
            docName = DocumentType.note.getRus()
            break
        case 2:
            docName = DocumentType.testing.getRus()
            break
        case 3:
            docName = DocumentType.manual.getRus()
            break
        case 4:
            docName = DocumentType.programm.getRus()
            break
        default:
            break
        }
        pickerLabel.text = docName
        pickerLabel.font = StyleLibrary.timesFontBold20
        pickerLabel.textAlignment = NSTextAlignment.center
        pickerLabel.layer.cornerRadius = 12
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            print("Выбран док: ТЗ\n")
            currentDocType = DocumentType.task
            break
        case 1:
            print("Выбран док: ПЗ\n")
            currentDocType = DocumentType.note
            break
        case 2:
            print("Выбран док: ПМИ\n")
            currentDocType = DocumentType.testing
            break
        case 3:
            print("Выбран док: РО\n")
            currentDocType = DocumentType.manual
            break
        case 4:
            print("Выбран док: ТП\n")
            currentDocType = DocumentType.programm
            break
        default:
            currentDocType = DocumentType.common
            break
        }
    }
}
