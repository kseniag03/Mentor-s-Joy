//
//  CommonGenerate.swift
//  MentorsJoy
//

import TPPDF

// MARK: craft full doc and generate file URL

extension DocsCommon {
    
    func setupView() {
        print("SETUP DOC LAUNCHED")
        titles.background.color = .systemGray6
        doc.background.color = .systemGray6
        lrc.background.color = .systemGray6
        
        // get definite doc using type from vc picker !!!!!!
        
        let docsList = [titles, doc, lrc]
        guard let url = getPDFDoc(documents: docsList) else { return }
        
        // MARK: somehow handle url of this file...
    }
    
    private func getPDFDoc(documents: [PDFDocument]) -> URL? {
        
        let generator = PDFMultiDocumentGenerator(documents: documents)
        let url = try? generator.generateURL(filename: "example-\(fileName).pdf")
        
        print("url: \(String(describing: url))")
        
        return url
    }
}
