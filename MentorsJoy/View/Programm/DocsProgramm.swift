//
//  DocsProgramm.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ТЕКСТ ПРОГРАММЫ

final class DocsProgramm {
    
    let common = DocsCommon()
    
    var programmingLanguage = "Swift 5.7.1"
    
    var developmentEnvironment = "Xcode 14"
    
    var frameworks = "UIKit"
}

extension DocsProgramm: DocsSettings {
    
    func getURLFileName(fileName: String) {
        common.fileName = fileName
    }

    // MARK: - craft doc of definite type (use different methods)
    func craftDoc() {
        // MARK: launching craft and begin of doc (annotation is crafted separatly)
        common.setupDocBeginBeforeAnnotation()
        setupAnnotation(document: common.doc)
        common.setupDocBeginAfterAnnotation()

        // MARK: main part of doc
        setupProgrammCode(document: common.doc)
        
        // MARK: end of doc and its full craft
        common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(common.projectTopic))
    }
}
