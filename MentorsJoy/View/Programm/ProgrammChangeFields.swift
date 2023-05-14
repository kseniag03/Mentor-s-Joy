//
//  ProgrammChangeFields.swift
//  MentorsJoy
//

extension DocsProgramm {
    
    func setupProgrammingLanguage(language: String) {
        self.programmingLanguage = language
    }
    
    func setupDevelopmentEnvironment(environment: String) {
        self.developmentEnvironment = environment
    }
    
    func setupFrameworks(frameworks: String) {
        self.frameworks = frameworks
    }
    
    func addLinkItem(item: String) {
        self.linksWithDescription.append(item)
    }
    
    func removeLinkItem(i: Int) {
        self.linksWithDescription.remove(at: i)
    }
}
