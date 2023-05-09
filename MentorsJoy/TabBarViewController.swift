//
//  TabBarViewController.swift
//  MentorsJoy
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        setUpController()
    }
    
    private func setUpController() {
        
        //guard let currentUserEmail = UserDefaults.standard.string(forKey: "email") else { return }
        
        let common = CommonInputViewController()
        common.title = "Общее"
        common.navigationItem.largeTitleDisplayMode = .always
        let navCommon = UINavigationController(rootViewController: common)
        navCommon.navigationBar.prefersLargeTitles = true
        
        let task = TaskInputViewController()
        task.title = "ТЗ"
        task.navigationItem.largeTitleDisplayMode = .always
        let navTask = UINavigationController(rootViewController: task)
        navTask.navigationBar.prefersLargeTitles = true
        
        let testing = TestingInputViewController()
        testing.title = "ПМИ"
        testing.navigationItem.largeTitleDisplayMode = .always
        let navTesting = UINavigationController(rootViewController: testing)
        navTesting.navigationBar.prefersLargeTitles = true
        
        let programm = ProgrammInputViewController()
        programm.title = "ТП"
        programm.navigationItem.largeTitleDisplayMode = .always
        let navProgramm = UINavigationController(rootViewController: programm)
        navProgramm.navigationBar.prefersLargeTitles = true
        
        let note = NoteInputViewController()
        note.title = "ПЗ"
        note.navigationItem.largeTitleDisplayMode = .always
        let navNote = UINavigationController(rootViewController: note)
        navNote.navigationBar.prefersLargeTitles = true
        
        let manual = ManualInputViewController()
        manual.title = "РО"
        manual.navigationItem.largeTitleDisplayMode = .always
        let navManual = UINavigationController(rootViewController: manual)
        navManual.navigationBar.prefersLargeTitles = true
        
        setViewControllers(
            [
                navCommon,
                navTask,
                navTesting,
                navProgramm,
                navNote,
                navManual
            ],
            animated: true)
        
        guard let items = tabBar.items else { return }
        let images = [ "house.fill", "magnifyingglass", "mic.fill", "person.circle.fill", "mic.fill", "house"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        modalPresentationStyle = .fullScreen
    }
}
