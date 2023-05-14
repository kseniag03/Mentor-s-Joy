//
//  TextLabelCell.swift
//  MentorsJoy
//

import UIKit

class TextLabelCell: UITableViewCell {
    
    static let reuseIdentifier = "TextLabelCell"
    
    private var label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }

    @available (*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        label.font = StyleLibrary.timesFont16
        label.textColor = .label
        label.numberOfLines = 0
        label.backgroundColor = .white
        
        contentView.backgroundColor = .systemGray6
        
        contentView.addSubview(label)
        label.setHeight(75)
        label.pinLeft(to: contentView)
        label.pinRight(to: contentView)
        label.pinTop(to: contentView)
    }
    
    func configure(text: String) {
        label.text = text
    }
}
