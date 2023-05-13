//
//  CommonDocsPartsContent.swift
//  MentorsJoy
//

import TPPDF

// MARK: setup docs parts content

extension DocsCommon {

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
        uniName[column: 0].allCellsStyle = StyleLibrary.style
        uniName[rows: 0...3].allCellsStyle = StyleLibrary.styleBold
        
        document.add(table: uniName)
    }
    
    private func setupBossNames(document: PDFDocument) {
        let bossNames = PDFTable(rows: 4, columns: 2)
        bossNames.widths = [0.5, 0.5]
        
        bossNames[column: 0].content = [
            try? PDFTableContent(content: "СОГЛАСОВАНО"),
            try? PDFTableContent(content: "Должность"),
            try? PDFTableContent(content: "________________ \(mentorName)"),
            try? PDFTableContent(content: "\(date) \(year) г.")
        ]
        bossNames[column: 0].allCellsAlignment = .center
        bossNames[column: 0].allCellsStyle = StyleLibrary.style
        
        bossNames[column: 1].content = [
            try? PDFTableContent(content: "УТВЕРЖДАЮ"),
            try? PDFTableContent(content: "Академический руководитель образовательной программы «Программная инженерия»\nпрофессор департамента программной инженерии, канд. техн. наук"),
            try? PDFTableContent(content: "________________ В.В. Шилов"),
            try? PDFTableContent(content: "\(date) \(year) г.")
        ]
        bossNames[column: 1].allCellsAlignment = .center
        bossNames[column: 1].allCellsStyle = StyleLibrary.style
        
        document.add(table: bossNames)
    }
    
    func setupTable(document: PDFDocument) {
        let table = PDFTable(rows: 5, columns: 2)
        table.widths = [1.0]
        
        table[column: 0].content = [
            try? PDFTableContent(content: "Подп. и дата"),
            try? PDFTableContent(content: "Инв. № дубл."),
            try? PDFTableContent(content: "Взам. инв. №"),
            try? PDFTableContent(content: "Подп. и дата"),
            try? PDFTableContent(content: "Инв. № подл.")
        ]
        table[column: 0].allCellsAlignment = .center
        table[column: 0].allCellsStyle = StyleLibrary.styleBold
        
        document.add(.contentLeft, table: table)
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
        topic[column: 0].allCellsStyle = StyleLibrary.styleBold
        
        document.add(table: topic)
    }
    
    private func setupPerformer(document: PDFDocument) {
        let performer = PDFTable(rows: 4, columns: 1)
        performer.widths = [1.0]

        performer[column: 0].content = [
            try? PDFTableContent(content: "Исполнитель"),
            try? PDFTableContent(content: "студент группы \(group)"),
            try? PDFTableContent(content: "________________ \(performerName)"),
            try? PDFTableContent(content: "\(date) \(year) г.")
        ]
        performer[column: 0].allCellsAlignment = .right
        performer[column: 0].allCellsStyle = StyleLibrary.style
        
        document.add(table: performer)
    }
    
    private func setupYear(document: PDFDocument) {
        let year = PDFTable(rows: 4, columns: 1)
        year.widths = [1.0]
        
        year[column: 0].content = [
            try? PDFTableContent(content: "\n\n\n\n\n\n\n"),
            try? PDFTableContent(content: "\n\n\n\n\n\n\n"),
            try? PDFTableContent(content: "\n\n\n\n\n\n\n"),
            try? PDFTableContent(content: "\(city) \(self.year)")
        ]
        year[column: 0].allCellsAlignment = .center
        year[column: 0].allCellsStyle = StyleLibrary.styleBold
        
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
        column.allCellsStyle = StyleLibrary.styleBold
        
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
            try? PDFTableContent(content: "Листов x\n\n\n\n"),
            try? PDFTableContent(content: "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
        ]
        column2.allCellsAlignment = .center
        column2.allCellsStyle = StyleLibrary.styleBold
        
        document.add(table: topic)
        
        setupYear(document: document)
    }
    
    func setupAnnotation(document: PDFDocument, content: String) {

        setupPageHeader1(document: document, title: "АННОТАЦИЯ")
        
        let annotation = PDFTable(rows: 1, columns: 1)

        annotation[0, 0].content = try? PDFTableContent(content: content)
        annotation[0, 0].style = StyleLibrary.style
        annotation[column: 0].allCellsAlignment = .left
        
        document.add(.contentLeft, table: annotation)
    }
    
    func setupGlossary(document: PDFDocument, _ dict: [String] = []) {
        
        setupPageHeader1(document: document, title: "ГЛОССАРИЙ")
        setupNumericList(document: document, list: dict)
    }
    
    func setupSourcesList(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ")
        
        let gost = DocsCommon().gost
        
        let table = PDFTable(rows: gost.count + sourceList.count, columns: 1)
        
        for i in 0..<gost.count {
            let content = "\t\(i + 1).\t" + gost[i]
            table[i, 0].content = try? PDFTableContent(content: content)
            table[i, 0].style = StyleLibrary.style
        }
        
        for i in 0..<sourceList.count {
            let j = i + gost.count
            if (j >= 40) {
                break
            }
            let string = sourceList[i]
            let content = "\t\(j).\t" + string
            table[j, 0].content = try? PDFTableContent(content: content)
            table[j, 0].style = StyleLibrary.style
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
                cell.style = StyleLibrary.tableStyle
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
