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
    
    var type: DocumentType = .task
    
    
    let allDocuments: [DocsCommon] = [
        Docs.shared.task.common,
        Docs.shared.note.common,
        Docs.shared.testing.common,
        Docs.shared.manual.common,
        Docs.shared.program.common
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemIndigo
    }
}

// MARK: create doc using Type in some procotol

extension PDFViewController: GenerateDoc {
    
    func generate(type: DocumentType) {
        print(" GENERATE LAUNCH ")
        self.type = type
        switch type {
        case .task:
            Docs.shared.task.getURLFileName(fileName: "TA")
            Docs.shared.task.craftDoc()
            break
        case .note:
            Docs.shared.note.getURLFileName(fileName: "NO")
            Docs.shared.note.craftDoc()
            break
        case .testing:
            Docs.shared.testing.getURLFileName(fileName: "TE")
            Docs.shared.testing.craftDoc()
            break
        case .manual:
            Docs.shared.manual.getURLFileName(fileName: "MA")
            Docs.shared.manual.craftDoc()
            break
        case .programm:
            Docs.shared.program.getURLFileName(fileName: "PR")
            Docs.shared.program.craftDoc()
            break
        }
    }
}

extension PDFViewController: ChangeTaskFields {
    
    func setupDeadlines(deadlines: [String]) {
        Docs.shared.task.setupDeadlines(deadlines: deadlines)
    }
    
    func addFuncItem(item: String) {
        Docs.shared.task.addFuncItem(item: item)
    }
    
    func addInputItem(item: String) {
        Docs.shared.task.addInputItem(item: item)
    }
    
    func addOutputItem(item: String) {
        Docs.shared.task.addOutputItem(item: item)
    }
    
    func addSafetyItem(item: String) {
        Docs.shared.task.addSafetyItem(item: item)
    }
    
    func addInterfaceItem(item: String) {
        Docs.shared.task.addInterfaceItem(item: item)
    }
    
    func addHardwareItem(item: String) {
        Docs.shared.task.addHardwareItem(item: item)
    }
    
    func addSoftwareItem(item: String) {
        Docs.shared.task.addSoftwareItem(item: item)
    }
    
    func addSpecialItem(item: String) {
        Docs.shared.task.addSpecialItem(item: item)
    }
}

extension PDFViewController: ChangeNoteFields {
    
}

extension PDFViewController: ChangeTestingFields {
    
}

extension PDFViewController: ChangeManualFields {
    
}

extension PDFViewController: ChangeProgramFields {
    
}
