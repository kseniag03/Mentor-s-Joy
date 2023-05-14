//
//  CommonChangeFields.swift
//  MentorsJoy
//

import Foundation

extension DocsCommon {
    
    // MARK: change string field using newValue
    
    func setupPerformerName(name: String) {
        self.performerName = name
    }
    
    func setupMentorName(name: String) {
        self.mentorName = name
    }
    
    func setupMentorPost(post: String) {
        self.mentorPost = post
    }
    
    func setupYear(year: String) {
        self.year = year
    }
    
    func setupDate(date: String) {
        self.date = date
    }

    func setupCodifier(code: String, type: DocumentType) {
        print("code = \(code)")
        if code.count == 5 {
            let pattern = "^[0-9]{2}\\.[0-9]{2}$"
            if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
                let range = NSRange(location: 0, length: code.utf16.count)
                if regex.firstMatch(in: code, options: [], range: range) != nil {
                    print("Match found for code \(code)")
                    self.code = code
                } else {
                    print("No match found for code \(code)")
                }
            }
        } else {
            print("New code value size is not equal to 5, codifier not updated")
        }
        print("Current codifier code value = \(code)")
    }
    
    func setupGroup(group: String) {
        self.group = group
    }
    
    func setupCity(city: String) {
        self.city = city
    }
    
    func setupProjectTopic(topic: String) {
        self.projectTopic = topic
    }
    
    func setupProjectName(name: String) {
        self.projectName = name
    }
    
    func setupProjectNameEng(nameEng: String) {
        self.projectNameEng = nameEng
    }
    
    func setupShortDecription(description: String) {
        self.shortDecription = description
    }
    
    func setupFunctionPurpose(purpose: String) {
        self.functionPurpose = purpose
    }
    
    func setupExploitPurpose(purpose: String) {
        self.exploitPurpose = purpose
    }
    
    func setupNeed(need: String) {
        self.need = need
    }
    
    func setupKillerFeature(feature: String) {
        self.killerFeature = feature
    }
    
    // MARK: add string item to list
    
    func addEfficiencyItem(item: String) {
        self.efficiency.append(item)
    }
    
    func addRivalItem(item: String) {
        self.rivals.append(item)
    }
    
    func addAdvantageItem(item: String) {
        self.advantages.append(item)
    }
    
    func addGlossaryDictItem(item: String) {
        self.glossaryList.append(item)
    }
    
    func addSourceListItem(item: String) {
        self.sourceList.append(item)
    }
    
    func addFuncItem(item: String) {
        self.functionality.append(item)
    }
    
    func addInputItem(item: String) {
        self.input.append(item)
    }
    
    func addOutputItem(item: String) {
        self.output.append(item)
    }
    
    func addSafetyItem(item: String) {
        self.safety.append(item)
    }
    
    func addInterfaceItem(item: String) {
        self.interface.append(item)
    }
    
    func addHardwareItem(item: String) {
        self.hardware.append(item)
    }
    
    func addSoftwareItem(item: String) {
        self.software.append(item)
    }
    
    // MARK: remove item from list by index
    
    func removeFuncItem(i: Int) {
        self.functionality.remove(at: i)
    }
    
    func removeInputItem(i: Int) {
        self.input.remove(at: i)
    }
    
    func removeOutputItem(i: Int) {
        self.output.remove(at: i)
    }
    
    func removeSafetyItem(i: Int) {
        self.safety.remove(at: i)
    }
    
    func removeInterfaceItem(i: Int) {
        self.interface.remove(at: i)
    }
    
    func removeHardwareItem(i: Int) {
        self.hardware.remove(at: i)
    }
    
    func removeSoftwareItem(i: Int) {
        self.software.remove(at: i)
    }
    
    func removeEfficiencyItem(i: Int) {
        self.efficiency.remove(at: i)
    }
    
    func removeRivalItem(i: Int) {
        self.rivals.remove(at: i)
    }
    
    func removeAdvantageItem(i: Int) {
        self.advantages.remove(at: i)
    }
    
    func removeGlossaryDictItem(i: Int) {
        self.glossaryList.remove(at: i)
    }
    
    func removeSourceListItem(i: Int) {
        self.sourceList.remove(at: i)
    }
}
