//
//  DocsManual.swift
//  MentorsJoy
//

import TPPDF

// MARK: - РУКОВОДСТВО ОПЕРАТОРА (ПРОГРАММИСТА)

final class DocsManual {
    
    let common = DocsCommon()
}

extension DocsManual: DocsSettings {
    
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
        setupPurposes(document: common.doc)
        common.addNewPage(document: common.doc)
        setupConditions(document: common.doc)
        common.addNewPage(document: common.doc)
        setupExecution(document: common.doc)
        common.addNewPage(document: common.doc)
        setupMessageToOperator(document: common.doc)
        
        // MARK: end of doc and its full craft
        common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(common.projectTopic))
    }
}
