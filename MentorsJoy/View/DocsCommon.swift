//
//  DocsCommon.swift
//  MentorsJoy
//

import TPPDF

/*
 0 ФИО исполнителя
 1 ФИО научника
 2 Год
 3 Дата (день, месяц)
 4 Тема проекта
 5 Название проекта
 6 Название проекта на английском языке
 7 Кодификатор (строка вида «xx.xx»
 8 Группа (название группы)

 9 Город (на выбор: Москва, Санкт-Петербург, Нижний Новогород, Пермь)

 10 Краткая характеристика области применения
 11 Функциональное назначение
 12 Эксплуатационное назначение
 // [String], по умолчанию пустой
 13 Список терминов
 14 Список источников
 */

// MARK: - ОБЩИЕ РАЗДЕЛЫ
class DocsCommon {
    
    let titles = PDFDocument(format: .a4)
    let doc = PDFDocument(format: .a4)
    let lrc = PDFDocument(format: .a4)
    
    var performerName = "ФИО"
    
    var mentorName = "ФИО"
    
    var year = "2023"
    
    var date = ""

    var codifier = "RU.17701729.XX.XX-01 X 01-1"
    
    var projectTopic = "Project Topic"
    var projectName = "Project Name"
    var projectNameEng = "English Project Name"

    
    var pageNum = 1
    var section = 1
    
    let style = PDFTableCellStyle(colors: (fill: .clear, text: .black), borders: .none, font: UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPSMT", size: 12.0), size: 12.0))
    
    let styleBold = PDFTableCellStyle(colors: (fill: .clear, text: .black), borders: .none, font: UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPS-BoldMT", size: 12.0), size: 12.0))
    
    let styleItalic = PDFTableCellStyle(colors: (fill: .clear, text: .black), borders: .none, font: UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPS-ItalicMT", size: 12.0), size: 12.0))
    
    let tableStyle = PDFTableCellStyle(
        colors: (fill: .clear, text: .black),
        borders: PDFTableCellBorders(
            left: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5),
            top: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5),
            right: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5),
            bottom: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5)),
        font: UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPSMT", size: 12.0), size: 12.0))
    
    let docs = [
        "«PROJECT-NAME». Техническое задание (ГОСТ 19.201-78 [8]).",
        "«PROJECT-NAME». Программа и методика испытаний (ГОСТ 19.301-79 [9]).",
        "«PROJECT-NAME». Текст программы (ГОСТ 19.401-78 [10]).",
        "«PROJECT-NAME». Пояснительная записка (ГОСТ 19.404-79 [11]).",
        "«PROJECT-NAME». Руководство оператора (ГОСТ 19.505-79 [12])."
    ]
    
    let docsReqs = [
        "Все документы к программе должны быть выполнены в соответствии с ГОСТ 19.106-78 [8] и ГОСТами к каждому виду документа (см. п. 5.1).",
        "Вся документация и программа сдается в электронном виде в формате .PDF в одном архиве формата .ZIP или .RAR.",
        "Итоговый вариант пояснительной записки должен быть загружен в LMS «НИУ ВШЭ» в модуль «ВКР/КР» и проверен системой «Антиплагиат» не позднее, чем за 7 календарных дней до защиты. Лист, подтверждающий загрузку, должен быть сдан в учебный офис вместе со всеми материалами не позже, чем за день до защиты курсовой работы.",
        "Программная документация, отчёт по курсовому проекту, отзыв руководителя курсового проекта, отчёт из системы «Антиплагиат», код или ссылка на репозиторий, а также другие необходимые материалы должны быть загружены в систему LMS «НИУ ВШЭ» в личном кабинете в дисциплине «Курсовая работа» одним архивом не позднее, чем за 3 календарных дня до защиты курсовой работы."
    ]
    
    let gost = [
        "ГОСТ 15150-69 Машины, приборы и другие технические изделия. Исполнения для различных климатических районов. Категории, условия эксплуатации, хранения и транспортирования в части воздействия климатических факторов внешней среды. – М.: Изд-во стандартов, 1997.",
        
        "ГОСТ 19.101-77 Виды программ и программных документов. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.102-77 Стадии разработки. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.103-77 Обозначения программ и программных документов. //Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.104-78 Основные надписи. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.105-78 Общие требования к программным документам. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        // MARK: only one type to sources
        
        "ГОСТ 19.201-78 Техническое задание. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.301-79 Программа и методика испытаний. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.401-78 Текст программы. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.404-79 Пояснительная записка. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.505-79 Руководство оператора. Требования к содержанию и оформлению. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        // MARK: end.
        
        "ГОСТ 19.602-78 Правила дублирования, учета и хранения программных документов, выполненных печатным способом. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.603-78 Общие правила внесения изменений. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001.",
        
        "ГОСТ 19.604-78 Правила внесения изменений в программные документы, выполненные печатным способом. // Единая система программной документации. – М.: ИПК Издательство стандартов, 2001."
    ]
    
    func setupCodifier(code: String, type: DocumentType) {
        var newCodifier = codifier.replacingOccurrences(of: "XX.XX", with: code)
        switch type {
        case .task:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТЗ")
        case .note:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПЗ")
        case .testing:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПМИ")
        case .manual:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "РП")
        case .programm:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТП")
        }
        codifier = newCodifier
    }
    
    func setupYear(year: String) {
        self.year = year
    }
    
    // MARK: setup docs parts styles
    
    func addNewPage(document: PDFDocument) {
        document.createNewPage()
        pageNum += 1
    }
    
    func setupHeader(document: PDFDocument) {
        
        let table = PDFTable(rows: 1, columns: 1)
        table.widths = [1.0]
        
        //table[0, 0].content = try? PDFTableContent(content: "")//"\(pageNum)")
        table[0, 0].content = try? PDFTableContent(content: codifier)
        
        table[0, 0].style = styleBold
        //table[1, 0].style = style
        
        table[column: 0].allCellsAlignment = .center
        
        document.add(.headerCenter, table: table)
    }
    
    func setupFooter(document: PDFDocument) {
        
        let table = PDFTable(rows: 4, columns: 5)
        for row in 0..<table.rows.rows.count {
            for col in 0..<table.columns.columns.count {
                let cell = table[row, col]
                cell.content = try? PDFTableContent(content: " ")
                cell.style = tableStyle
            }
        }
        
        table[0, 0].content = try? PDFTableContent(content: " ")
        table[1, 0].content = try? PDFTableContent(content: "Изм.")
        table[1, 1].content = try? PDFTableContent(content: "Лист")
        table[1, 2].content = try? PDFTableContent(content: "№ докум.")
        table[1, 3].content = try? PDFTableContent(content: "Подп.")
        table[1, 4].content = try? PDFTableContent(content: "Дата")
        
        table[2, 0].content = try? PDFTableContent(content: codifier)
        
        table[3, 0].content = try? PDFTableContent(content: "Инв. № подл.")
        table[3, 1].content = try? PDFTableContent(content: "Подп. и дата")
        table[3, 2].content = try? PDFTableContent(content: "Взам. инв. №")
        table[3, 3].content = try? PDFTableContent(content: "Инв. № дубл.")
        table[3, 4].content = try? PDFTableContent(content: "Подп. и дата")
        
        table[rows: 0...3].allCellsAlignment = .center
        
        // MARK: footer does not want to add table as... I don't know
        
        document.add(.headerCenter, table: table) // to see table
        document.add(.footerLeft, table: table) // ???????? need to fix...

        let font = UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPS-BoldMT", size: 12.0), size: 12.0)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let pageStr = NSAttributedString(string: "\(pageNum)", attributes: attributes)
        
        document.add(.footerCenter, attributedText: pageStr)
    }
    
    func setupPageHeader1(document: PDFDocument, title: String, _ number: String = "") {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: /*"\(section).\t"*/ number + title)
        //section += 1
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .center
        header[0, 0].style = styleBold
        header[1, 0].style = style
        document.add(.contentCenter, table: header)
    }
    
    func setupPageHeader2(document: PDFDocument, title: String, number: String) {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: number + "\t" + title)
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .left
        header[0, 0].style = styleBold
        header[1, 0].style = style
        document.add(.contentCenter, table: header)
    }
    
    func setupPageHeader3(document: PDFDocument, title: String, number: String) {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: "\t" + number + "\t" + title)
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .left
        header[0, 0].style = styleBold
        header[1, 0].style = style
        document.add(.contentCenter, table: header)
    }
    
    func setupNumericList(document: PDFDocument, list: [String]) {
        let table = PDFTable(rows: list.count, columns: 1)
        for i in 0..<list.count {
            let content = "\t\(i + 1).\t" + list[i]
            table[i, 0].content = try? PDFTableContent(content: content)
            table[i, 0].style = style
        }
        table[column: 0].allCellsAlignment = .left
        document.add(.contentLeft, table: table)
    }
    
    func setupSimpleText(document: PDFDocument, text: String) {
        let table = PDFTable(rows: 1, columns: 1)
        table[0, 0].content = try? PDFTableContent(content: text)
        table[0, 0].alignment = .left
        table[0, 0].style = style
        document.add(.contentLeft, table: table)
    }
    
    // MARK: setup docs parts content
    
    func setupTitle(document: PDFDocument, type: DocumentType) {
        setupUniversity(document: document)
        setupBossNames(document: document)
        setupTopic(document: document, type: type)
        setupPerformer(document: document)
        setupYear(document: document)
    }

    private func setupUniversity(document: PDFDocument) {
        let uniName = PDFTable(rows: 7, columns: 1)
        uniName.widths = [1.0]
        
        uniName[column: 0].content = [
            try? PDFTableContent(content: "ПРАВИТЕЛЬСТВО РОССИЙСКОЙ ФЕДЕРАЦИИ"),
            try? PDFTableContent(content: "ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ"),
            try? PDFTableContent(content: "НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ"),
            try? PDFTableContent(content: "«ВЫСШАЯ ШКОЛА ЭКОНОМИКИ»"),
            try? PDFTableContent(content: "Факультет компьютерных наук"),
            try? PDFTableContent(content: "Образовательная программа «Программная инженерия»"),
            try? PDFTableContent(content: "\n")
        ]
        
        uniName[column: 0].allCellsAlignment = .center
        uniName[rows: 0...3].allCellsStyle = styleBold
        uniName[rows: 4...5].allCellsStyle = style
        
        document.add(table: uniName)
    }
    
    private func setupBossNames(document: PDFDocument) {
        let bossNames = PDFTable(rows: 4, columns: 2)
        bossNames.widths = [0.5, 0.5]
        
        bossNames[column: 0].content = [
            try? PDFTableContent(content: "СОГЛАСОВАНО"),
            try? PDFTableContent(content: "Должность"),
            try? PDFTableContent(content: "________________ ФИО"),
            try? PDFTableContent(content: "«___» _____________ \(year) г.")
        ]
        bossNames[column: 0].allCellsAlignment = .center
        bossNames[column: 0].allCellsStyle = style
        
        bossNames[column: 1].content = [
            try? PDFTableContent(content: "УТВЕРЖДАЮ"),
            try? PDFTableContent(content: "Академический руководитель образовательной программы «Программная инженерия»\nпрофессор департамента программной инженерии, канд. техн. наук"),
            try? PDFTableContent(content: "________________ В.В. Шилов"),
            try? PDFTableContent(content: "«___» _____________ \(year) г.")
        ]
        bossNames[column: 1].allCellsAlignment = .center
        bossNames[column: 1].allCellsStyle = style
        
        document.add(table: bossNames)
    }
    
    private func setupTable(document: PDFDocument) {
        // table-troublemaker...
    }
    
    private func setupTopic(document: PDFDocument, type: DocumentType) {
        let topic = PDFTable(rows: 6, columns: 1)
        topic.widths = [1.0]
        
        var docTypeName = "DOCS TYPE NAME"
        
        switch type {
        case .task:
            docTypeName = "Техническое задание"
        case .note:
            docTypeName = "Пояснительная записка"
        case .testing:
            docTypeName = "Программа и методика испытаний"
        case .manual:
            docTypeName = "Руководство оператора"
        case .programm:
            docTypeName = "Текст программы"
        }
        
        topic[column: 0].content = [
            try? PDFTableContent(content: "\n"),
            try? PDFTableContent(content: projectTopic),
            try? PDFTableContent(content: docTypeName),
            try? PDFTableContent(content: "ЛИСТ УТВЕРЖДЕНИЯ"),
            try? PDFTableContent(content: codifier),
            try? PDFTableContent(content: "\n")
        ]
        topic[column: 0].allCellsAlignment = .center
        topic[column: 0].allCellsStyle = styleBold
        
        document.add(table: topic)
    }
    
    private func setupPerformer(document: PDFDocument) {
        let performer = PDFTable(rows: 4, columns: 1)
        performer.widths = [1.0]

        performer[column: 0].content = [
            try? PDFTableContent(content: "Исполнитель"),
            try? PDFTableContent(content: "студент группы GROUP"),
            try? PDFTableContent(content: "________________ ФИО"),
            try? PDFTableContent(content: "«___» _____________ \(year) г.")
        ]
        performer[column: 0].allCellsAlignment = .right
        performer[column: 0].allCellsStyle = style
        
        document.add(table: performer)
    }
    
    private func setupYear(document: PDFDocument) {
        let year = PDFTable(rows: 4, columns: 1)
        year.widths = [1.0]
        
        year[column: 0].content = [
            try? PDFTableContent(content: "\n\n\n\n\n"),
            try? PDFTableContent(content: "\n\n\n\n\n"),
            try? PDFTableContent(content: "\n\n\n\n\n"),
            try? PDFTableContent(content: "Москва \(self.year)")
        ]
        year[column: 0].allCellsAlignment = .center
        year[column: 0].allCellsStyle = styleBold
        
        document.add(table: year)
    }
    
    func setupLU(document: PDFDocument, type: DocumentType) {
        
        let lu = PDFTable(rows: 3, columns: 1)
        lu.widths = [1.0]
        
        let column = lu[column: 0]
        
        column.content = [
            try? PDFTableContent(content: "УТВЕРЖДЕН"),
            try? PDFTableContent(content: codifier),
            try? PDFTableContent(content: "\n")
        ]
        column.allCellsAlignment = .left
        column.allCellsStyle = styleBold
        
        document.add(table: lu)
        
        let topic = PDFTable(rows: 6, columns: 1)
        topic.widths = [1.0]
        
        let column2 = topic[column: 0]
        
        var docTypeName = "DOCS TYPE NAME"
        
        switch type {
        case .task:
            docTypeName = "Техническое задание"
        case .note:
            docTypeName = "Пояснительная записка"
        case .testing:
            docTypeName = "Программа и методика испытаний"
        case .manual:
            docTypeName = "Руководство оператора"
        case .programm:
            docTypeName = "Текст программы"
        }
        
        column2.content = [
            try? PDFTableContent(content: "\n"),
            try? PDFTableContent(content: projectTopic),
            try? PDFTableContent(content: docTypeName),
            try? PDFTableContent(content: codifier),
            try? PDFTableContent(content: "Листов x"),
            try? PDFTableContent(content: "\n")
        ]
        column2.allCellsAlignment = .center
        column2.allCellsStyle = styleBold
        
        document.add(table: topic)
        
        setupYear(document: document)
    }
    
    func setupAnnotation(document: PDFDocument) {

        setupPageHeader1(document: document, title: "АННОТАЦИЯ")
        
        let annotation = PDFTable(rows: 1, columns: 1)
    
        let docsInfo = DocumentType.task.getDocumentObject() as? DocsTask

        annotation[0, 0].content = try? PDFTableContent(content: docsInfo?.getAnnotation())
        annotation[0, 0].style = style
        annotation[column: 0].allCellsAlignment = .left
        
        document.add(.contentLeft, table: annotation)
    }
    
    func setupGlossary(document: PDFDocument, _ dict: [String : String] = [:]) {
        
        setupPageHeader1(document: document, title: "ГЛОССАРИЙ")
        
        var size = 0
        var list: [String] = []
        
        for p in dict {
            let term = p.key
            let description = p.value
            size += 1
            list.append(term + " - " + description)
        }
        
        if size == 0 {
            return
        }

        let table = PDFTable(rows: size, columns: 1)
        
        for i in 0..<size {
            table[i, 0].content = try? PDFTableContent(content: "\t" + list[i])
            table[i, 0].style = style
            table[i, 0].alignment = .left
        }
        
        document.add(.contentLeft, table: table)
    }
    
    func setupSourcesList(document: PDFDocument, _ sourcesList : [String?] = []) {
        
        setupPageHeader1(document: document, title: "СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ")
        
        let gost = DocsCommon().gost
        
        let table = PDFTable(rows: gost.count + sourcesList.count, columns: 1)
        
        for i in 0..<gost.count {
            let content = "\t\(i + 1).\t" + gost[i]
            table[i, 0].content = try? PDFTableContent(content: content)
            table[i, 0].style = style
        }
        
        for i in 0..<sourcesList.count {
            let j = i + gost.count
            if (j >= 40) {
                break
            }
            guard let string = sourcesList[i] else { continue }
            let content = "\t\(j).\t" + string
            table[j, 0].content = try? PDFTableContent(content: content)
            table[j, 0].style = style
        }
        
        table[column: 0].allCellsAlignment = .left
        
        document.add(.contentLeft, table: table)
    }
    
    func setupLRC(document: PDFDocument) {

        setupPageHeader1(document: document, title: "ЛИСТ РЕГИСТРАЦИИ ИЗМЕНЕНИЙ")
        
        let table = PDFTable(rows: 40, columns: 10)
        for row in 0..<table.rows.rows.count {
            for col in 0..<table.columns.columns.count {
                let cell = table[row, col]
                cell.content = try? PDFTableContent(content: " ")
                cell.style = tableStyle
            }
        }
        
        let row0 = table[row: 0]
        row0.content = [
            try? PDFTableContent(content: "Изм."),
            try? PDFTableContent(content: "Номера листов (страниц)"),
            try? PDFTableContent(content: "Номера листов (страниц)"),
            try? PDFTableContent(content: "Номера листов (страниц)"),
            try? PDFTableContent(content: "Номера листов (страниц)"),
            try? PDFTableContent(content: "Всего листов (страниц) в документе"),
            try? PDFTableContent(content: "№ документа"),
            try? PDFTableContent(content: "Входящий № сопроводительного документа и дата"),
            try? PDFTableContent(content: "Подпись"),
            try? PDFTableContent(content: "Дата")
        ]
        row0.allCellsAlignment = .left
        
        let row = table[row: 1]
        row.content = [
            try? PDFTableContent(content: "Изм."),
            try? PDFTableContent(content: "измененных"),
            try? PDFTableContent(content: "замененных"),
            try? PDFTableContent(content: "новых"),
            try? PDFTableContent(content: "аннулированных"),
            try? PDFTableContent(content: "Всего листов (страниц) в документе"),
            try? PDFTableContent(content: "№ документа"),
            try? PDFTableContent(content: "Входящий № сопроводительного документа и дата"),
            try? PDFTableContent(content: "Подпись"),
            try? PDFTableContent(content: "Дата")
        ]
        row.allCellsAlignment = .center
        
        let cell = table[0, 1]
        let mergedCells = table[rows: 0...0, columns: 1...4]
        mergedCells.merge(with: cell)
        
        for i in 0..<10 {
            if (1 <= i && i <= 4) {
                continue
            }
            let merged = table[rows: 0...1, column: i]
            merged.merge()
        }

        document.add(table: table)
    }
    
}
