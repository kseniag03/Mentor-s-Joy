//
//  PDFViewController.swift
//  MentorsJoy
//

import UIKit

class PDFViewController: UIViewController {

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

extension PDFViewController: ChangeDocFieldsValue {
    
    func setupPerformerName(name: String) {
        allDocuments.forEach { doc in
            doc.setupPerformerName(name: name)
        }
    }
    
    func setupMentorName(name: String) {
        allDocuments.forEach { doc in
            doc.setupMentorName(name: name)
        }
    }
    
    func setupYear(year: String) {
        allDocuments.forEach { doc in
            doc.setupYear(year: year)
        }
    }
    
    func setupDate(date: String) {
        allDocuments.forEach { doc in
            doc.setupDate(date: date)
        }
    }
    
    func setupCodifier(code: String) {
        allDocuments.forEach { doc in
            doc.setupCodifier(code: code, type: self.type)
        }
    }
    
    func setupGroup(group: String) {
        allDocuments.forEach { doc in
            doc.setupGroup(group: group)
        }
    }
    
    func setupCity(city: String) {
        allDocuments.forEach { doc in
            doc.setupCity(city: city)
        }
    }
    
    func setupProjectTopic(topic: String) {
        allDocuments.forEach { doc in
            doc.setupProjectTopic(topic: topic)
        }
    }
    
    func setupProjectName(name: String) {
        allDocuments.forEach { doc in
            doc.setupProjectName(name: name)
        }
    }
    
    func setupProjectNameEng(nameEng: String) {
        allDocuments.forEach { doc in
            doc.setupProjectNameEng(nameEng: nameEng)
        }
    }
    
    func setupShortDecription(description: String) {
        allDocuments.forEach { doc in
            doc.setupShortDecription(description: description)
        }
    }
    
    func setupFunctionPurpose(purpose: String) {
        allDocuments.forEach { doc in
            doc.setupFunctionPurpose(purpose: purpose)
        }
    }
    
    func setupExploitPurpose(purpose: String) {
        allDocuments.forEach { doc in
            doc.setupExploitPurpose(purpose: purpose)
        }
    }
    
    func addGlossaryDictItem(key: String, value: String) {
        allDocuments.forEach { doc in
            doc.addGlossaryDictItem(key: key, value: value)
        }
    }
    
    func addSourceListItem(item: String) {
        allDocuments.forEach { doc in
            doc.addSourceListItem(item: item)
        }
    }
    
    
    
}
