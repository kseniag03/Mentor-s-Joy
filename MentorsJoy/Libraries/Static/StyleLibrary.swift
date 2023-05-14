//
//  StyleLibrary.swift
//  MentorsJoy
//

import TPPDF
import UIKit

// MARK: static fields for defining text or table style

final class StyleLibrary {
    
    static let timesFont = UIFont(
        descriptor: UIFontDescriptor(
            name: "TimesNewRomanPSMT", size: 12.0
        ),
        size: 12.0
    )
    
    static let timesFont16 = UIFont(
        descriptor: UIFontDescriptor(
            name: "TimesNewRomanPSMT", size: 16.0
        ),
        size: 16.0
    )
    
    static let timesFont20 = UIFont(
        descriptor: UIFontDescriptor(
            name: "TimesNewRomanPSMT", size: 20.0
        ),
        size: 20.0
    )
    
    static let timesFontBold20 = UIFont(
        descriptor: UIFontDescriptor(
            name: "TimesNewRomanPS-BoldMT", size: 20.0
        ),
        size: 20.0
    )
    
    static let timesFont36 = UIFont(
        descriptor: UIFontDescriptor(
            name: "TimesNewRomanPSMT", size: 36.0
        ),
        size: 36.0
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
    
    static func createAddButtonConfig(title: String) -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.background.backgroundColor = .systemBlue
        config.baseBackgroundColor = .label
        config.baseForegroundColor = .white
        config.title = title
        config.attributedTitle?.font = StyleLibrary.timesFont20
        config.buttonSize = .medium
        config.background.cornerRadius = 12
        return config
    }
    
    static func setupButton(button: UIButton, title : String, view: UIView, constY: CGFloat, _ backColor: UIColor = .systemBlue, _ fontColor: UIColor = .white) {
        // Edit an empty button
        button.backgroundColor = backColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.titleLabel?.font = StyleLibrary.timesFont20
        button.layer.cornerRadius = 12
        
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
    
    static func setupButtonWithoutPlace(button: UIButton, title : String, _ backColor: UIColor = .systemBlue, _ fontColor: UIColor = .white) {
        // Edit an empty button
        button.backgroundColor = backColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(fontColor, for: .normal)
    }
}
