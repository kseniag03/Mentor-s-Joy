//
//  TaskInputViewController.swift
//  MentorsJoy
//

import UIKit

class TaskInputViewController: CommonInputViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}
