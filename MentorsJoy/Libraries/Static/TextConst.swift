//
//  TextConst.swift
//  MentorsJoy
//

// MARK: class with static dictionary, for changing textFields' values (only text)

final class TextConst {
    
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
        12: Fragment(name: "Эксплуатационное назначение", action: PDF.pdf.setupExploitPurpose),
        
        13: Fragment(name: "Глоссарий", action: PDF.pdf.addGlossaryDictItem),
        14: Fragment(name: "Источники", action: PDF.pdf.addSourceListItem),
        
        15: Fragment(name: "Экономическая эффективность", action: PDF.pdf.addEfficiencyItem),
        16: Fragment(name: "Предполагаемая потребность", action: PDF.pdf.setupNeed),
        17: Fragment(name: "Аналоги", action: PDF.pdf.addRivalItem),
        18: Fragment(name: "Преимущества", action: PDF.pdf.addAdvantageItem),
        19: Fragment(name: "Ключевая особенность", action: PDF.pdf.setupKillerFeature)
    ]
    
    static let taskTexts: [Int: Fragment] = [
        0: Fragment(name: "Требования к составу выполняемых функций", action: PDF.pdf.addFuncItem),
        1: Fragment(name: "Требования к организации входных данных", action: PDF.pdf.addInputItem),
        2: Fragment(name: "Требования к организации выходных данных", action: PDF.pdf.addOutputItem),
        3: Fragment(name: "Требования к надежности", action: PDF.pdf.addSafetyItem),
        4: Fragment(name: "Требования к интерфейсу", action: PDF.pdf.addInterfaceItem),
        5: Fragment(name: "Требования к составу и параметрам технических средств", action: PDF.pdf.addHardwareItem),
        6: Fragment(name: "Требования к информационной и программной совместимости", action: PDF.pdf.addSoftwareItem),
        7: Fragment(name: "Специальные требования", action: PDF.pdf.addSpecialItem)
        // + stages deadlines
    ]
    
    static let months: [Int: String] = [
        1: "января",
        2: "февраля",
        3: "марта",
        4: "апреля",
        5: "мая",
        6: "июня",
        7: "июля",
        8: "августа",
        9: "сентября",
        10: "октября",
        11: "ноября",
        12: "декабря"
    ]
    
    // a lot of lists...
    
    static func getText(i: Int) -> String {
        return TextConst.texts[i]?.name ?? ""
    }
    
    static func getMonth(i: Int) -> String {
        return TextConst.months[i] ?? "\(i)"
    }
}
