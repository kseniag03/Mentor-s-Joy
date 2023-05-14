//
//  TaskChangeFields.swift
//  MentorsJoy
//

extension DocsTask {
    
    func addSpecialItem(item: String) {
        self.specialReqs.append(item)
    }
    
    func addDeadline(deadline: String) {
        if (self.customDeadlines.count == 18) {
            return
        }
        self.customDeadlines.append(deadline)
    }
    
    func removeSpecialItem(i: Int) {
        self.specialReqs.remove(at: i)
    }
    
    func removeDeadline(i: Int) {
        self.customDeadlines.remove(at: i)
    }
}
