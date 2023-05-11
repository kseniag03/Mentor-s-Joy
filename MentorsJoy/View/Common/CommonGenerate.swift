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
        
        let docsList = [titles, doc, lrc]
        
        guard let url = getPDFDoc(documents: docsList) else { return }
        
        // MARK: somehow handle url of this file...
    }
    
    private func getPDFDoc(documents: [PDFDocument]) -> URL? {
        
        let file = "example-\(fileName).pdf"

        let generator = PDFMultiDocumentGenerator(documents: documents)
        //url = try? generator.generateURL(filename: file)
        
        do {
            url = try generator.generateURL(filename: file)
        } catch {
            print("Error generating URL: \(error)")
        }
        
        print("url: \(String(describing: url))")
        
        return url
    }
}
