//
//  TaskUniqueDocParts.swift
//  MentorsJoy
//

import TPPDF

// MARK: Docs task unique parts creation

extension DocsTask {
    
    func setupIntro(document: PDFDocument) {

        common.setupPageHeader1(document: document, title: "ВВЕДЕНИЕ", "1.\t")
        
        common.setupPageHeader2(document: document, title: "Наименование программы", number: "1.1.")
        common.setupSimpleText(document: document, text: "\tНаименование темы разработки – «\(common.projectName)»\n" + "\tНаименование темы разработки на английском языке – «\(common.projectNameEng)»")
        
        common.setupPageHeader2(document: document, title: "Краткая характеристика области применения программы", number: "1.2.")
        common.setupSimpleText(document: document, text: common.shortDecription)
    }
    
    func setupReasons(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "ОСНОВАНИЯ ДЛЯ РАЗРАБОТКИ", "2.\t")
        
        common.setupSimpleText(document: document, text: "\tОснованием для разработки является учебный план подготовки бакалавров по направлению 09.03.04 «Программная инженерия» и утвержденная академическим руководителем тема курсового проекта «\(common.projectTopic)».")
    }
    
    func setupPurposes(document: PDFDocument) {
        
        // setup with sections number 3
        common.setupPurposes(document: document, sectionNum: 3)
    }
    
    func setupFunctionality(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "ТРЕБОВАНИЯ К ПРОГРАММЕ", "4.\t")
        
        common.setupPageHeader2(document: document, title: "Требования к функциональным характеристикам", number: "4.1.")
        
        common.setupPageHeader3(document: document, title: "Требования к составу выполняемых функций", number: "4.1.1.")
        common.setupNumericList(document: document, list: functionality)
        
        common.setupPageHeader3(document: document, title: "Требования к организации входных данных", number: "4.1.2.")
        common.setupNumericList(document: document, list: input)
        
        common.setupPageHeader3(document: document, title: "Требования к организации выходных данных", number: "4.1.3.")
        common.setupNumericList(document: document, list: output)
        
        common.setupPageHeader2(document: document, title: "Требования к надежности", number: "4.2.")
        
        common.setupPageHeader3(document: document, title: "Требования к обеспечению надежного (устойчивого) функционирования программы", number: "4.2.1.")
        common.setupNumericList(document: document, list: safety)
        
        common.setupPageHeader3(document: document, title: "Время восстановления после отказа", number: "4.2.2.")
        
        common.setupSimpleText(document: document, text: "\tВремя восстановления программы не должно превышать времени перезагрузки операционной системы или времени устранения технических неполадок.")
        
        common.setupPageHeader2(document: document, title: "Требования к интерфейсу", number: "4.3.")
        common.setupNumericList(document: document, list: interface)
        
        common.setupPageHeader2(document: document, title: "Условия эксплуатации", number: "4.4.")
        
        common.setupPageHeader3(document: document, title: "Климатические условия эксплуатации", number: "4.4.1.")
        common.setupSimpleText(document: document, text: "\tКлиматические условия эксплуатации, при которых программа обязана выполнять весь функционал, должны удовлетворять требованиям, предъявляемым к смартфонам в части условий их эксплуатации.\n" + "\tУстройство предназначено для работы в закрытом отапливаемом помещении со стабильными климатическими условиями категории согласно ГОСТ 15150-69 [1].")
        
        common.setupPageHeader3(document: document, title: "Требования к видам обслуживания", number: "4.4.2.")
        common.setupSimpleText(document: document, text: "\tНа устройстве, где производится эксплуатация программы, необходимо обеспечить регулярную проверку оборудования и программного обеспечения на наличие неполадок. Обеспечить защиту устройства от воздействия вредоносных программ.\n" + "\tЕсли в программе возникли непредвиденные неполадки, то рекомендуется написать разработчику на адрес электронной почты, указанный в всплывающем окне «Помощь», и сообщить о них. Разработчик обязан принять меры по устранению неполадок и обновить программу, уведомив пользователя.")
        
        common.setupPageHeader2(document: document, title: "Требования к составу и параметрам технических средств", number: "4.5.")
        common.setupSimpleText(document: document, text: "\tДля работы программы необходим следующий состав технических средств:\n")
        common.setupNumericList(document: document, list: hardware)
        
        common.setupPageHeader2(document: document, title: "Требования к информационной и программной совместимости", number: "4.6.")
        common.setupNumericList(document: document, list: software)
        
        common.setupPageHeader2(document: document, title: "Требования к маркировке и упаковке", number: "4.7.")
        
        common.setupSimpleText(document: document, text: "\tПрограмма поставляется в виде архива со всей программной документацией и приложениями: презентацией, исполняемыми файлами и исходным кодом. Программное изделие должно иметь маркировку с наименованием, темой разработки, ФИО исполнителя и датой выпуска.")
        
        common.setupPageHeader2(document: document, title: "Требования к транспортированию и хранению", number: "4.8.")
        
        common.setupPageHeader3(document: document, title: "Требования к хранению и транспортировке программных документов, предоставляемых в печатном виде", number: "4.8.1.")
        
        common.setupSimpleText(document: document, text: "\tТребования к транспортировке и хранению программных документов являются стандартными и должны соответствовать общим требованиям хранения и транспортировки печатной продукции:")
        common.setupNumericList(document: document, list: moveReqs)
        
        common.setupPageHeader3(document: document, title: "Требования к хранению и транспортировке программного продукта", number: "4.8.2.")
        
        common.setupSimpleText(document: document, text: "\tХранение программного продукта совместно с документацией выполняется в репозитории GitHub. Программа в электронном виде может храниться и транспортироваться на USB-носителе, съёмном SSD или HDD диске, а также в облачном хранилище.")
        
        common.setupPageHeader2(document: document, title: "Специальные требования", number: "4.9.")
        
        if (specialReqs.count > 0) {
            common.setupNumericList(document: document, list: specialReqs)
        } else {
            common.setupSimpleText(document: document, text: "\tСпециальные требования к данной программе не предъявляются.")
        }
    }
    
    func setupDocumentation(document: PDFDocument) {
        
        // setup with sections number 5
        common.setupDocumentation(document: document, sectionNum: 5)
    }
    
    func setupTechnoEconomy(document: PDFDocument) {
        
        // setup with sections number 6
        common.setupTechnoEconomy(document: document, sectionNum: 6)
    }
    
    func setupStages(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "СТАДИИ И ЭТАПЫ РАЗРАБОТКИ", "7.\t")
        
        common.setupPageHeader2(document: document, title: "Необходимые стадии разработки, этапы, содержание работ и сроки выполнения", number: "7.1.")
        
        common.setupSimpleText(document: document, text: "\tСтадии, этапы разработки и содержание работ выявлены с учетом ГОСТ 19.102-77 [3].")
        let deadlines = Array(repeating: "xx.xx.xxxx-xx.xx.xxxx", count: 18)
        setupStagesTable1(document: document, deadlines: customDeadlines.count == 18 ? customDeadlines : deadlines)
        common.addNewPage(document: document)
        setupStagesTable2(document: document, deadlines: customDeadlines.count == 18 ? customDeadlines : deadlines)
        
        common.setupPageHeader2(document: document, title: "Срок разработки конечного продукта", number: "7.2.")
        
        common.setupSimpleText(document: document, text: "\tПрограммный продукт (программа и документация) должен быть завершен не позднее утвержденного приказом декана ФКН НИУ ВШЭ срока защиты курсовой работы.\n" + "\tИсполнитель – студент группы \(common.group), \(common.performerName).")

    }
    
    func setupAcceptance(document: PDFDocument) {
        
        common.setupPageHeader1(document: document, title: "ПОРЯДОК КОНТРОЛЯ И ПРИЕМКИ", "8.\t")
        
        common.setupPageHeader2(document: document, title: "Виды испытаний", number: "8.1.")
        
        common.setupSimpleText(document: document, text: "\tПроводится проверка программы на корректное исполнение, обработку входных и выходных данных и удобство пользования. Помимо этого, осуществляется проверка на соответствие требованиям технического задания. Тестирование осуществляется исполнителем по «Программе и методике испытаний» (ГОСТ 19-301-79 [9]), а также пункту 5.2. технического задания.")
        
        common.setupPageHeader2(document: document, title: "Общие требования к приемке работы", number: "8.2.")
        
        common.setupSimpleText(document: document, text: "\tПрием программы происходит при ее полной работоспособности при различных входных данных, при выполнении всего функционала, указанного в пункте 4.1.1 технического задания, при выполнении требований, указанных в пункте 4.2. технического задания.\n" + "\tЗащита курсового проекта осуществляется комиссией, состоящей из преподавателей департамента программной инженерии, в утвержденные приказом декана ФКН НИУ ВШЭ сроки.")
    }
    
    func getAnnotation(projectTopic: String) -> String {
        
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
        "\t1.\tГОСТ 19.101-77 Виды программ и программных документов [2].\n" +
        "\t2.\tГОСТ 19.102-77 Стадии разработки [3].\n" +
        "\t3.\tГОСТ 19.103-77 Обозначения программ и программных документов [4].\n" +
        "\t4.\tГОСТ 19.104-78 Основные надписи [5].\n" +
        "\t5.\tГОСТ 19.105-78 Общие требования к программным документам [6].\n" +
        "\t6.\tГОСТ 19.106-78 Требования к программным документам, выполненным печатным способом [7].\n" +
        "\t7.\tГОСТ 19.201-78 Техническое задание. Требования к содержанию и оформлению [8].\n" +
        "\tИзменения к Техническому заданию оформляются согласно ГОСТ 19.603-78 [14], ГОСТ 19.604-78 [15]."
    }
    
    private func setupStagesTable1(document: PDFDocument, deadlines: [String]) {
        
        let table = PDFTable(rows: 10, columns: 4)
        for row in 0..<table.rows.rows.count {
            for col in 0..<table.columns.columns.count {
                let cell = table[row, col]
                cell.content = try? PDFTableContent(content: " ")
                cell.alignment = .left
                cell.style = StyleLibrary.tableStyle
            }
        }
        
        table[row: 0].content = [
            try? PDFTableContent(content: "Стадии разработки"),
            try? PDFTableContent(content: "Этапы разработки"),
            try? PDFTableContent(content: "Содержание работ"),
            try? PDFTableContent(content: "Сроки выполнения"),
        ]
        
        // MARK: column with stages
        
        table[1, 0].content = try? PDFTableContent(content: "Техническое задание")
        var merged = table[rows: 1...9, column: 0]
        merged.merge()
        
        // MARK: column with stages' phases
        
        table[1, 1].content = try? PDFTableContent(content: "Обоснование необходимости разработки программы")
        table[3, 1].content = try? PDFTableContent(content: "Научно-исследовательские работы")
        table[6, 1].content = try? PDFTableContent(content: "Разработка и утверждение технического задания")
        merged = table[rows: 1...2, column: 1]
        merged.merge()
        merged = table[rows: 3...5, column: 1]
        merged.merge()
        merged = table[rows: 6...9, column: 1]
        merged.merge()
        
        // MARK: column with stages' phases' tasks
        
        table[column: 2].content = [
            try? PDFTableContent(content: "Содержание работ"),
            try? PDFTableContent(content: "Постановка задачи"),
            try? PDFTableContent(content: "Сбор исходных материалов"),
            try? PDFTableContent(content: "Определение структуры входных и выходных данных"),
            try? PDFTableContent(content: "Определение требований к техническим средствам"),
            try? PDFTableContent(content: "Обоснование принципиальной возможности решения поставленной задачи"),
            try? PDFTableContent(content: "Обоснование принципиальной возможности решения поставленной задачи"),
            try? PDFTableContent(content: "Обоснование принципиальной возможности решения поставленной задачи"),
            try? PDFTableContent(content: "Выбор языка программирования"),
            try? PDFTableContent(content: "Согласование и утверждение технического задания")
        ]
        
        // MARK: fill deadlines dates
        
        for i in 1..<10 {
            table[i, 3].content = try? PDFTableContent(content: deadlines[i])
        }
        
        document.add(.contentLeft, table: table)
    }
    
    private func setupStagesTable2(document: PDFDocument, deadlines: [String]) {
        
        let table = PDFTable(rows: 9, columns: 4)
        for row in 0..<table.rows.rows.count {
            for col in 0..<table.columns.columns.count {
                let cell = table[row, col]
                cell.content = try? PDFTableContent(content: " ")
                cell.alignment = .left
                cell.style = StyleLibrary.tableStyle
            }
        }
        
        table[row: 0].content = [
            try? PDFTableContent(content: "Стадии разработки"),
            try? PDFTableContent(content: "Этапы разработки"),
            try? PDFTableContent(content: "Содержание работ"),
            try? PDFTableContent(content: "Сроки выполнения"),
        ]
        
        // MARK: column with stages
        
        table[1, 0].content = try? PDFTableContent(content: "Рабочий проект")
        table[6, 0].content = try? PDFTableContent(content: "Внедрение")
        var merged = table[rows: 1...5, column: 0]
        merged.merge()
        merged = table[rows: 6...8, column: 0]
        merged.merge()
        
        // MARK: column with stages' phases
        
        table[1, 1].content = try? PDFTableContent(content: "Разработка программы")
        table[2, 1].content = try? PDFTableContent(content: "Разработка программной документации")
        table[3, 1].content = try? PDFTableContent(content: "Испытания программы")
        table[6, 1].content = try? PDFTableContent(content: "Подготовка, защита и передача программы")
        merged = table[rows: 3...5, column: 1]
        merged.merge()
        merged = table[rows: 6...8, column: 1]
        merged.merge()
        
        // MARK: column with stages' phases' tasks
        
        table[column: 2].content = [
            try? PDFTableContent(content: "Содержание работ"),
            try? PDFTableContent(content: "Программирование и отладка программы"),
            try? PDFTableContent(content: "Разработка программных документов в соответствии с требованиями ГОСТ 19.101-77 [2]."),
            try? PDFTableContent(content: "Разработка, согласование и утверждение программы и методики испытаний"),
            try? PDFTableContent(content: "Проведение предварительного тестирования базового функционала"),
            try? PDFTableContent(content: "Корректировка программы и программной документации по результатам тестирования"),
            try? PDFTableContent(content: "Подготовка и передача программы и программной документации для сопровождения"),
            try? PDFTableContent(content: "Подготовка и передача презентации программного продукта"),
            try? PDFTableContent(content: "Защита проекта")
        ]
        
        // MARK: fill deadlines dates
        
        for i in 1..<9 {
            table[i, 3].content = try? PDFTableContent(content: deadlines[i + 9])
        }
        
        document.add(.contentLeft, table: table)
    }
}
