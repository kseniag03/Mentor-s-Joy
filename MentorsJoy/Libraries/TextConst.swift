//
//  TextConst.swift
//  MentorsJoy
//

typealias Action = (String) -> Void

struct Fragment {
    
    let name: String
    
    let action: Action
}

// MARK: class with static dictionary, for changing textFields' values (only text)

class TextConst {
    
    static let texts: [Int: Fragment] = [
        0: Fragment(name: "ФИО исполнителя", action: PDF.pdf.setupPerformerName),
        1: Fragment(name: "ФИО научного руководителя", action: PDF.pdf.setupMentorName),
        2: Fragment(name: "Год", action: PDF.pdf.setupYear),
        3: Fragment(name: "Дата (день, месяц)", action: PDF.pdf.setupDate),
        4: Fragment(name: "Тема проекта", action: PDF.pdf.setupProjectTopic),
        5: Fragment(name: "Название проекта", action: PDF.pdf.setupProjectName),
        6: Fragment(name: "Название проекта на английском языке", action: PDF.pdf.setupProjectNameEng),
        7: Fragment(name: "Кодификатор (строка вида «xx.xx»)", action: PDF.pdf.setupCodifier),
        8: Fragment(name: "Группа (название группы)", action: PDF.pdf.setupGroup),
        10: Fragment(name: "Краткая характеристика области применения", action: PDF.pdf.setupShortDecription),
        11: Fragment(name: "Функциональное назначение", action: PDF.pdf.setupFunctionPurpose),
        12: Fragment(name: "Эксплуатационное назначение", action: PDF.pdf.setupExploitPurpose)
    ]
    
    // glossary + sources
    
    static let taskTexts: [Int: Fragment] = [
        0: Fragment(name: "Время восстановления после отказа", action: PDF.pdf.setupPerformerName),
        1: Fragment(name: "Ориентировочная экономическая эффективность", action: PDF.pdf.setupMentorName),
        2: Fragment(name: "Предполагаемая потребность", action: PDF.pdf.setupYear),
        /*3: Fragment(name: "", action: PDF.pdf.setupDate),
        4: Fragment(name: "", action: PDF.pdf.setupProjectTopic),
        5: Fragment(name: "", action: PDF.pdf.setupProjectName),
        6: Fragment(name: "", action: PDF.pdf.setupProjectNameEng),
        7: Fragment(name: "", action: PDF.pdf.setupCodifier),
        8: Fragment(name: "", action: PDF.pdf.setupGroup),
        10: Fragment(name: "", action: PDF.pdf.setupShortDecription),
        11: Fragment(name: "", action: PDF.pdf.setupFunctionPurpose),
        12: Fragment(name: "", action: PDF.pdf.setupExploitPurpose)*/
    ]
    
    // a lot of lists
}

/*
 TASK

 // тип String

 Ориентировочная экономическая эффективность
 Предполагаемая потребность

 // [String], по умолчанию пустой
 
 Экономические преимущества разработки по сравнению
 с отечественными и зарубежными образцами или аналогами (мб словарь?)

 требования к составу выполняемых функций
 Требования к организации входных данных
 Требования к организации выходных данных
 Требования к интерфейсу
 Требования к составу и параметрам технических средств
 Специальные требования
 
 deadlines develop stages
 */
