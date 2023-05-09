//
//  ManualInputViewController.swift
//  MentorsJoy
//

import UIKit

class ManualInputViewController: CommonInputViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemMint
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}
