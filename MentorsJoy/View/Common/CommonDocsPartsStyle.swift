//
//  CommonDocsPartsStyle.swift
//  MentorsJoy
//

import TPPDF

// MARK: setup docs parts styles

extension DocsCommon {
    
    func addNewPage(document: PDFDocument) {
        document.createNewPage()
        pageNum += 1
    }
    
    func setupDocBeginBeforeAnnotation() {
        print("!!!  CRAFT TASK LAUNCHED  !!!")
        setupTitle(document: titles, type: .task)
        addNewPage(document: titles)
        setupLU(document: titles, type: .task)
        pageNum += 1
        setupHeader(document: doc)
    }
    
    func setupDocBeginAfterAnnotation() {
        addNewPage(document: doc)
        // MARK: add if-cond: if d is empty, do not add glossary at document
        if glossaryList.count > 0 {
            setupGlossary(document: doc, glossaryList)
            addNewPage(document: doc)
        }
    }
    
    func setupDocEnd() {
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
        
        // MARK: transfer all docs parts changes and generate file URL
        setupView()
    }
    
    func setupHeader(document: PDFDocument) {
        
        let table = PDFTable(rows: 1, columns: 1)
        table.widths = [1.0]
        
        //table[0, 0].content = try? PDFTableContent(content: "")//"\(pageNum)")
        table[0, 0].content = try? PDFTableContent(content: codifier)
        
        table[0, 0].style = StyleLibrary.styleBold
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
                cell.style = StyleLibrary.tableStyle
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
        header[0, 0].style = StyleLibrary.styleBold
        header[1, 0].style = StyleLibrary.style
        document.add(.contentCenter, table: header)
    }
    
    func setupPageHeader2(document: PDFDocument, title: String, number: String) {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: number + "\t" + title)
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .left
        header[0, 0].style = StyleLibrary.styleBold
        header[1, 0].style = StyleLibrary.style
        document.add(.contentCenter, table: header)
    }
    
    func setupPageHeader3(document: PDFDocument, title: String, number: String) {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: "\t" + number + "\t" + title)
        header[1, 0].content = try? PDFTableContent(content: "\n")
        header[column: 0].allCellsAlignment = .left
        header[0, 0].style = StyleLibrary.styleBold
        header[1, 0].style = StyleLibrary.style
        document.add(.contentCenter, table: header)
    }
    
    func setupNumericList(document: PDFDocument, list: [String]) {
        let table = PDFTable(rows: list.count, columns: 1)
        for i in 0..<list.count {
            let content = "\t\(i + 1).\t" + list[i]
            table[i, 0].content = try? PDFTableContent(content: content)
            table[i, 0].style = StyleLibrary.style
        }
        table[column: 0].allCellsAlignment = .left
        document.add(.contentLeft, table: table)
    }
    
    func setupSimpleText(document: PDFDocument, text: String) {
        let table = PDFTable(rows: 1, columns: 1)
        table[0, 0].content = try? PDFTableContent(content: text)
        table[0, 0].alignment = .left
        table[0, 0].style = StyleLibrary.style
        document.add(.contentLeft, table: table)
    }
}
