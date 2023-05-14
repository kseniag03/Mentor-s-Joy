//
//  NoteUniqueDocParts.swift
//  MentorsJoy
//

import TPPDF

// MARK: Docs task unique parts creation

extension DocsNote {
    
    func setupIntro(document: PDFDocument) {

        common.setupPageHeader1(document: document, title: "ВВЕДЕНИЕ", "1.\t")
        
        common.setupPageHeader2(document: document, title: "Наименование программы", number: "1.1.")
        
        common.setupSimpleText(document: document, text: "\tНаименование темы разработки – «\(common.projectName)»\n" + "\tНаименование темы разработки на английском языке – «\(common.projectNameEng)»")
        
        common.setupPageHeader2(document: document, title: "Документы, на основании которых ведется разработка", number: "1.2.")
        
        common.setupSimpleText(document: document, text: "\tОснованием для разработки является учебный план подготовки бакалавров по направлению 09.03.04 «Программная инженерия» и утвержденная академическим руководителем тема курсового проекта «\(common.projectTopic)».")
    }
    
    func setupPurposes(document: PDFDocument) {
        
        // setup with sections number 2
        common.setupPurposes(document: document, sectionNum: 2)
        
        // add short description too
        common.setupPageHeader2(document: document, title: "Краткая характеристика области применения программы", number: "2.3.")
        common.setupSimpleText(document: document, text: "\t\(common.shortDecription)")
    }
    
    func setupDevelopmentProcess(document: PDFDocument, _ specialReqs : [String] = []) {
        
        common.setupPageHeader1(document: document, title: "ТЕХНИЧЕСКИЕ ХАРАКТЕРИСТИКИ", "3.\t")
        
        common.setupPageHeader2(document: document, title: "Постановка задачи на разработку программы", number: "3.1.")
        common.setupSimpleText(document: document, text: "\t\(settingTask)")
        
        common.setupPageHeader2(document: document, title: "Описание алгоритма и функционирования программы", number: "3.2.")
        common.setupNumericList(document: document, list: essence)
        
        /*
        // MARK: case when you need to setup titles using user's input is not supported in beta
         
        common.setupPageHeader3(document: document, title: "Выбор архитектуры проекта", number: "3.2.1.")
        
        common.setupPageHeader3(document: document, title: "SOME TEXT", number: "3.2.2.")
        
        common.setupPageHeader3(document: document, title: "SOME TEXT", number: "3.2.3")
        
        common.setupPageHeader3(document: document, title: "SOME TEXT", number: "3.2.4.")*/
        
        
        common.setupPageHeader2(document: document, title: "Описание и обоснование выбора метода организации входных и выходных данных", number: "3.3.")
        common.setupNumericList(document: document, list: putData)
        
        common.setupPageHeader2(document: document, title: "Описание и обоснование выбора состава технических и программных средств", number: "3.4.")
        common.setupSimpleText(document: document, text: "Для работы программы необходим следующий состав технических средств:")
        common.setupNumericList(document: document, list: common.hardware)
        common.setupSimpleText(document: document, text: "Для работы программы необходим следующий состав программных средств:")
        common.setupNumericList(document: document, list: common.software)
        common.setupSimpleText(document: document, text: toolsJustification)
        
        //
    }
    
    func setupTechnoEconomy(document: PDFDocument) {
        
        // setup with sections number 4
        common.setupTechnoEconomy(document: document, sectionNum: 4)
    }
    
    func getAnnotation(projectTopic: String, projectName: String, _ shortDescription : String = "") -> String {
        
        return "\tДанный программный документ представляет собой пояснительную записку к программному проекту «\(projectTopic)», предназначенному для реализации внутренней логики мобильного приложения «\(projectName)», которое будет использоваться студентами. \(shortDescription))\n" +
        "\tВ разделе «Введение» содержится наименование программы, условное обозначение темы разработки, документ, на основании которого ведётся разработка, а также организация, утвердившая данный документ.\n" +
        "\tВ разделе «Назначение и область применения» указано функциональное и эксплуатационное назначение программы и краткая характеристика области её применения.\n" +
        "\tВ разделе «Технические характеристики» содержатся следующие подразделы: постановка задачи на разработку программы, описание функционирования программы, описание алгоритма работы программы, описание и обоснование выбора метода организации входных и выходных данных, описание и обоснование выбора состава технических и программных средств.\n" +
        "\tВ разделе «Ожидаемые технико-экономические показатели» указана предполагаемая потребность и экономические преимущества разработки по сравнению с отечественными и зарубежными образцами или аналогами.\n" +
        "\tПрограммный документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 Виды программ и программных документов [2].\n" +
        "\t2.\tГОСТ 19.102-77 Стадии разработки [3].\n" +
        "\t3.\tГОСТ 19.103-77 Обозначения программ и программных документов [4].\n" +
        "\t4.\tГОСТ 19.104-78 Основные надписи [5].\n" +
        "\t5.\tГОСТ 19.105-78 Общие требования к программным документам [6].\n" +
        "\t6.\tГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом [7].\n" +
        "\t7.\t ГОСТ19.404-79 Пояснительная записка. Требования к содержанию и оформлению [11].\n" +
        "\tИзменения к Пояснительной записке оформляются согласно ГОСТ 19.603-78 [14], ГОСТ 19.604-78 [15]."
    }
}
