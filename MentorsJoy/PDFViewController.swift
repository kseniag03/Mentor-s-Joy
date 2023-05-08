//
//  PDFViewController.swift
//  MentorsJoy
//

//import PDFKit
import TPPDF
import UIKit

enum DocumentType: String {
    case task = "task"
    case note = "note"
    case testing = "testing"
    case manual = "manual"
    case programm = "programm"
    
    func getDocumentObject() -> DocsCommon {
        switch self {
        case .task:
            return DocsTask()
        
        case .note:
            return DocsNote()
            
        case .testing:
            return DocsTesting()
            
        case .manual:
            return DocsManual()
        
        case .programm:
            return DocsProgramm()
        }
    }

}

class PDFViewController: UIViewController {
    
    let titles = PDFDocument(format: .a4)
    let doc = PDFDocument(format: .a4)
    let lrc = PDFDocument(format: .a4)
    
    var pageNum = 1
    var section = 1
    
    var codifier = "RU.17701729.XX.XX-01 X 01-1"
    var year = "2023"
    var projectTopic = "Project Topic"
    var projectName = "Project Name"
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupCodifier(code: String, type: DocumentType) {
        var newCodifier = codifier.replacingOccurrences(of: "XX.XX", with: code)
        
        switch type {
        case .task:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТЗ")
        case .note:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПЗ")
        case .testing:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПМИ")
        case .manual:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "РО")
        case .programm:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТП")
        }
        
        codifier = newCodifier
    }
    
    private func setupCodifier(year: String) {
        self.year = year
    }
    
    private func setupView() {
        
        titles.background.color = .systemGray6
        doc.background.color = .systemGray6
        lrc.background.color = .systemGray6
        
        // CRAFT
        setupTitle(document: titles)
        addNewPage(document: titles)
        setupLU(document: titles, type: .task)
        pageNum += 1
        
        setupHeader(document: doc)
        
        setupAnnotation(document: doc)
        
        addNewPage(document: doc)
        
        let d = ["PDF (Portable Document Format)" : "формат файла, используемый для представления электронных документов и обмена ими. PDF-файлы предназначены для сохранения исходного макета, изображений, текстов и шрифтов документа и могут быть просмотрены, распечатаны и совместно использованы на различных платформах и устройствах. Формат PDF обычно используется для таких документов, как контракты, счета, брошюры, руководства и книги, и часто предпочтительнее других форматов файлов из-за его переносимости и простоты использования"]
        setupGlossary(document: doc, d)
        addNewPage(document: doc)
        
        setupIntro(document: doc)
        addNewPage(document: doc)
        
        setupReasons(document: doc)
        addNewPage(document: doc)
        
        setupPurposes(document: doc)
        addNewPage(document: doc)
        
        setupFunctionality(document: doc)
        addNewPage(document: doc)
        
        setupDocumentation(document: doc)
        addNewPage(document: doc)
        
        setupTechnoEconomy(document: doc)
        addNewPage(document: doc)
        
        setupStages(document: doc)
        addNewPage(document: doc)
        
        setupAcceptance(document: doc)
        addNewPage(document: doc)
        
        setupSourcesList(document: doc)
        pageNum += 1
        
        setupFooter(document: doc)
        
        setupLRC(document: lrc)
        
        // GET URL OF PDF FILE
        
        var pagination = PDFPagination()
        pagination.range = (start: 3, end: 7)
        pagination.hiddenPages = [5]
        
        doc.pagination = pagination
        
        let docsList = [titles, doc, lrc]
        
        guard let url = getPDFDoc(documents: docsList) else { return }
    }
    
    private func addNewPage(document: PDFDocument) {
        document.createNewPage()
        pageNum += 1
    }
    
    private func setupTitle(document: PDFDocument) {
        setupUniversity(document: document)
        setupBossNames(document: document)
        setupTopic(document: document, type: .task)
        setupPerformer(document: document)
        setupYear(document: document)
    }
    
    private func setupLU(document: PDFDocument, type: DocumentType) {
        
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
    
    private func setupHeader(document: PDFDocument) {
        
        let table = PDFTable(rows: 2, columns: 1)
        table.widths = [1.0]
        
        table[0, 0].content = try? PDFTableContent(content: "\(pageNum)")
        table[1, 0].content = try? PDFTableContent(content: codifier)
        
        table[0, 0].style = styleBold
        table[1, 0].style = style
        
        table[column: 0].allCellsAlignment = .center
        
        //document.add(.contentCenter, table: table)
        document.add(.headerCenter, table: table)
    }
    
    private func setupFooter(document: PDFDocument) {
        
        let table = PDFTable(rows: 4, columns: 5)
        for row in 0..<table.rows.rows.count {
            for col in 0..<table.columns.columns.count {
                let cell = table[row, col]
                cell.content = try? PDFTableContent(content: " ")
                cell.style = tableStyle
            }
        }
        
        //let st = PDFTableStyle()
        //st.footerStyle = tableStyle
        //st.footerCount = 5
        
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
        
        document.add(.headerCenter, table: table) // to see table
        document.add(.footerLeft, table: table) // ???????? need to fix...
    }
    
    private func setupPageHeader1(document: PDFDocument, title: String, _ number: String = "") {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: /*"\(section).\t"*/ number + title)
        //section += 1
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .center
        header[0, 0].style = styleBold
        header[1, 0].style = style
        document.add(.contentCenter, table: header)
    }
    
    private func setupPageHeader2(document: PDFDocument, title: String, number: String) {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: number + "\t" + title)
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .left
        header[0, 0].style = styleBold
        header[1, 0].style = style
        document.add(.contentCenter, table: header)
    }
    
    private func setupPageHeader3(document: PDFDocument, title: String, number: String) {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: "\t" + number + "\t" + title)
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .left
        header[0, 0].style = styleBold
        header[1, 0].style = style
        document.add(.contentCenter, table: header)
    }
    
    private func setupAnnotation(document: PDFDocument) {

        setupPageHeader1(document: document, title: "АННОТАЦИЯ")
        
        let annotation = PDFTable(rows: 1, columns: 1)
    
        let docsInfo = DocumentType.task.getDocumentObject() as? DocsTask

        annotation[0, 0].content = try? PDFTableContent(content: docsInfo?.getAnnotation())
        annotation[0, 0].style = style
        annotation[column: 0].allCellsAlignment = .left
        
        document.add(.contentLeft, table: annotation)
    }
    
    private func setupGlossary(document: PDFDocument, _ dict: [String : String] = [:]) {
        
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
            table[i, 0].content = try? PDFTableContent(content: list[i])
            table[i, 0].style = style
            table[i, 0].alignment = .left
        }
        
        document.add(.contentLeft, table: table)
    }
    
    private func setupIntro(document: PDFDocument) {

        setupPageHeader1(document: document, title: "ВВЕДЕНИЕ", "1.\t")
        
        setupPageHeader2(document: document, title: "Наименование программы", number: "1.1.")
        
        setupPageHeader2(document: document, title: "Краткая характеристика области применения программы", number: "1.2.")
    }
    
    private func setupReasons(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ОСНОВАНИЯ ДЛЯ РАЗРАБОТКИ", "2.\t")
    }
    
    private func setupPurposes(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "НАЗНАЧЕНИЕ РАЗРАБОТКИ", "3.\t")
        
        setupPageHeader2(document: document, title: "Функциональное назначение", number: "3.1.")
        
        setupPageHeader2(document: document, title: "Эксплуатационное назначение", number: "3.2.")
    }
    
    private func setupFunctionality(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ТРЕБОВАНИЯ К ПРОГРАММЕ", "4.\t")
        
        
        setupPageHeader2(document: document, title: "Требования к функциональным характеристикам", number: "4.1.")
        
        setupPageHeader3(document: document, title: "Требования к составу выполняемых функций", number: "4.1.1")
        
        setupPageHeader3(document: document, title: "Требования к организации входных данных", number: "4.1.2.")
        
        setupPageHeader3(document: document, title: "Требования к организации выходных данных", number: "4.1.3.")
        
        
        setupPageHeader2(document: document, title: "Требования к надежности", number: "4.2.")
        
        setupPageHeader3(document: document, title: "Требования к обеспечению надежного (устойчивого) функционирования программы", number: "4.2.1")
        
        setupPageHeader3(document: document, title: "Время восстановления после отказа", number: "4.2.2.")
        
        
        setupPageHeader2(document: document, title: "Требования к интерфейсу", number: "4.3.")
        
        
        setupPageHeader2(document: document, title: "Условия эксплуатации", number: "4.4.")
        
        setupPageHeader3(document: document, title: "Климатические условия эксплуатации", number: "4.4.1")
        
        setupPageHeader3(document: document, title: "Требования к видам обслуживания", number: "4.4.2.")
        
        
        setupPageHeader2(document: document, title: "Требования к составу и параметрам технических средств", number: "4.5.")
        
        
        setupPageHeader2(document: document, title: "Требования к информационной и программной совместимости", number: "4.6.")
        
        
        setupPageHeader2(document: document, title: "Требования к маркировке и упаковке", number: "4.7.")
        
        
        setupPageHeader2(document: document, title: "Требования к транспортированию и хранению", number: "4.8.")
        
        setupPageHeader3(document: document, title: "Требования к хранению и транспортировке программных документов, предоставляемых в печатном виде", number: "4.8.1")
        
        setupPageHeader3(document: document, title: "Требования к хранению и транспортировке программного продукта", number: "4.8.2.")
        
        
        setupPageHeader2(document: document, title: "Специальные требования", number: "4.9.")
    }
    
    private func setupDocumentation(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ТРЕБОВАНИЯ К ПРОГРАММНОЙ ДОКУМЕНТАЦИИ", "5.\t")
        
        setupPageHeader2(document: document, title: "Состав программной документации", number: "5.1.")
        
        
        var docs: [String] = []
        
        for doc in DocsCommon().docs {
            var new = doc.replacingOccurrences(of: "PROJECT-NAME", with: projectName)
            docs.append(new)
        }
        
        let table = PDFTable(rows: docs.count, columns: 1)
        
        for i in 0..<docs.count {
            let content = "\t\(i + 1).\t" + docs[i]
            table[i, 0].content = try? PDFTableContent(content: content)
            table[i, 0].style = style
        }
        
        table[column: 0].allCellsAlignment = .left
        
        document.add(.contentLeft, table: table)
        
        
        setupPageHeader2(document: document, title: "Специальные требования к программной документации", number: "5.2.")
    }
    
    private func setupTechnoEconomy(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ТЕХНИКО­-ЭКОНОМИЧЕСКИЕ ПОКАЗАТЕЛИ", "6.\t")
        
        setupPageHeader2(document: document, title: "Ориентировочная экономическая эффективность", number: "6.1.")
        
        setupPageHeader2(document: document, title: "Предполагаемая потребность", number: "6.2.")
        
        setupPageHeader2(document: document, title: "Экономические преимущества разработки по сравнению с отечественными и зарубежными образцами или аналогами", number: "6.3.")
    }
    
    private func setupStages(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "СТАДИИ И ЭТАПЫ РАЗРАБОТКИ", "7.\t")
        
        setupPageHeader2(document: document, title: "Необходимые стадии разработки, этапы, содержание работ и сроки выполнения", number: "7.1.")
        
        setupPageHeader2(document: document, title: "Срок разработки конечного продукта", number: "7.2.")
    }
    
    private func setupAcceptance(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ПОРЯДОК КОНТРОЛЯ И ПРИЕМКИ", "8.\t")
        
        setupPageHeader2(document: document, title: "Виды испытаний", number: "8.1.")
        
        setupPageHeader2(document: document, title: "Общие требования к приемке работы", number: "8.2.")
    }
    
    private func setupSourcesList(document: PDFDocument, _ sourcesList : [String?] = []) {
        
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
    
    private func setupLRC(document: PDFDocument) {

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
    
    private func getPDFDoc(documents: [PDFDocument]) -> URL? {
        
        // MARK: Title
        
        //let generator = PDFGenerator(document: document)
        //let url = try? generator.generateURL(filename: "ex.pdf")
        
        let generator = PDFMultiDocumentGenerator(documents: documents)
        let url = try? generator.generateURL(filename: "ex.pdf")
        
        print("url: \(String(describing: url))")
        
        return url
    }
}
