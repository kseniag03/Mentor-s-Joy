//
//  ProgrammUniqueDocParts.swift
//  MentorsJoy
//

import TPPDF

// MARK: Docs task unique parts creation

extension DocsProgramm {
    
    func setupProgrammCode(document: PDFDocument) {

        common.setupPageHeader1(document: document, title: "ТЕКСТ ПРОГРАММЫ", "1.\t")
        common.setupNumericList(document: document, list: linksWithDescription)
    }
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC") -> String {
        
        return "\tВ документе «Текст программы» приведены ссылки на классы, написанные при реализации серверной части мобильного приложения для помощи в запоминании теоретической части дисциплин, а также их описание (функциональное назначение).\n" +
        
        // MARK: programming language, development environment, functionalPurpose, libraries/frameworks list
        
        "\tПрограмма разработана на языке \(programmingLanguage).\n" +
        "\tСреда разработки - \(developmentEnvironment).\n" +
        "\t\(common.functionPurpose).\n" +
        "\tДля реализации были использованы следующие библиотеки/фреймворки: \(frameworks).\n" +
        
        "\tНастоящий документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 Виды программ и программных документов [2].\n" +
        "\t2.\tГОСТ 19.102-77 Стадии разработки [3].\n" +
        "\t3.\tГОСТ 19.103-77 Обозначения программ и программных документов [4].\n" +
        "\t4.\tГОСТ 19.104-78 Основные надписи. [5]\n" +
        "\t5.\tГОСТ 19.105-78 Общие требования к программным документам [6].\n" +
        "\t6.\tГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом [7].\n" +
        "\t7.\tГОСТ 19.401-78 Текст программы. Требования к содержанию и оформлению. [10] \n" +
        "\tИзменения к  оформляются согласно ГОСТ 19.603-78 [14], ГОСТ 19.604-78 [15]."
    }
}
