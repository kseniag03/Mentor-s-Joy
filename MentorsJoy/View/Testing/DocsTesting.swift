//
//  DocsTesting.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ПРОГРАММА И МЕТОДИКА ИСПЫТАНИЙ

final class DocsTesting {
    
    let common = DocsCommon()
}

extension DocsTesting: DocsSettings {
    
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
        common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(common.projectTopic))
    }
}
