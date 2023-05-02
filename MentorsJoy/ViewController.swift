//
//  ViewController.swift
//  MentorsJoy
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    var pdfURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPdfUrl()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        
        let openButton = UIButton()
        openButton.backgroundColor = .red
        openButton.titleLabel?.text = "OPEN-PDF"
        openButton.titleLabel?.textColor = .white
        openButton.addTarget(self, action: #selector(openPDFButtonPressed), for: .touchUpInside)
        
        self.view.addSubview(openButton);
        openButton.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor)
        openButton.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        openButton.pinLeft(to: self.view, 10)
        openButton.pinRight(to: self.view, 10)
    }
    
    private func setupPdfUrl() {
        guard let url = URL(string: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf")
        else { return }
        pdfURL = url
    }

    @objc
    private func openPDFButtonPressed(_ sender: Any) {
        let pdfViewController = PDFViewController()
        pdfViewController.pdfURL = self.pdfURL
        //present(pdfViewController, animated: false, completion: nil)
        navigationController?.pushViewController(pdfViewController, animated: true)
    }
}
