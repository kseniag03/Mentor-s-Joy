//
//  ChangeProgramFields.swift
//  MentorsJoy
//

protocol ChangeProgramFields {
    
    func setupProgrammingLanguage(language: String)
    func setupDevelopmentEnvironment(environment: String)
    func setupFrameworks(frameworks: String)
    
    func addLinkItem(item: String)
    
    func removeLinkItem(i: Int)
}
