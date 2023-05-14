//
//  DocsManual.swift
//  MentorsJoy
//

import TPPDF

// MARK: - РУКОВОДСТВО ОПЕРАТОРА (ПРОГРАММИСТА)

final class DocsManual {
    
    let common = DocsCommon()
    
    var techRequires: [String] = []
    
    var programRequires: [String] = []
    
    var userRequires: [String] = []
    
    var download = "Скачать исходные файлы программы"
    
    var launch = "Запустить исполняемый файл"
    
    var execution: [String] = []
    
    var termination = "Для завершения работы с программой необходимо остановить работу программы"
    
    var messages: [String] = []
}

extension DocsManual: DocsSettings {
    
    func getURLFileName(fileName: String) {
        common.fileName = fileName
    }

    // MARK: - craft doc of definite type (use different methods)
    func craftDoc() -> URL? {
        
        common.docType = .manual
        
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
        return common.setupDocEnd()
    }
    
    func setupAnnotation(document: PDFDocument) {
        common.setupAnnotation(document: document, content: getAnnotation(common.projectTopic))
    }
}
