//
//  ListControllers.swift
//  MentorsJoy
//

final class ListControllers {
    
    static let sources = ListInputViewController()
    static let glossary = ListInputViewController()
    
    static let efficiency = ListInputViewController()
    static let rivals = ListInputViewController()
    static let advantages = ListInputViewController()
    
    static let functionality = ListInputViewController()
    static let input = ListInputViewController()
    static let output = ListInputViewController()
    static let safety = ListInputViewController()
    static let interface = ListInputViewController()
    static let hardware = ListInputViewController()
    static let software = ListInputViewController()
    static let special = ListInputViewController()
    
    static let vc: [Int: (String, ListInputViewController)] = [
        13: ("Глоссарий", glossary),
        14: ("Источники", sources),
        
        15: ("Эконом. эффект.", efficiency),
        16: ("Аналоги", rivals),
        17: ("Преимущества", advantages)//,
        
        // in task
        /*
        0: ("Функционал", functionality),
        1: ("Входные данные", input),
        2: ("Выходные данные", output),
        
        3: ("Надёжность", safety),
        4: ("Интерфейс", interface),
        5: ("Технические парам.", hardware),
        6: ("Программная совм.", software),
        7: ("Спец.", special)*.*/
    ]
    
}
