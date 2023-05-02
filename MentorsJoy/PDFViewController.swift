//
//  PDFViewController.swift
//  MentorsJoy
//

import UIKit
import PDFKit

class PDFViewController : UIViewController {
    var pdfView = PDFView()
    var pdfURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        pdfView.frame = self.view.frame
    }
    
    private func setupView() {
        self.view.addSubview(pdfView)
        
        if let url = pdfURL {
            if let document = PDFDocument(url: url) {
                pdfView.document = document
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
