//
//  ManualUniqueDocParts.swift
//  MentorsJoy
//

import TPPDF

// MARK: Docs task unique parts creation

extension DocsManual {
    
    func setupPurposes(document: PDFDocument) {
        
        // setup with sections number 1
        common.setupPurposes(document: document, sectionNum: 1)
    }
    
    func setupConditions(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "УСЛОВИЯ ВЫПОЛНЕНИЯ ПРОГРАММЫ", "2.\t")
        
        common.setupPageHeader2(document: document, title: "Минимальный состав технических средств", number: "2.1.")
        common.setupSimpleText(document: document, text: "\tДля успешного локального запуска программы необходимы:\n")
        common.setupNumericList(document: document, list: techRequires)
        
        common.setupPageHeader2(document: document, title: "Минимальный состав программных средств", number: "2.2.")
        common.setupNumericList(document: document, list: programRequires)
        
        common.setupPageHeader2(document: document, title: "Требования к персоналу (пользователю)", number: "2.3.")
        common.setupNumericList(document: document, list: userRequires)
    }
    
    func setupExecution(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "ВЫПОЛНЕНИЕ ПРОГРАММЫ", "3.\t")
        
        common.setupPageHeader2(document: document, title: "Загрузка программы", number: "3.1.")
        common.setupSimpleText(document: document, text: "\t\(download)")
        
        common.setupPageHeader2(document: document, title: "Запуск программы", number: "3.2.")
        common.setupSimpleText(document: document, text: "\t\(launch)")
        
        common.setupPageHeader2(document: document, title: "Выполнение программы", number: "3.3.")
        common.setupNumericList(document: document, list: execution)
        
        common.setupPageHeader2(document: document, title: "Завершение программы", number: "3.4.")
        common.setupSimpleText(document: document, text: "\t\(termination)")
    }
    
    func setupMessageToOperator(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "СООБЩЕНИЯ ОПЕРАТОРУ", "4.\t")
        common.setupSimpleText(document: document, text: "\tПри работе с программой пользователь сможет увидеть следующие сообщения:")
        common.setupNumericList(document: document, list: messages)
    }
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC", _ projectName: String = "PROJECT NAME") -> String {
        
        return "\tРуководство оператора – это основной документ, оговаривающий набор требований и порядок создания программного продукта, в соответствии с которым производится разработка программы, ее тестирование и приемка.\n" +
        "\tНастоящее Руководство оператора на разработку программы «\(projectTopic)» содержит следующие разделы: «Назначение программы», «Условия выполнения программы», «Выполнение программы» и «Сообщение оператору».\n" +
        "\tВ разделе «Назначение программы» указано функциональное и эксплуатационное назначение программного продукта, а также краткое описание функций, доступных в приложении. \n" +
        "\tРаздел «Условия выполнения программы» содержит требования по минимальным характеристикам устройств, на которые можно будет установить программу, а также требования к человеку, который будет им пользоваться. \n" +
        "\tРаздел «Выполнение программ» содержит пошаговую инструкцию по установке программы, а также инструкцию пользования с подробным описанием всех возможных сценариев работы программы.\n" +
        "\tВ разделе «Сообщения оператору» описаны все возможные сообщения, которые может увидеть оператор в ходе использования программы «\(projectName)».\n" +        
        "\tНастоящий документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 Виды программ и программных документов [2].\n" +
        "\t2.\tГОСТ 19.102-77 Стадии разработки [3].\n" +
        "\t3.\tГОСТ 19.103-77 Обозначения программ и программных документов [4].\n" +
        "\t4.\tГОСТ 19.104-78 Основные надписи [5].\n" +
        "\t5.\tГОСТ 19.105-78 Общие требования к программным документам [6].\n" +
        "\t6.\tГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом [7].\n" +
        "\t7.\tГОСТ 19.505-79 Руководство оператора. Требования к содержанию и оформлению [12] \n" +
        "\tИзменения к  оформляются согласно ГОСТ 19.603-78 [14], ГОСТ 19.604-78 [15]."
    }
}
