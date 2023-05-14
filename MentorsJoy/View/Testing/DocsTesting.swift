//
//  DocsTesting.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ПРОГРАММА И МЕТОДИКА ИСПЫТАНИЙ

final class DocsTesting {
    
    let common = DocsCommon()
    
    var params: [String] = []
    
    var tools: [String] = []
    
    var order: [String] = []
    
    var funcCheck: [String] = []
    
    var inputCheck: [String] = []
    
    var outputCheck: [String] = []
    
    var safetyCheck: [String] = []
    
    var interfaceCheck: [String] = []
}

extension DocsTesting: DocsSettings {
    
    func getURLFileName(fileName: String) {
        common.fileName = fileName
    }

    // MARK: - craft doc of definite type (use different methods)
    func craftDoc() -> URL? {
        
        common.docType = .testing
        
        // MARK: launching craft and begin of doc (annotation is crafted separatly)
        common.setupDocBeginBeforeAnnotation()
        setupAnnotation(document: common.doc)
        common.setupDocBeginAfterAnnotation()

        // MARK: main part of doc
        setupObject(document: common.doc)
        common.addNewPage(document: common.doc)
        setupPurpose(document: common.doc)
        common.addNewPage(document: common.doc)
        setupFunctionality(document: common.doc)
        common.addNewPage(document: common.doc)
        setupDocumentation(document: common.doc)
        common.addNewPage(document: common.doc)
        setupToolsAndOrder(document: common.doc)
        common.addNewPage(document: common.doc)
        setupMethods(document: common.doc)
        
        // MARK: end of doc and its full craft
        return common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(common.projectTopic))
    }
}
