//
//  CommonChangeFields.swift
//  MentorsJoy
//

// MARK: change fields values using user's input

extension DocsCommon {
    
    func setupCodifier(code: String, type: DocumentType) {
        var newCodifier = codifier.replacingOccurrences(of: "XX.XX", with: code)
        switch type {
        case .task:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТЗ")
        case .note:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПЗ")
        case .testing:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПМИ")
        case .manual:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "РП")
        case .programm:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТП")
        }
        codifier = newCodifier
    }
    
    func setupYear(year: String) {
        self.year = year
    }
}
