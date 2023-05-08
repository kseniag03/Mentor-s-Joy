//
//  ViewController.swift
//  MentorsJoy
//

import UIKit
import PDFKit
import TPPDF

class ViewController: UIViewController {
    
    let sampleURL = "https://www.tutorialspoint.com/swift/swift_tutorial.pdf"
    
    var pdfURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPdfUrl()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        
        // Create an "Open PDF" button
        let openButton = UIButton()
        openButton.backgroundColor = .red
        openButton.setTitle("OPEN PDF", for: .normal)
        openButton.setTitleColor(.white, for: .normal)
        openButton.addTarget(self, action: #selector(openPDFButtonPressed), for: .touchUpInside)
        openButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(openButton)
        
        // Create a "Download PDF" button
        let downloadButton = UIButton()
        downloadButton.backgroundColor = .blue
        downloadButton.setTitle("DOWNLOAD PDF", for: .normal)
        downloadButton.setTitleColor(.white, for: .normal)
        downloadButton.addTarget(self, action: #selector(downloadPDFButtonPressed), for: .touchUpInside)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(downloadButton)
        
        // Center the "Open PDF" button horizontally and vertically
        NSLayoutConstraint.activate([
            openButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            openButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -30),
            openButton.widthAnchor.constraint(equalToConstant: 150),
            openButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Center the "Download PDF" button horizontally and vertically
        NSLayoutConstraint.activate([
            downloadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            downloadButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 30),
            downloadButton.widthAnchor.constraint(equalToConstant: 150),
            downloadButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupPdfUrl() {
        guard let url = URL(string: sampleURL)
        else { return }
        pdfURL = url
    }

    @objc
    private func openPDFButtonPressed(_ sender: Any) {
        
        let pdfViewController = PDFViewController()
        //pdfViewController.pdfURL = self.pdfURL
        navigationController?.pushViewController(pdfViewController, animated: true)
        //present(pdfViewController, animated: false, completion: nil)
    }
    
    @objc
    private func downloadPDFButtonPressed(_ sender: Any) {
        guard let url = URL(string: sampleURL) else { return }
        
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
}

extension ViewController:  URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("downloadLocation:", location)
        // create destination URL with the original pdf name
        guard let url = downloadTask.originalRequest?.url else { return }
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
        // delete original copy
        try? FileManager.default.removeItem(at: destinationURL)
        // copy from temp to Document
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            self.pdfURL = destinationURL
        } catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
}
