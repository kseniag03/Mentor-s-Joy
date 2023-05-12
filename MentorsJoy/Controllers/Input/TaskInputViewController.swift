//
//  TaskInputViewController.swift
//  MentorsJoy
//

import UIKit

class TaskInputViewController: UIViewController {
    
    let tableView = UITableView()
    
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
        tableView.delegate = self
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}

extension TaskInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
