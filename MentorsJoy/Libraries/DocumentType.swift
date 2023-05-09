//
//  DocumentType.swift
//  MentorsJoy
//

enum DocumentType: String {
    case task = "task"
    case note = "note"
    case testing = "testing"
    case manual = "manual"
    case programm = "programm"
    
    func getDocumentObject() -> DocsCommon {
        switch self {
        case .task:
            return DocsTask()
        
        case .note:
            return DocsNote()
            
        case .testing:
            return DocsTesting()
            
        case .manual:
            return DocsManual()
        
        case .programm:
            return DocsProgramm()
        }
    }
}
