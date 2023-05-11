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

// MARK: necessary fields

class DocsCommon {
    
    let titles = PDFDocument(format: .a4)
    let doc = PDFDocument(format: .a4)
    let lrc = PDFDocument(format: .a4)
    
    var fileName = "DEFAULT"
    
    var performerName = "ФИО"
    var mentorName = "ФИО"
    var year = "2023"
    var date = "«___» _____________"
    var codifier = "RU.17701729.XX.XX-01 X 01-1"
    var group = "GROUP"
    var city = "Москва"
    
    var projectTopic = "Project Topic"
    var projectName = "Project Name"
    var projectNameEng = "English Project Name"
    
    var shortDecription = ""
    var functionPurpose = ""
    var exploitPurpose = ""

    var glossaryList: [String: String] = [:]
    var sourceList: [String] = []
    
    var pageNum = 1
    
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
}
