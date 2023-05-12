//
//  StyleLibrary.swift
//  MentorsJoy
//

import TPPDF
import UIKit

// MARK: static fields for defining text or table style

class StyleLibrary {
    
    static let timesFont = UIFont(
        descriptor: UIFontDescriptor(
            name: "TimesNewRomanPSMT", size: 12.0
        ),
        size: 12.0
    )
    
    static let style = PDFTableCellStyle(
        colors: (fill: .clear, text: .black),
        borders: .none,
        font: UIFont(
            descriptor: UIFontDescriptor(
                name: "TimesNewRomanPSMT", size: 12.0
            ),
            size: 12.0
        )
    )
    
    static let styleBold = PDFTableCellStyle(
        colors: (fill: .clear, text: .black),
        borders: .none,
        font: UIFont(
            descriptor: UIFontDescriptor(
                name: "TimesNewRomanPS-BoldMT", size: 12.0
            ),
            size: 12.0
        )
    )
    
    static let styleItalic = PDFTableCellStyle(
        colors: (fill: .clear, text: .black),
        borders: .none,
        font: UIFont(
            descriptor: UIFontDescriptor(
                name: "TimesNewRomanPS-ItalicMT", size: 12.0
            ),
            size: 12.0
        )
    )
    
    static let tableStyle = PDFTableCellStyle(
        colors: (fill: .clear, text: .black),
        borders: PDFTableCellBorders(
            left: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5),
            top: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5),
            right: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5),
            bottom: PDFLineStyle(type: .full, color: UIColor.black, width: 0.5)
        ),
        font: UIFont(
            descriptor: UIFontDescriptor(
                name: "TimesNewRomanPSMT", size: 12.0
            ),
            size: 12.0)
    )
    
    static func setupButton(button: UIButton, title : String, view: UIView, constY: CGFloat,
                             _ backColor: UIColor = .systemRed, _ fontColor: UIColor = .white) {
        // Edit an empty button
        button.backgroundColor = backColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // Center the button horizontally and vertically
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constY),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
