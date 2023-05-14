//
//  TextConst.swift
//  MentorsJoy
//

// MARK: class with static dictionary, for changing textFields' values (only text)

final class TextConst {
    
    static let texts: [Int: Fragment] = [
        0: Fragment(name: "ФИО исполнителя", action: PDF.pdf.setupPerformerName, removeAction: nil, vc: nil),
        1: Fragment(name: "Должность научного руководителя", action: PDF.pdf.setupMentorPost, removeAction: nil, vc: nil),
        2: Fragment(name: "ФИО научного руководителя", action: PDF.pdf.setupMentorName, removeAction: nil, vc: nil),
        3: Fragment(name: "Дата", action: PDF.pdf.setupDate, removeAction: nil, vc: nil),
        4: Fragment(name: "Тема проекта", action: PDF.pdf.setupProjectTopic, removeAction: nil, vc: nil),
        5: Fragment(name: "Название проекта", action: PDF.pdf.setupProjectName, removeAction: nil, vc: nil),
        6: Fragment(name: "Название проекта на английском языке", action: PDF.pdf.setupProjectNameEng, removeAction: nil, vc: nil),
        7: Fragment(name: "Кодификатор (строка вида «xx.xx»)", action: PDF.pdf.setupCodifier, removeAction: nil, vc: nil),
        8: Fragment(name: "Группа (номер группы)", action: PDF.pdf.setupGroup, removeAction: nil, vc: nil),
        9: Fragment(name: "Город", action: PDF.pdf.setupCity, removeAction: nil, vc: nil),
        
        10: Fragment(name: "Краткое описание применения", action: PDF.pdf.setupShortDecription, removeAction: nil, vc: nil),
        11: Fragment(name: "Функциональное назначение", action: PDF.pdf.setupFunctionPurpose, removeAction: nil, vc: nil),
        12: Fragment(name: "Эксплуатационное назначение", action: PDF.pdf.setupExploitPurpose, removeAction: nil, vc: nil),
        
        13: Fragment(name: "Глоссарий", action: PDF.pdf.addGlossaryDictItem, removeAction: PDF.pdf.removeGlossaryDictItem, vc: ListControllers.glossary),
        14: Fragment(name: "Источники", action: PDF.pdf.addSourceListItem, removeAction: PDF.pdf.removeSourceListItem, vc: ListControllers.sources),
        
        15: Fragment(name: "Требования к функционалу", action: PDF.pdf.addFuncItem, removeAction: PDF.pdf.removeFuncItem, vc: ListControllers.functionality),
        16: Fragment(name: "Требования к входным данным", action: PDF.pdf.addInputItem, removeAction: PDF.pdf.removeInputItem, vc: ListControllers.input),
        17: Fragment(name: "Требования к выходным данным", action: PDF.pdf.addOutputItem, removeAction: PDF.pdf.removeOutputItem, vc: ListControllers.output),
        18: Fragment(name: "Требования к надежности", action: PDF.pdf.addSafetyItem, removeAction: PDF.pdf.removeSafetyItem, vc: ListControllers.safety),
        19: Fragment(name: "Требования к интерфейсу", action: PDF.pdf.addInterfaceItem, removeAction: PDF.pdf.removeInterfaceItem, vc: ListControllers.interface),
        20: Fragment(name: "Требования к технике", action: PDF.pdf.addHardwareItem, removeAction: PDF.pdf.removeHardwareItem, vc: ListControllers.hardware),
        21: Fragment(name: "Требования к программам", action: PDF.pdf.addSoftwareItem, removeAction: PDF.pdf.removeSoftwareItem, vc: ListControllers.software),
        
        22: Fragment(name: "Экономическая эффективность", action: PDF.pdf.addEfficiencyItem, removeAction: PDF.pdf.removeEfficiencyItem, vc: ListControllers.efficiency),
        23: Fragment(name: "Предполагаемая потребность", action: PDF.pdf.setupNeed, removeAction: nil, vc: nil),
        24: Fragment(name: "Аналоги", action: PDF.pdf.addRivalItem, removeAction: PDF.pdf.removeRivalItem, vc: ListControllers.rivals),
        25: Fragment(name: "Преимущества", action: PDF.pdf.addAdvantageItem, removeAction: PDF.pdf.removeAdvantageItem, vc: ListControllers.advantages),
        26: Fragment(name: "Ключевая особенность", action: PDF.pdf.setupKillerFeature, removeAction: nil, vc: nil)
    ]
    
    static let taskTexts: [Int: Fragment] = [
        0: Fragment(name: "Специальные требования", action: PDF.pdf.addSpecialItem, removeAction: PDF.pdf.removeSpecialItem, vc: ListControllers.special),
        1: Fragment(name: "Сроки", action: PDF.pdf.addDeadline, removeAction: PDF.pdf.removeDeadline, vc: ListControllers.deadlines)
    ]
    
    static let noteTexts: [Int: Fragment] = [
        0: Fragment(name: "Постановка задачи на разработку", action: PDF.pdf.setupSettingTask, removeAction: nil, vc: nil),
        1: Fragment(name: "Алгоритм и функционирование", action: PDF.pdf.addEssenceItem, removeAction: PDF.pdf.removeEssenceItem, vc: ListControllers.essence),
        2: Fragment(name: "Метод организации данных", action: PDF.pdf.addPutItem, removeAction: PDF.pdf.removePutItem, vc: ListControllers.put),
        3: Fragment(name: "Обоснование выбора состава средств", action: PDF.pdf.setupToolsJustification, removeAction: nil, vc: nil)
    ]
    
    static let testingTexts: [Int: Fragment] = [
        0: Fragment(name: "Характеристики устройства", action: PDF.pdf.addParamsItem, removeAction: PDF.pdf.removeParamsItem, vc: ListControllers.params),
        1: Fragment(name: "Инструменты испытаний", action: PDF.pdf.addToolsItem, removeAction: PDF.pdf.removeToolsItem, vc: ListControllers.tools),
        2: Fragment(name: "Порядок испытаний", action: PDF.pdf.addOrderItem, removeAction: PDF.pdf.removeOrderItem, vc: ListControllers.order),
        3: Fragment(name: "Проверка требований к функционалу", action: PDF.pdf.addFuncCheckItem, removeAction: PDF.pdf.removeFuncCheckItem, vc: ListControllers.funcCheck),
        4: Fragment(name: "Проверка входных данных", action: PDF.pdf.addInputCheckItem, removeAction: PDF.pdf.removeInputCheckItem, vc: ListControllers.inputCheck),
        5: Fragment(name: "Проверка выходных данных", action: PDF.pdf.addOutputCheckItem, removeAction: PDF.pdf.removeOutputCheckItem, vc: ListControllers.outputCheck),
        6: Fragment(name: "Проверка требований к надежности", action: PDF.pdf.addSafetyCheckItem, removeAction: PDF.pdf.removeSafetyCheckItem, vc: ListControllers.safetyCheck),
        7: Fragment(name: "Проверка требований к интерфейсу", action: PDF.pdf.addInterfaceCheckItem, removeAction: PDF.pdf.removeInterfaceCheckItem, vc: ListControllers.interfaceCheck)
    ]
    
    static let manualTexts: [Int: Fragment] = [
        0: Fragment(name: "Мин. требования к технике", action: PDF.pdf.addTechRequiresItem, removeAction: PDF.pdf.removeTechRequiresItem, vc: ListControllers.techRequires),
        1: Fragment(name: "Мин. требования к программам", action: PDF.pdf.addProgramRequiresItem, removeAction: PDF.pdf.removeProgramRequiresItem, vc: ListControllers.programRequires),
        2: Fragment(name: "Требования к персоналу", action: PDF.pdf.addUserRequiresItem, removeAction: PDF.pdf.removeUserRequiresItem, vc: ListControllers.userRequires),
        3: Fragment(name: "Загрузка программы", action: PDF.pdf.setupDownload, removeAction: nil, vc: nil),
        4: Fragment(name: "Запуск программы", action: PDF.pdf.setupLaunch, removeAction: nil, vc: nil),
        5: Fragment(name: "Выполнение программы", action: PDF.pdf.addExecutionItem, removeAction: PDF.pdf.removeExecutionItem, vc: ListControllers.execution),
        6: Fragment(name: "Завершение программы", action: PDF.pdf.setupTermination, removeAction: nil, vc: nil),
        7: Fragment(name: "Сообщения оператору", action: PDF.pdf.addMessagesItem, removeAction: PDF.pdf.removeMessagesItem, vc: ListControllers.messages)
    ]
    
    static let programTexts: [Int: Fragment] = [
        0: Fragment(name: "Язык программирования, версия", action: PDF.pdf.setupProgrammingLanguage, removeAction: nil, vc: nil),
        1: Fragment(name: "Среда разработки, версия", action: PDF.pdf.setupDevelopmentEnvironment, removeAction: nil, vc: nil),
        2: Fragment(name: "Фреймворки (перечисления)", action: PDF.pdf.setupFrameworks, removeAction: nil, vc: nil),
        3: Fragment(name: "Ссылки с описаниями", action: PDF.pdf.addLinkItem, removeAction: PDF.pdf.removeLinkItem, vc: ListControllers.links)
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
    
    static func getText(i: Int, type: DocumentType) -> String {
        
        var text = texts
        switch type {
        case .task:
            text = taskTexts
            break
        case .note:
            text = noteTexts
            break
        case .testing:
            text = testingTexts
            break
        case .manual:
            text = manualTexts
            break
        case .programm:
            text = programTexts
            break
        default:
            break
        }
        
        return text[i]?.name ?? ""
    }
    
    static func getMonth(i: Int) -> String {
        return TextConst.months[i] ?? "\(i)"
    }
}
