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
        
        print("CRAFT TASK LAUNCHED")
        
        // MARK: check if URL is alredy exist
        
        if (url == nil) {
            print("there is no doc URL, now generate new")
        } else {
            print("there is alredy existing URL, need to clear docs")
            titles = PDFDocument(format: .a4)
            doc = PDFDocument(format: .a4)
            lrc = PDFDocument(format: .a4)
        }
        
        setupTitle(document: titles, type: docType)
        addNewPage(document: titles)
        setupLU(document: titles, type: docType)
        pageNum += 1
        setupHeader(document: doc, type: docType)
    }
    
    func setupDocBeginAfterAnnotation() {
        
        addNewPage(document: doc)
        
        // MARK: add if-cond: if d is empty, do not add glossary at document
        if glossaryList.count > 0 {
            let glossaryList = self.glossaryList.sorted()
            setupGlossary(document: doc, glossaryList)
            addNewPage(document: doc)
        }
    }
    
    func setupDocEnd() -> URL? {
        
        addNewPage(document: doc)
        setupSourcesList(document: doc)
        pageNum += 1
        setupFooter(document: doc, type: docType)
        
        // MARK: fix pagination or delete it...
        var pagination = PDFPagination()
        pagination.range = (start: 2, end: 100)
        pagination.style = .default
        doc.pagination = pagination
        
        setupLRC(document: lrc)
        
        // MARK: transfer all docs parts changes and generate file URL
        return setupView()
    }
    
    func setupHeader(document: PDFDocument, type: DocumentType) {
        
        let table = PDFTable(rows: 1, columns: 1)
        table.widths = [1.0]
        
        //table[0, 0].content = try? PDFTableContent(content: "")//"\(pageNum)")
        table[0, 0].content = try? PDFTableContent(content: codifierF + code + codifierS + type.getRusShort() + codifierT)
        
        table[0, 0].style = StyleLibrary.styleBold
        //table[1, 0].style = style
        
        table[column: 0].allCellsAlignment = .center
        
        document.add(.headerCenter, table: table)
    }
    
    func setupFooter(document: PDFDocument, type: DocumentType) {
        
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
        
        table[2, 0].content = try? PDFTableContent(content: codifierF + code + codifierS + type.getRusShort() + codifierT)
        
        table[3, 0].content = try? PDFTableContent(content: "Инв. № подл.")
        table[3, 1].content = try? PDFTableContent(content: "Подп. и дата")
        table[3, 2].content = try? PDFTableContent(content: "Взам. инв. №")
        table[3, 3].content = try? PDFTableContent(content: "Инв. № дубл.")
        table[3, 4].content = try? PDFTableContent(content: "Подп. и дата")
        
        table[rows: 0...3].allCellsAlignment = .center
        
        // MARK: footer does not want to add table as... I don't know why
        
        document.add(.headerCenter, table: table) // to see table
        document.add(.footerLeft, table: table) // as this does not pin...

        let font = UIFont(descriptor: UIFontDescriptor(name: "TimesNewRomanPS-BoldMT", size: 12.0), size: 12.0)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let pageStr = NSAttributedString(string: "\(pageNum)", attributes: attributes)
        
        document.add(.footerCenter, attributedText: pageStr)
    }
    
    func setupPageHeader1(document: PDFDocument, title: String, _ number: String = "") {
        let header = PDFTable(rows: 2, columns: 1)
        header[0, 0].content = try? PDFTableContent(content: number + title)
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
        let table = PDFTable(rows: list.count + 1, columns: 1)
        for i in 0..<list.count {
            let content = "\t\(i + 1).\t" + list[i]
            table[i, 0].content = try? PDFTableContent(content: content)
            //table[i, 0].style = StyleLibrary.style
        }
        table[list.count, 0].content = try? PDFTableContent(content: "\n")
        table[column: 0].allCellsAlignment = .left
        table[column: 0].allCellsStyle = StyleLibrary.style
        document.add(.contentLeft, table: table)
    }
    
    func setupSimpleText(document: PDFDocument, text: String) {
        let table = PDFTable(rows: 2, columns: 1)
        table[column: 0].content = [
            try? PDFTableContent(content: text),
            try? PDFTableContent(content: "\n")
        ]
        table[column: 0].allCellsAlignment = .left
        table[column: 0].allCellsStyle = StyleLibrary.style
        document.add(.contentLeft, table: table)
    }
}
