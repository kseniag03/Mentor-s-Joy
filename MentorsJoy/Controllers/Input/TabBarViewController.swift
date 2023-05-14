//
//  TabBarViewController.swift
//  MentorsJoy
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .systemBlue
        tabBar.unselectedItemTintColor = .white

        setUpController()
    }
    
    private func setUpController() {
        
        let common = CommonInputViewController(type: .common)
        common.title = "Общее"
        common.navigationItem.largeTitleDisplayMode = .always
        let navCommon = UINavigationController(rootViewController: common)
        navCommon.navigationBar.prefersLargeTitles = true
        
        let task = CommonInputViewController(type: .task)
        task.title = "ТЗ"
        task.navigationItem.largeTitleDisplayMode = .always
        let navTask = UINavigationController(rootViewController: task)
        navTask.navigationBar.prefersLargeTitles = true
        
        let note = CommonInputViewController(type: .note)
        note.title = "ПЗ"
        note.navigationItem.largeTitleDisplayMode = .always
        let navNote = UINavigationController(rootViewController: note)
        navNote.navigationBar.prefersLargeTitles = true
        
        let testing = CommonInputViewController(type: .testing)
        testing.title = "ПМИ"
        testing.navigationItem.largeTitleDisplayMode = .always
        let navTesting = UINavigationController(rootViewController: testing)
        navTesting.navigationBar.prefersLargeTitles = true
        
        let manual = CommonInputViewController(type: .manual)
        manual.title = "РО"
        manual.navigationItem.largeTitleDisplayMode = .always
        let navManual = UINavigationController(rootViewController: manual)
        navManual.navigationBar.prefersLargeTitles = true
        
        let programm = CommonInputViewController(type: .programm)
        programm.title = "ТП"
        programm.navigationItem.largeTitleDisplayMode = .always
        let navProgramm = UINavigationController(rootViewController: programm)
        navProgramm.navigationBar.prefersLargeTitles = true
        
        setViewControllers(
            [
                navCommon,
                navTask,
                navNote,
                navTesting,
                navManual,
                navProgramm
            ],
            animated: true)
        
        guard let items = tabBar.items else { return }
        let images = [ "doc.fill", "doc.text", "doc.text.below.ecg", "chart.bar.doc.horizontal", "doc.text.magnifyingglass", "doc.badge.gearshape"]
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        modalPresentationStyle = .fullScreen
    }
}
