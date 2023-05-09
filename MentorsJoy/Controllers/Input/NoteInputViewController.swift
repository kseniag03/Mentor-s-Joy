//
//  NoteInputViewController.swift
//  MentorsJoy
//

import UIKit

class NoteInputViewController: CommonInputViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemCyan
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}
