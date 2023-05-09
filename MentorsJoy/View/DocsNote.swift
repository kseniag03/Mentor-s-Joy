//
//  DocsNote.swift
//  MentorsJoy
//

import TPPDF

extension DocsNote: DocsSettings {

    // MARK: - craft doc of definite type (use different methods)
    func craftDoc() {
        setupTitle(document: titles, type: .task)
        addNewPage(document: titles)
        setupLU(document: titles, type: .task)
        pageNum += 1
        setupHeader(document: doc)
        setupAnnotation(document: doc)
        addNewPage(document: doc)
        // MARK: add if-cond: if d is empty, do not add glossary at document
        if glossaryList.count > 0 {
            setupGlossary(document: doc, glossaryList)
            addNewPage(document: doc)
        }
        setupIntro(document: doc)
        addNewPage(document: doc)
        setupPurposes(document: doc)
        addNewPage(document: doc)
        setupDevelopmentProcess(document: doc)
        addNewPage(document: doc)
        setupTechnoEconomy(document: doc)
        addNewPage(document: doc)
        setupSourcesList(document: doc)
        pageNum += 1
        setupFooter(document: doc)
        setupLRC(document: lrc)
        
        // MARK: fix pagination or delete it......
        var pagination = PDFPagination()
        pagination.range = (start: 3, end: 7)
        pagination.hiddenPages = [5]
        doc.pagination = pagination
    }
    
    func setupAnnotation(document: PDFDocument) {
        setupAnnotation(document: document, content: getAnnotation(projectTopic: projectTopic, projectName: projectName))
    }
}

// MARK: - ПОЯСНИТЕЛЬНАЯ ЗАПИСКА
final class DocsNote: DocsCommon {
    
    private func setupIntro(document: PDFDocument) {

        setupPageHeader1(document: document, title: "ВВЕДЕНИЕ", "1.\t")
        
        setupPageHeader2(document: document, title: "Наименование программы", number: "1.1.")
        
        setupSimpleText(document: document, text: "\tНаименование темы разработки – «\(projectName)»\n" + "\tНаименование темы разработки на английском языке – «\(projectNameEng)»")
        
        setupPageHeader2(document: document, title: "Документы, на основании которых ведется разработка", number: "1.2.")
        
        setupSimpleText(document: document, text: "\tОснованием для разработки является учебный план подготовки бакалавров по направлению 09.03.04 «Программная инженерия» и утвержденная академическим руководителем тема курсового проекта «\(projectTopic)».")
    }
    
    private func setupPurposes(document: PDFDocument) {
        
        // setup with sections number 2
        setupDocumentation(document: document, sectionNum: 2)
        
        // add short description too
        setupPageHeader2(document: document, title: "Краткая характеристика области применения программы", number: "2.3.")
    }
    
    private func setupDevelopmentProcess(document: PDFDocument, _ specialReqs : [String] = []) {
        
        setupPageHeader1(document: document, title: "ТЕХНИЧЕСКИЕ ХАРАКТЕРИСТИКИ", "3.\t")
        
        setupPageHeader2(document: document, title: "Постановка задачи на разработку программы", number: "3.1.")
        
        setupPageHeader2(document: document, title: "Описание алгоритма и функционирования программы", number: "3.2.")
        
        setupPageHeader3(document: document, title: "Выбор архитектуры проекта", number: "3.2.1")
        
        // MARK: Handle case when you need to setup titles using user's input
        
        setupPageHeader3(document: document, title: "SOME TEXT", number: "3.2.2.")
        
        setupPageHeader3(document: document, title: "SOME TEXT", number: "3.2.3")
        
        setupPageHeader3(document: document, title: "SOME TEXT", number: "3.2.4.")
        
        
        setupPageHeader2(document: document, title: "Описание и обоснование выбора метода организации входных и выходных данных", number: "3.3.")
        
        // MARK: here must be list!!!!!!!
        
        setupPageHeader2(document: document, title: "Описание и обоснование выбора состава технических и программных средств", number: "3.4.")
    }
    
    private func setupTechnoEconomy(document: PDFDocument, _ rivals : [String] = [], _ advantages : [String] = [], _ efficiency : [String] = []) {
        // setup with sections number 4
        setupTechnoEconomy(document: document, sectionNum: 4, rivals, advantages, efficiency)
    }
    
    func getAnnotation(projectTopic: String, projectName: String, _ shortDescription : String = "") -> String {
        return "\tДанный программный документ представляет собой пояснительную записку к программному проекту «\(projectTopic)», предназначенному для реализации внутренней логики мобильного приложения «\(projectName)», которое будет использоваться студентами. \(shortDescription))\n" +
        "\tВ разделе «Введение» содержится наименование программы, условное обозначение темы разработки, документ, на основании которого ведётся разработка, а также организация, утвердившая данный документ.\n" +
        "\tВ разделе «Назначение и область применения» указано функциональное и эксплуатационное назначение программы и краткая характеристика области её применения.\n" +
        "\tВ разделе «Технические характеристики» содержатся следующие подразделы: постановка задачи на разработку программы, описание функционирования программы, описание алгоритма работы программы, описание и обоснование выбора метода организации входных и выходных данных, описание и обоснование выбора состава технических и программных средств.\n" +
        "\tВ разделе «Ожидаемые технико-экономические показатели» указана предполагаемая потребность и экономические преимущества разработки по сравнению с отечественными и зарубежными образцами или аналогами.\n" +
        "\tПрограммный документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 Виды программ и программных документов [2];\n" +
        "\t2.\tГОСТ 19.102-77 Стадии разработки[3];\n" +
        "\t3.\tГОСТ 19.103-77 Обозначения программ и программных документов[4];\n" +
        "\t4.\tГОСТ 19.104-78 Основные надписи[5];\n" +
        "\t5.\tГОСТ 19.105-78 Общие требования к программным документам[6];\n" +
        "\t6.\tГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом [7];\n" +
        "\t7.\t ГОСТ19.404-79 Пояснительная записка. Требования к содержанию и оформлению[11].\n" +
        "\tИзменения к Пояснительной записке оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78 [15]."
    }
}
