//
//  DocsNote.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ПОЯСНИТЕЛЬНАЯ ЗАПИСКА

final class DocsNote {
    
    let common = DocsCommon()
    
    var settingTask = "Разрабатываемая программа должна соответствовать требованиям, описанным в настоящем Техническом задании."
    
    var essence: [String] = []
    
    var putData: [String] = []
    
    var toolsJustification = "Такой выбор технических и программных средств обеспечивает красоту."
    
}

extension DocsNote: DocsSettings {
    
    func getURLFileName(fileName: String) {
        common.fileName = fileName
    }
    
    // MARK: - craft doc of definite type (use different methods)
    func craftDoc() -> URL? {
        
        common.docType = .note
        
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
        return common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(projectTopic: common.projectTopic, projectName: common.projectName))
    }
}
