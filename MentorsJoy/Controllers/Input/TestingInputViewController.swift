//
//  TestingInputViewController.swift
//  MentorsJoy
//

import UIKit

class TestingInputViewController: CommonInputViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemPurple
        tableView.dataSource = self
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}
