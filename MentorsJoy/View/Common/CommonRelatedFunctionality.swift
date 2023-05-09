//
//  CommonRelatedFunctionality.swift
//  MentorsJoy
//

import TPPDF

// MARK: related functionality (such docs parts has several types, but not all)

extension DocsCommon {
    
    func setupPurposes(document: PDFDocument, sectionNum: Int) {
        
        setupPageHeader1(document: document, title: "НАЗНАЧЕНИЕ РАЗРАБОТКИ", "\(sectionNum).\t")
        
        setupPageHeader2(document: document, title: "Функциональное назначение", number: "\(sectionNum).1.")
        
        setupPageHeader2(document: document, title: "Эксплуатационное назначение", number: "\(sectionNum).2.")
    }
    
    func setupDocumentation(document: PDFDocument, sectionNum: Int) {
        
        setupPageHeader1(document: document, title: "ТРЕБОВАНИЯ К ПРОГРАММНОЙ ДОКУМЕНТАЦИИ", "\(sectionNum).\t")
        
        setupPageHeader2(document: document, title: "Состав программной документации", number: "\(sectionNum).1.")
        
        var docs: [String] = []
        for doc in DocsCommon().docs {
            var new = doc.replacingOccurrences(of: "PROJECT-NAME", with: projectName)
            docs.append(new)
        }
        setupNumericList(document: document, list: docs)
        
        setupPageHeader2(document: document, title: "Специальные требования к программной документации", number: "\(sectionNum).2.")
        
        docs.removeAll()
        for doc in DocsCommon().docsReqs {
            var new = doc.replacingOccurrences(of: "PROJECT-NAME", with: projectName)
            docs.append(new)
        }
        setupNumericList(document: document, list: docs)
    }
    
    func setupTechnoEconomy(document: PDFDocument, sectionNum: Int, _ rivals : [String] = [], _ advantages : [String] = [], _ efficiency : [String] = []) {
        
        setupPageHeader1(document: document, title: "ТЕХНИКО­-ЭКОНОМИЧЕСКИЕ ПОКАЗАТЕЛИ", "\(sectionNum).\t")
        
        setupPageHeader2(document: document, title: "Ориентировочная экономическая эффективность", number: "\(sectionNum).1.")
        
        if (efficiency.count > 0) {
            setupNumericList(document: document, list: efficiency)
        } else {
            setupSimpleText(document: document, text: "\tВ рамках данной работы расчет экономической эффективности не предусмотрен.")
        }
        
        setupPageHeader2(document: document, title: "Предполагаемая потребность", number: "\(sectionNum).2.")
        
        // insert text
        
        setupPageHeader2(document: document, title: "Экономические преимущества разработки по сравнению с отечественными и зарубежными образцами или аналогами", number: "\(sectionNum).3.")
        
        // insert list of rivals apps
        
        if (rivals.count > 0) {
            setupNumericList(document: document, list: rivals)
        }
        
        // insert list of project advantages
        
        if (advantages.count > 0) {
            setupNumericList(document: document, list: advantages)
        }
        
        // insert line about killer-feature
    }
}
