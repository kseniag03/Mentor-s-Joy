//
//  PDFVCChangeCommon.swift
//  MentorsJoy
//

extension PDFViewController: ChangeCommonFields {
    
    func setupPerformerName(name: String) {
        allDocuments.forEach { doc in
            doc.setupPerformerName(name: name)
        }
    }
    
    func setupMentorPost(post: String) {
        allDocuments.forEach { doc in
            doc.setupMentorPost(post: post)
        }
    }
    
    func setupMentorName(name: String) {
        allDocuments.forEach { doc in
            doc.setupMentorName(name: name)
        }
    }
    
    func setupYear(year: String) {
        allDocuments.forEach { doc in
            doc.setupYear(year: year)
        }
    }
    
    func setupDate(date: String) {
        allDocuments.forEach { doc in
            doc.setupDate(date: date)
        }
    }
    
    func setupCodifier(code: String) {
        allDocuments.forEach { doc in
            doc.setupCodifier(code: code, type: self.currentType)
        }
    }
    
    func setupGroup(group: String) {
        allDocuments.forEach { doc in
            doc.setupGroup(group: group)
        }
    }
    
    func setupCity(city: String) {
        allDocuments.forEach { doc in
            doc.setupCity(city: city)
        }
    }
    
    func setupProjectTopic(topic: String) {
        allDocuments.forEach { doc in
            doc.setupProjectTopic(topic: topic)
        }
    }
    
    func setupProjectName(name: String) {
        allDocuments.forEach { doc in
            doc.setupProjectName(name: name)
        }
    }
    
    func setupProjectNameEng(nameEng: String) {
        allDocuments.forEach { doc in
            doc.setupProjectNameEng(nameEng: nameEng)
        }
    }
    
    func setupShortDecription(description: String) {
        allDocuments.forEach { doc in
            doc.setupShortDecription(description: description)
        }
    }
    
    func setupFunctionPurpose(purpose: String) {
        allDocuments.forEach { doc in
            doc.setupFunctionPurpose(purpose: purpose)
        }
    }
    
    func setupExploitPurpose(purpose: String) {
        allDocuments.forEach { doc in
            doc.setupExploitPurpose(purpose: purpose)
        }
    }
    
    func addFuncItem(item: String) {
        allDocuments[0].addFuncItem(item: item)
        allDocuments[2].addFuncItem(item: item)
    }
    
    func addInputItem(item: String) {
        allDocuments[0].addInputItem(item: item)
        allDocuments[2].addInputItem(item: item)
    }
    
    func addOutputItem(item: String) {
        allDocuments[0].addOutputItem(item: item)
        allDocuments[2].addOutputItem(item: item)
    }
    
    func addSafetyItem(item: String) {
        allDocuments[0].addSafetyItem(item: item)
        allDocuments[2].addSafetyItem(item: item)
    }
    
    func addInterfaceItem(item: String) {
        allDocuments[0].addInterfaceItem(item: item)
        allDocuments[2].addInterfaceItem(item: item)
    }
    
    func addHardwareItem(item: String) {
        allDocuments.forEach { doc in
            doc.addHardwareItem(item: item)
        }
    }
    
    func addSoftwareItem(item: String) {
        allDocuments.forEach { doc in
            doc.addSoftwareItem(item: item)
        }
    }
    
    func setupNeed(need: String) {
        allDocuments[0].setupNeed(need: need)
        allDocuments[1].setupNeed(need: need)
    }
    
    func setupKillerFeature(feature: String) {
        allDocuments[0].setupKillerFeature(feature: feature)
        allDocuments[1].setupKillerFeature(feature: feature)
    }
    
    func addEfficiencyItem(item: String) {
        allDocuments[0].addEfficiencyItem(item: item)
        allDocuments[1].addEfficiencyItem(item: item)
    }
    
    func addRivalItem(item: String) {
        allDocuments[0].addRivalItem(item: item)
        allDocuments[1].addRivalItem(item: item)
    }
    
    func addAdvantageItem(item: String) {
        allDocuments[0].addAdvantageItem(item: item)
        allDocuments[1].addAdvantageItem(item: item)
    }
    
    func addGlossaryDictItem(item: String) {
        allDocuments.forEach { doc in
            doc.addGlossaryDictItem(item: item)
        }
    }
    
    func addSourceListItem(item: String) {
        allDocuments.forEach { doc in
            doc.addSourceListItem(item: item)
        }
    }
    

    func removeFuncItem(i: Int) {
        allDocuments[0].removeFuncItem(i: i)
        allDocuments[2].removeFuncItem(i: i)
    }
    
    func removeInputItem(i: Int) {
        allDocuments[0].removeInputItem(i: i)
        allDocuments[2].removeInputItem(i: i)
    }
    
    func removeOutputItem(i: Int) {
        allDocuments[0].removeOutputItem(i: i)
        allDocuments[2].removeOutputItem(i: i)
    }
    
    func removeSafetyItem(i: Int) {
        allDocuments[0].removeSafetyItem(i: i)
        allDocuments[2].removeSafetyItem(i: i)
    }
    
    func removeInterfaceItem(i: Int) {
        allDocuments[0].removeInterfaceItem(i: i)
        allDocuments[2].removeInterfaceItem(i: i)
    }
    
    func removeHardwareItem(i: Int) {
        allDocuments.forEach { doc in
            doc.removeHardwareItem(i: i)
        }
    }
    
    func removeSoftwareItem(i: Int) {
        allDocuments.forEach { doc in
            doc.removeSoftwareItem(i: i)
        }
    }
    
    func removeEfficiencyItem(i: Int) {
        allDocuments[0].removeRivalItem(i: i)
        allDocuments[1].removeRivalItem(i: i)
    }
    
    func removeRivalItem(i: Int) {
        allDocuments[0].removeRivalItem(i: i)
        allDocuments[1].removeRivalItem(i: i)
    }
    
    func removeAdvantageItem(i: Int) {
        allDocuments[0].removeAdvantageItem(i: i)
        allDocuments[1].removeAdvantageItem(i: i)
    }
    
    func removeGlossaryDictItem(i: Int) {
        allDocuments.forEach { doc in
            doc.removeGlossaryDictItem(i: i)
        }
    }
    
    func removeSourceListItem(i: Int) {
        allDocuments.forEach { doc in
            doc.removeSourceListItem(i: i)
        }
    }
}
