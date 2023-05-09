//
//  DocsTask.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ТЕХНИЧЕСКОЕ ЗАДАНИЕ

final class DocsTask {
    
    let common = DocsCommon()
}

extension DocsTask: DocsSettings {
    
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
        setupIntro(document: common.doc)
        common.addNewPage(document: common.doc)
        setupReasons(document: common.doc)
        common.addNewPage(document: common.doc)
        setupPurposes(document: common.doc)
        common.addNewPage(document: common.doc)
        setupFunctionality(document: common.doc)
        common.addNewPage(document: common.doc)
        setupDocumentation(document: common.doc)
        common.addNewPage(document: common.doc)
        setupTechnoEconomy(document: common.doc)
        common.addNewPage(document: common.doc)
        setupStages(document: common.doc)
        common.addNewPage(document: common.doc)
        setupAcceptance(document: common.doc)

        // MARK: end of doc and its full craft
        common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(projectTopic: common.projectTopic))
    }
}
