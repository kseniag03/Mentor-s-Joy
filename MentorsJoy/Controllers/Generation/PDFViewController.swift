//
//  PDFViewController.swift
//  MentorsJoy
//

import UIKit

final class PDFViewController: UIViewController {

    private class Docs {
        
        static let shared = Docs()
        
        let task = DocsTask()
        let note = DocsNote()
        let testing = DocsTesting()
        let manual = DocsManual()
        let program = DocsProgramm()
    }
    
    var currentType: DocumentType = .common
    
    let allDocuments: [DocsCommon] = [
        Docs.shared.task.common,
        Docs.shared.note.common,
        Docs.shared.testing.common,
        Docs.shared.manual.common,
        Docs.shared.program.common
    ]
    
    private var textField = UITextField()
    
    private var addButton = UIButton()
    
    private var generatedFilePath: URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6

        textField.font = StyleLibrary.timesFont16
        textField.textColor = .systemBlue
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        
        StyleLibrary.setupButton(button: addButton, title: "СОХРАНИТЬ", view: self.view, constY: 30)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(textField)
        textField.setHeight(250)
        textField.pinLeft(to: view, 25)
        textField.pinRight(to: view, 25)
        textField.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        
        textField.placeholder = "Ввести путь к директории для сохранения..."
    }
    
    // MARK: save .pdf file (url in generatedFilePath)
    // MARK: to provided path (path in textField.text, if path is exist)
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        print("clicked to save doc")
        print("save to path: \(String(describing: textField.text))")
        guard let doc = generatedFilePath
        else {
            print("generated doc path is nil")
            return
        }
        guard let path = textField.text, !path.isEmpty
        else {
            print("No path entered")
            return
        }
        
        let fileManager = FileManager.default
        do {
            // MARK: create a URL for the destination path
            let destURL = URL(fileURLWithPath: path).appendingPathComponent(doc.lastPathComponent)

            // MARK: check if the file already exists at the destination path
            if fileManager.fileExists(atPath: destURL.path) {
                let alertController = UIAlertController(title: "Файл уже существует", message: "Файл с таким же именем уже существует в данной директории. Заменить его?", preferredStyle: .alert)

                let replaceAction = UIAlertAction(title: "Заменить", style: .destructive) { _ in
                    do {
                        // MARK: replace the existing file with the new one
                        try fileManager.removeItem(at: destURL)
                        try fileManager.copyItem(at: doc, to: destURL)

                        print("Saved file to path: \(destURL.path)")
                    } catch {
                        print("Error replacing file: \(error.localizedDescription)")
                    }
                }
                alertController.addAction(replaceAction)

                let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)

                present(alertController, animated: true, completion: nil)

                return
            }

            // MARK: copy the file to the destination path
            try fileManager.copyItem(at: doc, to: destURL)
            
            print("Saved file to path: \(destURL.path)")
        } catch {
            print("Error saving file: \(error.localizedDescription)")
        }
    }
}

extension PDFViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 100
        
        // Get the new text value of the text field
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        if let text = newText {
            if (text.count <= maxLength) {
                print("New folder path: \(text)")
            }
            return text.count <= maxLength
        } else {
            return false
        }
    }
}

// MARK: create doc using Type in some procotol

extension PDFViewController: GenerateDoc {
    
    func generate(type: DocumentType) {
        print(" GENERATE LAUNCH ")
        self.currentType = type
        switch currentType {
        case .task:
            Docs.shared.task.getURLFileName(fileName: currentType.getFileName())
            generatedFilePath = Docs.shared.task.craftDoc()
            break
        case .note:
            Docs.shared.note.getURLFileName(fileName: currentType.getFileName())
            generatedFilePath = Docs.shared.note.craftDoc()
            break
        case .testing:
            Docs.shared.testing.getURLFileName(fileName: currentType.getFileName())
            generatedFilePath = Docs.shared.testing.craftDoc()
            break
        case .manual:
            Docs.shared.manual.getURLFileName(fileName: currentType.getFileName())
            generatedFilePath = Docs.shared.manual.craftDoc()
            break
        case .programm:
            Docs.shared.program.getURLFileName(fileName: currentType.getFileName())
            generatedFilePath = Docs.shared.program.craftDoc()
            break
        default:
            break;
        }
    }
}

extension PDFViewController: ChangeTaskFields {

    func addSpecialItem(item: String) {
        Docs.shared.task.addSpecialItem(item: item)
    }
    
    func addDeadline(deadline: String) {
        Docs.shared.task.addDeadline(deadline: deadline)
    }
    
    func removeSpecialItem(i: Int) {
        Docs.shared.task.removeSpecialItem(i: i)
    }
    
    func removeDeadline(i: Int) {
        Docs.shared.task.removeDeadline(i: i)
    }
}

extension PDFViewController: ChangeNoteFields {
    
    func setupSettingTask(settingTask: String) {
        Docs.shared.note.setupSettingTask(settingTask: settingTask)
    }
    
    func setupToolsJustification(justification: String) {
        Docs.shared.note.setupToolsJustification(justification: justification)
    }
    
    func addEssenceItem(item: String) {
        Docs.shared.note.addEssenceItem(item: item)
    }
    
    func addPutItem(item: String) {
        Docs.shared.note.addPutItem(item: item)
    }
    
    func removeEssenceItem(i: Int) {
        Docs.shared.note.removeEssenceItem(i: i)
    }
    
    func removePutItem(i: Int) {
        Docs.shared.note.removePutItem(i: i)
    }
}

extension PDFViewController: ChangeTestingFields {
    
    func addParamsItem(item: String) {
        Docs.shared.testing.addParamsItem(item: item)
    }
    
    func addToolsItem(item: String) {
        Docs.shared.testing.addToolsItem(item: item)
    }
    
    func addOrderItem(item: String) {
        Docs.shared.testing.addOrderItem(item: item)
    }
    
    func addFuncCheckItem(item: String) {
        Docs.shared.testing.addFuncCheckItem(item: item)
    }
    
    func addInputCheckItem(item: String) {
        Docs.shared.testing.addInputCheckItem(item: item)
    }
    
    func addOutputCheckItem(item: String) {
        Docs.shared.testing.addOutputCheckItem(item: item)
    }
    
    func addSafetyCheckItem(item: String) {
        Docs.shared.testing.addSafetyCheckItem(item: item)
    }
    
    func addInterfaceCheckItem(item: String) {
        Docs.shared.testing.addInterfaceCheckItem(item: item)
    }
    
    func removeParamsItem(i: Int) {
        Docs.shared.testing.removeParamsItem(i: i)
    }
    
    func removeToolsItem(i: Int) {
        Docs.shared.testing.removeToolsItem(i: i)
    }
    
    func removeOrderItem(i: Int) {
        Docs.shared.testing.removeOrderItem(i: i)
    }
    
    func removeFuncCheckItem(i: Int) {
        Docs.shared.testing.removeFuncCheckItem(i: i)
    }
    
    func removeInputCheckItem(i: Int) {
        Docs.shared.testing.removeInputCheckItem(i: i)
    }
    
    func removeOutputCheckItem(i: Int) {
        Docs.shared.testing.removeOutputCheckItem(i: i)
    }
    
    func removeSafetyCheckItem(i: Int) {
        Docs.shared.testing.removeSafetyCheckItem(i: i)
    }
    
    func removeInterfaceCheckItem(i: Int) {
        Docs.shared.testing.removeInterfaceCheckItem(i: i)
    }
}

extension PDFViewController: ChangeManualFields {
    
    func setupDownload(download: String) {
        Docs.shared.manual.setupDownload(download: download)
    }
    
    func setupLaunch(launch: String) {
        Docs.shared.manual.setupLaunch(launch: launch)
    }
    
    func setupTermination(termination: String) {
        Docs.shared.manual.setupTermination(termination: termination)
    }
    
    func addTechRequiresItem(item: String) {
        Docs.shared.manual.addTechRequiresItem(item: item)
    }
    
    func addProgramRequiresItem(item: String) {
        Docs.shared.manual.addProgramRequiresItem(item: item)
    }
    
    func addUserRequiresItem(item: String) {
        Docs.shared.manual.addUserRequiresItem(item: item)
    }
    
    func addExecutionItem(item: String) {
        Docs.shared.manual.addExecutionItem(item: item)
    }
    
    func addMessagesItem(item: String) {
        Docs.shared.manual.addMessagesItem(item: item)
    }
    
    func removeTechRequiresItem(i: Int) {
        Docs.shared.manual.removeTechRequiresItem(i: i)
    }
    
    func removeProgramRequiresItem(i: Int) {
        Docs.shared.manual.removeProgramRequiresItem(i: i)
    }
    
    func removeUserRequiresItem(i: Int) {
        Docs.shared.manual.removeUserRequiresItem(i: i)
    }
    
    func removeExecutionItem(i: Int) {
        Docs.shared.manual.removeExecutionItem(i: i)
    }
    
    func removeMessagesItem(i: Int) {
        Docs.shared.manual.removeMessagesItem(i: i)
    }
}

extension PDFViewController: ChangeProgramFields {
    
    func setupProgrammingLanguage(language: String) {
        Docs.shared.program.setupProgrammingLanguage(language: language)
    }
    
    func setupDevelopmentEnvironment(environment: String) {
        Docs.shared.program.setupDevelopmentEnvironment(environment: environment)
    }
    
    func setupFrameworks(frameworks: String) {
        Docs.shared.program.setupFrameworks(frameworks: frameworks)
    }
    
    func addLinkItem(item: String) {
        Docs.shared.program.addLinkItem(item: item)
    }
    
    func removeLinkItem(i: Int) {
        Docs.shared.program.removeLinkItem(i: i)
    }
}
