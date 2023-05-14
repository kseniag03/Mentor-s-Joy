//
//  TestingUniqueDocParts.swift
//  MentorsJoy
//

import TPPDF

// MARK: Docs task unique parts creation

extension DocsTesting {
    
    func setupObject(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "ОБЪЕКТ ИСПЫТАНИЙ", "1.\t")
        
        common.setupPageHeader2(document: document, title: "Наименование программы", number: "1.1.")
        common.setupSimpleText(document: document, text: "\tНаименование темы разработки – «\(common.projectName)»\n" + "\tНаименование темы разработки на английском языке – «\(common.projectNameEng)»")
        
        common.setupPageHeader2(document: document, title: "Краткая характеристика области применения программы", number: "1.2.")
        common.setupSimpleText(document: document, text: "\t\(common.shortDecription)")
    }
    
    func setupPurpose(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "ЦЕЛЬ ИСПЫТАНИЙ", "2.\t")
        common.setupSimpleText(document: document, text: "\tЦелью испытаний является проверка корректного выполнения программных функций, изложенных в п. 4. «Требования к программе» настоящего Технического задания из комплекта документации в соответствии с ЕСПД (Единой системой программной документации).")
    }
    
    func setupFunctionality(document: PDFDocument) {
        
        // setup with section number 3
        common.setupFunctionality(document: document, sectionNum: 3)
    }
    
    func setupDocumentation(document: PDFDocument) {
        
        // setup with sections number 4
        common.setupDocumentation(document: document, sectionNum: 4)
    }
    
    func setupToolsAndOrder(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "СРЕДСТВА И ПОРЯДОК ИСПЫТАНИЙ", "5.\t")
        
        common.setupPageHeader2(document: document, title: "Технические средства, используемые во время испытаний", number: "5.1.")
        common.setupSimpleText(document: document, text: "\tВо время испытаний использовалось устройство со следующими характеристиками:")
        common.setupNumericList(document: document, list: params)
        
        common.setupPageHeader2(document: document, title: "Программные средства, используемые во время испытаний:", number: "5.2.")
        common.setupSimpleText(document: document, text: "\tВо время испытаний использовались следующие программные средства:")
        common.setupNumericList(document: document, list: tools)
        
        common.setupPageHeader2(document: document, title: "Порядок проведения испытаний", number: "5.3.")
        common.setupSimpleText(document: document, text: "\tИспытания должны проводиться в следующем порядке:")
        common.setupNumericList(document: document, list: order)
    }
    
    func setupMethods(document: PDFDocument) {
        
        // setup
        common.setupPageHeader1(document: document, title: "МЕТОДЫ ИСПЫТАНИЙ", "6.\t")
        
        common.setupPageHeader2(document: document, title: "Проверка требований к функциональным характеристикам", number: "6.1.")
        
        common.setupPageHeader3(document: document, title: "Проверка требований к составу выполняемых функций", number: "6.1.1.")
        common.setupNumericList(document: document, list: funcCheck)
        
        common.setupPageHeader3(document: document, title: "Проверка требований к организации входных данных", number: "6.1.2.")
        common.setupNumericList(document: document, list: inputCheck)
        
        common.setupPageHeader3(document: document, title: "Проверка требований к организации выходных данных", number: "6.1.3.")
        common.setupNumericList(document: document, list: outputCheck)
        
        common.setupPageHeader2(document: document, title: "Проверка требований к надежности", number: "6.2.")
        
        common.setupPageHeader3(document: document, title: "Проверка требований к обеспечению надежного (устойчивого) функционирования программы", number: "6.2.1.")
        common.setupNumericList(document: document, list: safetyCheck)
        
        common.setupPageHeader2(document: document, title: "Проверка требований к интерфейсу", number: "6.3.")
        common.setupNumericList(document: document, list: interfaceCheck)
        
        common.setupPageHeader2(document: document, title: "Проверка требований к технической документации", number: "6.4.")
        common.setupSimpleText(document: document, text: "\tСостав программной документации проверяется наличием полного комплекта документов программной документации в системе SmartLMS и всех требуемых подписей. Проверяется соответствие документации требованиям ГОСТ.\n\tКомплект документов полный. Все документы удовлетворяют представленным требованиям.")
    }
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC") -> String {
        
        return "\tПрограмма и методика испытаний — это документ, в котором содержится информация о программном продукте, а также полное описание приемочных испытаний для данного программного продукта.\n" +
        "\tНастоящая Программа и методика испытаний для программы «\(projectTopic)» содержит следующие разделы: «Объект испытаний», «Цель испытаний», «Требования к программе», «Требования к программной документации», «Средства и порядок испытаний», «Методы испытаний», «Приложения».\n" +
        "\tВ разделе «Объект испытаний» указано наименование, краткая характеристика и назначение программы.\n" +
        "\tВ разделе «Цель испытаний» указана цель проведения испытаний.\n" +
        "\tРаздел «Требования к программе» содержит основные требования к программе, которые подлежат проверке во время испытаний (требования к функционалу и интерфейсу).\n" +
        "\tРаздел «Требования к программным документам» содержит состав программной документации, которая представляется на испытания.\n" +
        "\tРаздел «Средства и порядок испытаний» содержит информацию о технических и программных средствах, которые следует использовать во время испытаний, а также порядок этих испытаний." +
        "\tРаздел «Методы испытаний» содержит информацию об используемых методах испытаний.\n" +
        "\tПрограммный документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 Виды программ и программных документов [2].\n" +
        "\t2.\tГОСТ 19.102-77 Стадии разработки [3].\n" +
        "\t3.\tГОСТ 19.103-77 Обозначения программ и программных документов [4].\n" +
        "\t4.\tГОСТ 19.104-78 Основные надписи [5].\n" +
        "\t5.\tГОСТ 19.105-78 Общие требования к программным документам [6].\n" +
        "\t6.\tГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом [7].\n" +
        "\t7.\tГОСТ 19.301-79 Программа и методика испытаний. Требования к содержанию и оформлению [9].\n" +
        "\tИзменения к данному документу оформляются согласно ГОСТ 19.603-78 [14], ГОСТ 19.604-78 [15]."
    }
}
