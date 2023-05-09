//
//  DocsTesting.swift
//  MentorsJoy
//

import TPPDF

extension DocsTesting: DocsSettings {

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
        // 1 setupIntro(document: doc)
        addNewPage(document: doc)
        //2 setupPurposes(document: doc)
        addNewPage(document: doc)
        //3 setupFunctionality(document: doc)
        addNewPage(document: doc)
        setupDocumentation(document: doc)
        addNewPage(document: doc)
        // 5
        // 6
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
        setupAnnotation(document: document, content: getAnnotation(projectTopic))
    }
}


// MARK: - ПРОГРАММА И МЕТОДИКА ИСПЫТАНИЙ
final class DocsTesting: DocsCommon {
    
    private func setupDocumentation(document: PDFDocument) {
        // setup with sections number 4
        setupDocumentation(document: document, sectionNum: 4)
    }
    
    func getAnnotation(_ projectTopic: String = "PROJECT TOPIC") -> String {
        return "\tТехническое задание – это основной документ, оговаривающий набор требований и порядок создания программного продукта, в соответствии с которым производится разработка программы, ее тестирование и приемка.\n" +
        "\tНастоящее Техническое задание на разработку программы «\(projectTopic)» содержит следующие разделы: «Введение», «Основания для разработки», «Назначение разработки», «Требования к программе», «Требования к программной документации», «Технико-экономические показатели», «Стадии и этапы разработки», «Порядок контроля и приемки» и список использованной литературы.\n" +
        "\tВ разделе «Введение» указано наименование и краткая характеристика области применения программы «\(projectTopic)».\n" +
        "\tВ разделе «Основания для разработки» указан документ, на основании которого ведется разработка и наименование темы разработки.\n" +
        "\tВ разделе «Назначение разработки» указано функциональное и эксплуатационное назначение программного продукта.\n" +
        "\tРаздел «Требования к программе» содержит основные требования к функциональным характеристикам, к интерфейсу программы, к надежности, к условиям эксплуатации, к составу и параметрам технических средств, к информационной и программной совместимости, к маркировке и упаковке, к транспортировке и хранению.\n" +
        "\tРаздел «Требования к программной документации» содержит предварительный состав программной документации и специальные требования к ней.\n" +
        "\tРаздел «Технико-экономические показатели» содержит ориентировочную экономическую эффективность, предполагаемую годовую потребность, экономические преимущества разработки программы «\(projectTopic)».\n" +
        "\tРаздел «Стадии и этапы разработки» содержит этапы, содержание и сроки работ.\n" +
        "\tВ разделе «Порядок контроля и приемки» указаны общие требования к приемке работы.\n" +
        "\tНастоящий документ разработан в соответствии с требованиями:\n" +
        "\t1.\tГОСТ 19.101-77 [2] Виды программ и программных документов.\n" +
        "\t2.\tГОСТ 19.102-77 [3] Стадии разработки.\n" +
        "\t3.\tГОСТ 19.103-77 [4] Обозначения программ и программных документов.\n" +
        "\t4.\tГОСТ 19.104-78 [5] Основные надписи.\n" +
        "\t5.\tГОСТ 19.105-78 [6] Общие требования к программным документам.\n" +
        "\t6.\tГОСТ 19.106-78 [7] Требования к программным документам, выполненным печатным способом.\n" +
        "\t7.\tГОСТ  [] \n" +
        "\tИзменения к  оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78[15]."
    }
}
