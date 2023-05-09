//
//  PDFViewController.swift
//  MentorsJoy
//

//import PDFKit
import TPPDF
import UIKit

class PDFViewController: UIViewController {
    
    private var docs = DocsCommon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        //let docs = DocsCommon() // get definite doc using type from vc picker !!!!!!
        
        let docsList = [docs.titles, docs.doc, docs.lrc]
        
        guard let url = getPDFDoc(documents: docsList) else { return }
        
    }
    
    private func getPDFDoc(documents: [PDFDocument]) -> URL? {
        
        let generator = PDFMultiDocumentGenerator(documents: documents)
        let url = try? generator.generateURL(filename: "ex.pdf")
        
        print("url: \(String(describing: url))")
        
        return url
    }

}

protocol GenerateDoc {
    func generate(type: DocumentType)
}

extension PDFViewController: GenerateDoc {
    func generate(type: DocumentType) {
        switch type {
        case .task:
            docs = type.getDocumentObject() as? DocsTask ?? DocsCommon()
            break
        case .note:
            docs = type.getDocumentObject() as? DocsNote ?? DocsCommon()
            break
        case .testing:
            docs = type.getDocumentObject() as? DocsTesting ?? DocsCommon()
            break;
        case .manual:
            docs = type.getDocumentObject() as? DocsManual ?? DocsCommon()
            break;
        case .programm:
            docs = type.getDocumentObject() as? DocsProgramm ?? DocsCommon()
            break;
        }
    }
}
