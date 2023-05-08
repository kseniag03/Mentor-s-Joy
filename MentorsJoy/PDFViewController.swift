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
    
    let doc = PDFDocument(format: .a4)
    
    var pageNum = 1
    
    //let timesNewRomanDescriptor = UIFontDescriptor(name: "TimesNewRomanPSMT", size: 12.0)
    
    // add bold style
    let style = PDFTableCellStyle(colors: (fill: .clear, text: .black), borders: .none, font: UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPSMT", size: 12.0), size: 12.0))
    
    let tableStyle = PDFTableCellStyle(
        colors: (fill: .clear, text: .black),
        borders: PDFTableCellBorders(
            left: PDFLineStyle(type: .full, color: UIColor.black, width: 1),
            top: PDFLineStyle(type: .full, color: UIColor.black, width: 1),
            right: PDFLineStyle(type: .full, color: UIColor.black, width: 1),
            bottom: PDFLineStyle(type: .full, color: UIColor.black, width: 1)),
        font: UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPSMT", size: 12.0), size: 12.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        doc.background.color = .systemGray6
        
        // CRAFT
        setupTitle(document: doc)
        addNewPage()
        
        setupLU(document: doc)
        addNewPage()
        
        setupAnnotation(document: doc)
        addNewPage()
        
        setupSourcesList(document: doc)
        addNewPage()
        
        setupLRC(document: doc)
        
        //
        
        var pagination = PDFPagination()
        pagination.range = (start: 0, end: 30)
        pagination.hiddenPages = [0, 1]
        
        doc.pagination = pagination
        
        // GET URL OF PDF FILE
        
        guard let url = getPDFDoc(document: doc) else { return }
    }
    
    private func addNewPage() {
        doc.createNewPage()
        pageNum += 1
    }
    
    private func setupTitle(document: PDFDocument) {
        setupUniversity(document: document)
        setupBossNames(document: document)
        setupTopic(document: document)
        setupPerformer(document: document)
        setupYear(document: document)
    }
    
    private func setupLU(document: PDFDocument) {
        
        let lu = PDFTable(rows: 3, columns: 1)
        lu.widths = [1.0]
        
        let column = lu[column: 0]
        
        column.content = [
            try? PDFTableContent(content: "УТВЕРЖДЕН"),
            try? PDFTableContent(content: "RU.17701729.XX.XX-01 X 01-1"),
            try? PDFTableContent(content: "\n")
        ]
        column.allCellsAlignment = .left
        column.allCellsStyle = style
        
        document.add(table: lu)
        
        let topic = PDFTable(rows: 6, columns: 1)
        topic.widths = [1.0]
        
        let column2 = topic[column: 0]
        
        column2.content = [
            try? PDFTableContent(content: "\n"),
            try? PDFTableContent(content: "TOPIC NAME"),
            try? PDFTableContent(content: "DOCS TYPE NAME"),
            try? PDFTableContent(content: "RU.17701729.XX.XX-01 X 01-1"),
            try? PDFTableContent(content: "Листов x"),
            try? PDFTableContent(content: "\n")
        ]
        column2.allCellsAlignment = .center
        column2.allCellsStyle = style
        
        document.add(table: topic)
        
        setupYear(document: document)
    }
    
    private func setupHeader(document: PDFDocument) {
        //doc.add(.headerCenter, text: "RU.17701729.XX.XX-01 X 01-1")
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
        table[1, 0].content = try? PDFTableContent(content: "Изм.")
        table[1, 1].content = try? PDFTableContent(content: "Лист")
        table[1, 2].content = try? PDFTableContent(content: "№ докум.")
        table[1, 3].content = try? PDFTableContent(content: "Подп.")
        table[1, 4].content = try? PDFTableContent(content: "Дата")
        
        table[2, 0].content = try? PDFTableContent(content: "RU.17701729.XX.XX-01 X 01-1")
        
        table[3, 0].content = try? PDFTableContent(content: "Инв. № подл.")
        table[3, 1].content = try? PDFTableContent(content: "Подп. и дата")
        table[3, 2].content = try? PDFTableContent(content: "Взам. инв. №")
        table[3, 3].content = try? PDFTableContent(content: "Инв. № дубл.")
        table[3, 4].content = try? PDFTableContent(content: "Подп. и дата")
        
        table[rows: 0...3].allCellsAlignment = .center
        
        document.add(.contentCenter, table: table)
    }
    
    private func setupAnnotation(document: PDFDocument) {
        // MARK: - fix to different tables with diff styles and allignment
        
        let annotation = PDFTable(rows: 2, columns: 1)
        annotation[0, 0].content = try? PDFTableContent(content: "АННОТАЦИЯ")
        
        let docsInfo = DocumentType.task.getDocumentObject() as? DocsTask

        annotation[1, 0].content = try? PDFTableContent(content: docsInfo?.getAnnotation())
        annotation[0, 0].style = style
        annotation[1, 0].style = style
        
        annotation[column: 0].allCellsAlignment = .left
        
        document.add(.contentLeft, table: annotation)
    }
    
    private func setupSourcesList(document: PDFDocument, _ sourcesList : [String?] = []) {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: "СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ")
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[0, 0].style = style
        header[1, 0].style = style
        
        document.add(.contentCenter, table: header)
        
        let table = PDFTable(rows: 40, columns: 1)
        
        //let list = PDFList(indentations: [(pre: 0.0, past: 20.0), (pre: 20.0, past: 20.0), (pre: 40.0, past: 20.0)])
        
        let gost = DocsCommon().gost
        
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
        
        document.add(.contentLeft , table: table)
    }
    
    private func setupLRC(document: PDFDocument) {
        let lu = PDFTable(rows: 1, columns: 1)
        lu.widths = [1.0]
        
        let table = PDFTable(rows: 20, columns: 10)
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
        //row0.allCellsStyle = tableStyle
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
        //row.allCellsStyle = tableStyle
        
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
        
        let column = lu[column: 0]
        column.content = [try? PDFTableContent(content: "ЛИСТ РЕГИСТРАЦИИ ИЗМЕНЕНИЙ")]
        column.allCellsAlignment = .center
        column.allCellsStyle = style
        
        document.add(table: lu)
        document.add(table: table)
    }
    
    private func setupUniversity(document: PDFDocument) {
        let uniName = PDFTable(rows: 6, columns: 1)
        uniName.widths = [1.0]
        
        let c1 = try? PDFTableContent(content: "ПРАВИТЕЛЬСТВО РОССИЙСКОЙ ФЕДЕРАЦИИ")
        let c2 = try? PDFTableContent(content: "ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ")
        let c3 = try? PDFTableContent(content: "НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ «ВЫСШАЯ ШКОЛА ЭКОНОМИКИ»")
        let c4 = try? PDFTableContent(content: "Факультет компьютерных наук")
        let c5 = try? PDFTableContent(content: "Образовательная программа «Программная инженерия»")
        
        //let row = uniName[row: 0]
        let column = uniName[column: 0]
        column.content = [c1, c2, c3, c4, c5, try? PDFTableContent(content: "\n")]
        column.allCellsAlignment = .center
        column.allCellsStyle = style
        
        document.add(table: uniName)
    }
    
    private func setupBossNames(document: PDFDocument) {
        let bossNames = PDFTable(rows: 4, columns: 2)
        bossNames.widths = [0.5, 0.5]
        
        let c11 = try? PDFTableContent(content: "СОГЛАСОВАНО")
        let c12 = try? PDFTableContent(content: "Должность")
        let c13 = try? PDFTableContent(content: "________________ ФИО")
        let c14 = try? PDFTableContent(content: "«___» _____________ YEAR г.")
        
        let c21 = try? PDFTableContent(content: "УТВЕРЖДАЮ")
        let c22 = try? PDFTableContent(content: "Академический руководитель образовательной программы «Программная инженерия»\nпрофессор департамента программной инженерии, канд. техн. наук")
        let c23 = try? PDFTableContent(content: "________________ В.В. Шилов")
        let c24 = try? PDFTableContent(content: "«___» _____________ YEAR г.")
        
        //let row = bossNames[row: 0]
        let mentorColumn = bossNames[column: 0]
        let bossColumn = bossNames[column: 1]
        
        mentorColumn.content = [c11, c12, c13, c14]
        mentorColumn.allCellsAlignment = .center
        mentorColumn.allCellsStyle = style
        
        bossColumn.content = [c21, c22, c23, c24]
        bossColumn.allCellsAlignment = .center
        bossColumn.allCellsStyle = style
        
        document.add(table: bossNames)
    }
    
    private func setupTable(document: PDFDocument) {
        // table-troublemaker...
    }
    
    private func setupTopic(document: PDFDocument) {
        let topic = PDFTable(rows: 6, columns: 1)
        topic.widths = [1.0]
        
        let c1 = try? PDFTableContent(content: "\n")
        let c2 = try? PDFTableContent(content: "TOPIC NAME")
        let c3 = try? PDFTableContent(content: "DOCS TYPE NAME")
        let c4 = try? PDFTableContent(content: "ЛИСТ УТВЕРЖДЕНИЯ")
        let c5 = try? PDFTableContent(content: "RU.17701729.XX.XX-01 X 01-1")
        let c6 = try? PDFTableContent(content: "\n")

        let column = topic[column: 0]
        
        column.content = [c1, c2, c3, c4, c5, c6]
        column.allCellsAlignment = .center
        column.allCellsStyle = style
        
        document.add(table: topic)
    }
    
    private func setupPerformer(document: PDFDocument) {
        let performer = PDFTable(rows: 4, columns: 1)
        performer.widths = [1.0]
        
        let c1 = try? PDFTableContent(content: "Исполнитель")
        let c2 = try? PDFTableContent(content: "студент группы GROUP")
        let c3 = try? PDFTableContent(content: "________________ ФИО")
        let c4 = try? PDFTableContent(content: "«___» _____________ YEAR г.")

        let column = performer[column: 0]
        
        column.content = [c1, c2, c3, c4]
        column.allCellsAlignment = .right
        column.allCellsStyle = style
        
        document.add(table: performer)
    }
    
    private func setupYear(document: PDFDocument) {
        let year = PDFTable(rows: 4, columns: 1)
        year.widths = [1.0]
        
        let c1 = try? PDFTableContent(content: "\n\n\n\n\n")
        let c2 = try? PDFTableContent(content: "\n\n\n\n\n")
        let c3 = try? PDFTableContent(content: "\n\n\n\n\n")
        let c4 = try? PDFTableContent(content: "Москва YEAR")

        let column = year[column: 0]
        
        column.content = [c1, c2, c3, c4]
        column.allCellsAlignment = .center
        column.allCellsStyle = style
        
        document.add(table: year)
    }
    
    private func getPDFDoc(document: PDFDocument) -> URL? {
        /*
        let doc = PDFDocument(format: .a4)
        doc.background.color = .systemGray6
        let t = NSMutableAttributedString(string: "ПРАВИТЕЛЬСТВО РОССИЙСКОЙ ФЕДЕРАЦИИ\nФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ\nНАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ «ВЫСШАЯ ШКОЛА ЭКОНОМИКИ»\nФакультет компьютерных наук\nОбразовательная программа «Программная инженерия»", attributes: [
            .font: UIFont(name: "TimesNewRomanPSMT", size: 12.0),
            .foregroundColor: UIColor.systemRed
        ])
        let text = PDFAttributedTextObject(attributedText: t)
        doc.add(.contentRight, attributedTextObject: text)
        doc.createNewPage()
        */
        
        // MARK: Title
        
        let generator = PDFGenerator(document: document)
        let url = try? generator.generateURL(filename: "ex.pdf")
        
        print("url: \(String(describing: url))")
        
        return url
    }
    
    /*
    var pdfView = PDFView()
    var pdfURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidLayoutSubviews() {
        pdfView.frame = self.view.frame
    }
    
    private func setupView() {
        self.view.addSubview(pdfView)

        DispatchQueue.global(qos: .background).async {
            if let document = PDFDocument(url: self.pdfURL) {
                DispatchQueue.main.async {
                    self.pdfView.document = document
                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    */
}
