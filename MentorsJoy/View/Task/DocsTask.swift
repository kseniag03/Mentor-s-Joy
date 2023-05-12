//
//  DocsTask.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ТЕХНИЧЕСКОЕ ЗАДАНИЕ

final class DocsTask {
    
    let common = DocsCommon()
    
    var functionality: [String] = []
    var input: [String] = []
    var output: [String] = []
    var safety: [String] = []
    var interface: [String] = []
    var hardware: [String] = []
    var software: [String] = []
    var specialReqs: [String] = []
    
    var customDeadlines: [String] = []
    
    let moveReqs = [
        "В помещении для хранения печатной продукции допустимы температура воздуха от 10°С до 30°С и относительная влажность воздуха от 30% до 60%.",
        "Документацию хранят и используют на расстоянии не менее 0.5 м от источников тепла и влаги. Не допускается хранение печатной продукции в помещениях, где находятся агрессивные агенты – растворители, спирт, бензин.",
        "Не допускается попадание на документацию агрессивных агентов.",
        "Транспортировка производится в специальных контейнерах с применением мер по предотвращению деформации документов, а также проникновения влаги, вредных газов, пыли, солнечных лучей и образованию конденсата внутри контейнеров.",
        "Программные документы, предоставляемые в печатном виде, должны соответствовать общим правилам учета и хранения программных документов, предусмотренных стандартами Единой системы программной документации и соответствовать требованиям ГОСТ 19.602-78 [2]."
    ]
}

extension DocsTask: DocsSettings {
    
    func getURLFileName(fileName: String) {
        print("FILE NAME = \(fileName)")
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
