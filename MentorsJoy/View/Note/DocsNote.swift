//
//  DocsNote.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ПОЯСНИТЕЛЬНАЯ ЗАПИСКА

final class DocsNote {
    
    let common = DocsCommon()
}

extension DocsNote: DocsSettings {
    
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
        setupPurposes(document: common.doc)
        common.addNewPage(document: common.doc)
        setupDevelopmentProcess(document: common.doc)
        common.addNewPage(document: common.doc)
        setupTechnoEconomy(document: common.doc)
        
        // MARK: end of doc and its full craft
        common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(projectTopic: common.projectTopic, projectName: common.projectName))
    }
}
