//
//  DocsSettings.swift
//  MentorsJoy
//

import TPPDF

protocol DocsSettings {
    
    func getURLFileName(fileName: String)
    
    func craftDoc()
    
    func setupAnnotation(document: PDFDocument)
}
