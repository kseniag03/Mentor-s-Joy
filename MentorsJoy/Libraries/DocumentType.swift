//
//  DocumentType.swift
//  MentorsJoy
//

enum DocumentType: String {

    case task = "TA"
    
    case note = "NO"
    
    case testing = "TE"
    
    case manual = "MA"
    
    case programm = "PR"
    
    case common = "DEFAULT"
    
    func getFileName() -> String {
        return self.rawValue
    }
    
    func getRusShort() -> String {
        switch self {
        case .task:
            return "ТЗ"
        case .note:
            return "ПЗ"
        case .testing:
            return "ПМИ"
        case .manual:
            return "РО"
        case .programm:
            return "ТП"
        case .common:
            return ""
        }
    }
    
    func getRus() -> String {
        switch self {
        case .task:
            return "Техническое задание"
        case .note:
            return "Пояснительная записка"
        case .testing:
            return "Программа и методика испытаний"
        case .manual:
            return "Руководство оператора"
        case .programm:
            return "Текст программы"
        case .common:
            return ""
        }
    }

}
