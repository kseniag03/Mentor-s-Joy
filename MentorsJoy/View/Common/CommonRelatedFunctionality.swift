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
        setupSimpleText(document: document, text: functionPurpose)
        
        setupPageHeader2(document: document, title: "Эксплуатационное назначение", number: "\(sectionNum).2.")
        setupSimpleText(document: document, text: exploitPurpose)
    }
    
    func setupDocumentation(document: PDFDocument, sectionNum: Int) {
        
        setupPageHeader1(document: document, title: "ТРЕБОВАНИЯ К ПРОГРАММНОЙ ДОКУМЕНТАЦИИ", "\(sectionNum).\t")
        
        setupPageHeader2(document: document, title: "Состав программной документации", number: "\(sectionNum).1.")
        
        var docs: [String] = []
        for doc in self.docs {
            let new = doc.replacingOccurrences(of: "PROJECT-NAME", with: projectName)
            docs.append(new)
        }
        setupNumericList(document: document, list: docs)
        
        setupPageHeader2(document: document, title: "Специальные требования к программной документации", number: "\(sectionNum).2.")
        setupNumericList(document: document, list: docsReqs)
    }
    
    func setupTechnoEconomy(document: PDFDocument, sectionNum: Int) {
        
        setupPageHeader1(document: document, title: "ТЕХНИКО­-ЭКОНОМИЧЕСКИЕ ПОКАЗАТЕЛИ", "\(sectionNum).\t")
        
        setupPageHeader2(document: document, title: "Ориентировочная экономическая эффективность", number: "\(sectionNum).1.")
        
        if (efficiency.count > 0) {
            setupNumericList(document: document, list: efficiency)
        } else {
            setupSimpleText(document: document, text: "\tВ рамках данной работы расчет экономической эффективности не предусмотрен.")
        }
        
        setupPageHeader2(document: document, title: "Предполагаемая потребность", number: "\(sectionNum).2.")
        setupSimpleText(document: document, text: "\t\(need)")
        
        setupPageHeader2(document: document, title: "Экономические преимущества разработки по сравнению с отечественными и зарубежными образцами или аналогами", number: "\(sectionNum).3.")
        setupSimpleText(document: document, text: "\tПоиск в сети Интернет на момент создания приложения выявил несколько его аналогов")
        setupNumericList(document: document, list: rivals)
        setupSimpleText(document: document, text: "\tРазрабатываемая программа:")
        setupNumericList(document: document, list: advantages)
        setupSimpleText(document: document, text: "\tГлавной особенностью программного продукта является \(killerFeature)")
    }
}
