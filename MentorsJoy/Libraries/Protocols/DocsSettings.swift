//
//  DocsSettings.swift
//  MentorsJoy
//

import TPPDF

protocol DocsSettings {
    
    func getURLFileName(fileName: String)
    
    func craftDoc() -> URL?
    
    func setupAnnotation(document: PDFDocument)
}
