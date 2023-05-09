//
//  PDFViewController.swift
//  MentorsJoy
//

import UIKit

class PDFViewController: UIViewController {
    
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
        switch type {
        case .task:
            let docs = DocsTask()
            docs.getURLFileName(fileName: "TA")
            docs.craftDoc()
            break
        case .note:
            let docs = DocsNote()
            docs.getURLFileName(fileName: "NO")
            docs.craftDoc()
            break
        case .testing:
            let docs = DocsTesting()
            docs.getURLFileName(fileName: "TE")
            docs.craftDoc()
            break
        case .manual:
            let docs = DocsManual()
            docs.getURLFileName(fileName: "MA")
            docs.craftDoc()
            break
        case .programm:
            let docs = DocsProgramm()
            docs.getURLFileName(fileName: "PR")
            docs.craftDoc()
            break
        }
    }
}
