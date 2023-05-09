//
//  DocsTask.swift
//  MentorsJoy
//

import TPPDF

// MARK: - ТЕХНИЧЕСКОЕ ЗАДАНИЕ
final class DocsTask: DocsCommon {

    private func setupView() {
        
        titles.background.color = .systemGray6
        doc.background.color = .systemGray6
        lrc.background.color = .systemGray6
        
        // MARK: - craft doc of definite type (use different methods)
        
        // CRAFT
        setupTitle(document: titles, type: .task)
        addNewPage(document: titles)
        setupLU(document: titles, type: .task)
        pageNum += 1
        
        setupHeader(document: doc)
        
        setupAnnotation(document: doc)
        
        addNewPage(document: doc)
        
        // add if-cond: if d is empty, do not add glossary at document
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
        
        // MARK: fix pagination or delete it......
        
        var pagination = PDFPagination()
        pagination.range = (start: 3, end: 7)
        pagination.hiddenPages = [5]
        
        doc.pagination = pagination
        
        /*
        let docsList = [titles, doc, lrc]
        
        guard let url = getPDFDoc(documents: docsList) else { return }*/
    }
    
    // MARK: styles, formats

    
    // MARK: Docs task parts creation
    
    
    
    private func setupIntro(document: PDFDocument) {

        setupPageHeader1(document: document, title: "ВВЕДЕНИЕ", "1.\t")
        
        setupPageHeader2(document: document, title: "Наименование программы", number: "1.1.")
        
        setupSimpleText(document: document, text: "\tНаименование темы разработки – «\(projectName)»\n" + "\tНаименование темы разработки на английском языке – «\(projectNameEng)»")
        
        setupPageHeader2(document: document, title: "Краткая характеристика области применения программы", number: "1.2.")
    }
    
    private func setupReasons(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ОСНОВАНИЯ ДЛЯ РАЗРАБОТКИ", "2.\t")
        
        setupSimpleText(document: document, text: "\tОснованием для разработки является учебный план подготовки бакалавров по направлению 09.03.04 «Программная инженерия» и утвержденная академическим руководителем тема курсового проекта «\(projectTopic)».")
    }
    
    private func setupPurposes(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "НАЗНАЧЕНИЕ РАЗРАБОТКИ", "3.\t")
        
        setupPageHeader2(document: document, title: "Функциональное назначение", number: "3.1.")
        
        setupPageHeader2(document: document, title: "Эксплуатационное назначение", number: "3.2.")
    }
    
    private func setupFunctionality(document: PDFDocument, _ specialReqs : [String] = []) {
        
        setupPageHeader1(document: document, title: "ТРЕБОВАНИЯ К ПРОГРАММЕ", "4.\t")
        
        
        setupPageHeader2(document: document, title: "Требования к функциональным характеристикам", number: "4.1.")
        
        setupPageHeader3(document: document, title: "Требования к составу выполняемых функций", number: "4.1.1")
        
        // MARK: here must be list!!!!!!!
        
        setupPageHeader3(document: document, title: "Требования к организации входных данных", number: "4.1.2.")
        
        // MARK: here must be list!!!!!!!
        
        setupPageHeader3(document: document, title: "Требования к организации выходных данных", number: "4.1.3.")
        
        // MARK: here must be list!!!!!!!
        
        setupPageHeader2(document: document, title: "Требования к надежности", number: "4.2.")
        
        setupPageHeader3(document: document, title: "Требования к обеспечению надежного (устойчивого) функционирования программы", number: "4.2.1")
        
        // MARK: add list!!
        
        setupPageHeader3(document: document, title: "Время восстановления после отказа", number: "4.2.2.")
        
        setupSimpleText(document: document, text: "\tВремя восстановления программы не должно превышать времени перезагрузки операционной системы или времени устранения технических неполадок.")
        
        setupPageHeader2(document: document, title: "Требования к интерфейсу", number: "4.3.")
        
        // MARK: here must be list!!!!!!!
        
        setupPageHeader2(document: document, title: "Условия эксплуатации", number: "4.4.")
        
        setupPageHeader3(document: document, title: "Климатические условия эксплуатации", number: "4.4.1")
        
        setupSimpleText(document: document, text: "\tКлиматические условия эксплуатации, при которых программа обязана выполнять весь функционал, должны удовлетворять требованиям, предъявляемым к смартфонам в части условий их эксплуатации.\n" + "\tУстройство предназначено для работы в закрытом отапливаемом помещении со стабильными климатическими условиями категории согласно ГОСТ 15150-69 [1].")
        
        setupPageHeader3(document: document, title: "Требования к видам обслуживания", number: "4.4.2.")
        
        // MARK: define more universal reqs
        
        setupSimpleText(document: document, text: "\tНа устройстве, где производится эксплуатация программы, необходимо обеспечить регулярную проверку оборудования и программного обеспечения на наличие неполадок. Обеспечить защиту устройства от воздействия вредоносных программ.\n" + "\tЕсли в программе возникли непредвиденные неполадки, то рекомендуется написать разработчику на адрес электронной почты, указанный в всплывающем окне «Помощь», и сообщить о них. Разработчик обязан принять меры по устранению неполадок и обновить программу, уведомив пользователя.")
        
        setupPageHeader2(document: document, title: "Требования к составу и параметрам технических средств", number: "4.5.")
        
        // MARK: here must be list!!!
        
        setupPageHeader2(document: document, title: "Требования к информационной и программной совместимости", number: "4.6.")
        
        // MARK: here must be list!!!
        
        setupPageHeader2(document: document, title: "Требования к маркировке и упаковке", number: "4.7.")
        
        setupSimpleText(document: document, text: "\tПрограмма поставляется в виде архива со всей программной документацией и приложениями: презентацией, исполняемыми файлами и исходным кодом. Программное изделие должно иметь маркировку с наименованием, темой разработки, ФИО исполнителя и датой выпуска.")
        
        setupPageHeader2(document: document, title: "Требования к транспортированию и хранению", number: "4.8.")
        
        setupPageHeader3(document: document, title: "Требования к хранению и транспортировке программных документов, предоставляемых в печатном виде", number: "4.8.1")
        
        setupSimpleText(document: document, text: "\tТребования к транспортировке и хранению программных документов являются стандартными и должны соответствовать общим требованиям хранения и транспортировки печатной продукции:")
        
        // list of reqs
        
        // MARK: here!!!!
        
        setupPageHeader3(document: document, title: "Требования к хранению и транспортировке программного продукта", number: "4.8.2.")
        
        // MARK: Define number of repository
        
        setupSimpleText(document: document, text: "Хранение программного продукта совместно с документацией выполняется в репозитории GitHub [?]. Программа в электронном виде может храниться и транспортироваться на USB-носителе, съёмном SSD или HDD диске, а также в облачном хранилище.")
        
        setupPageHeader2(document: document, title: "Специальные требования", number: "4.9.")
        
        if (specialReqs.count > 0) {
            setupNumericList(document: document, list: specialReqs)
        } else {
            setupSimpleText(document: document, text: "\tСпециальные требования к данной программе не предъявляются.")
        }
    }
    
    private func setupDocumentation(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ТРЕБОВАНИЯ К ПРОГРАММНОЙ ДОКУМЕНТАЦИИ", "5.\t")
        
        setupPageHeader2(document: document, title: "Состав программной документации", number: "5.1.")
        
        var docs: [String] = []
        for doc in DocsCommon().docs {
            var new = doc.replacingOccurrences(of: "PROJECT-NAME", with: projectName)
            docs.append(new)
        }
        setupNumericList(document: document, list: docs)
        
        setupPageHeader2(document: document, title: "Специальные требования к программной документации", number: "5.2.")
        
        docs.removeAll()
        for doc in DocsCommon().docsReqs {
            var new = doc.replacingOccurrences(of: "PROJECT-NAME", with: projectName)
            docs.append(new)
        }
        setupNumericList(document: document, list: docs)
    }
    
    private func setupTechnoEconomy(document: PDFDocument, _ rivals : [String] = [], _ advantages : [String] = [], _ efficiency : [String] = []) {
        
        setupPageHeader1(document: document, title: "ТЕХНИКО­-ЭКОНОМИЧЕСКИЕ ПОКАЗАТЕЛИ", "6.\t")
        
        setupPageHeader2(document: document, title: "Ориентировочная экономическая эффективность", number: "6.1.")
        
        if (efficiency.count > 0) {
            setupNumericList(document: document, list: efficiency)
        } else {
            setupSimpleText(document: document, text: "\tВ рамках данной работы расчет экономической эффективности не предусмотрен.")
        }
        
        setupPageHeader2(document: document, title: "Предполагаемая потребность", number: "6.2.")
        
        // insert text
        
        setupPageHeader2(document: document, title: "Экономические преимущества разработки по сравнению с отечественными и зарубежными образцами или аналогами", number: "6.3.")
        
        // insert list of rivals apps
        
        if (rivals.count > 0) {
            setupNumericList(document: document, list: rivals)
        }
        
        // insert list of project advantages
        
        if (advantages.count > 0) {
            setupNumericList(document: document, list: advantages)
        }
        
        // insert line about killer-feature
    }
    
    private func setupStages(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "СТАДИИ И ЭТАПЫ РАЗРАБОТКИ", "7.\t")
        
        setupPageHeader2(document: document, title: "Необходимые стадии разработки, этапы, содержание работ и сроки выполнения", number: "7.1.")
        
        setupSimpleText(document: document, text: "\tСтадии, этапы разработки и содержание работ выявлены с учетом ГОСТ 19.102-77 [3].")
        
        // MARK: Do not forget to add table!!!
        
        setupPageHeader2(document: document, title: "Срок разработки конечного продукта", number: "7.2.")
        
        setupSimpleText(document: document, text: "\tПрограммный продукт (программа и документация) должен быть завершен не позднее утвержденного приказом декана ФКН НИУ ВШЭ срока защиты курсовой работы.\n" + "\tИсполнитель – студент группы GROUP, ФИО.")

    }
    
    private func setupAcceptance(document: PDFDocument) {
        
        setupPageHeader1(document: document, title: "ПОРЯДОК КОНТРОЛЯ И ПРИЕМКИ", "8.\t")
        
        setupPageHeader2(document: document, title: "Виды испытаний", number: "8.1.")
        
        setupSimpleText(document: document, text: "\tПроводится проверка программы на корректное исполнение, обработку входных и выходных данных и удобство пользования. Помимо этого, осуществляется проверка на соответствие требованиям технического задания. Тестирование осуществляется исполнителем по «Программе и методике испытаний» (ГОСТ 19-301-79 [9]), а также пункту 5.2. технического задания.")
        
        setupPageHeader2(document: document, title: "Общие требования к приемке работы", number: "8.2.")
        
        setupSimpleText(document: document, text: "\tПрием программы происходит при ее полной работоспособности при различных входных данных, при выполнении всего функционала, указанного в пункте 4.1.1 технического задания, при выполнении требований, указанных в пункте 4.2. технического задания.\n" + "\tЗащита курсового проекта осуществляется комиссией, состоящей из преподавателей департамента программной инженерии, в утвержденные приказом декана ФКН НИУ ВШЭ сроки.")
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
        "\t7.\tГОСТ 19.201-78 [8] Техническое задание. Требования к содержанию и оформлению.\n" +
        "\tИзменения к Техническому заданию оформляются согласно ГОСТ 19.603-78[14], ГОСТ 19.604-78[15]."
    }
}
