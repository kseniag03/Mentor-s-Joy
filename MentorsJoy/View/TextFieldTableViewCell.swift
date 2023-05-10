//
//  TextFieldTableViewCell.swift
//  MentorsJoy
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    let textField = UITextField()
    
    public var delegate: CellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(textField)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textField.frame = self.contentView.bounds.inset(
            by: UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        )
    }
    
    @objc
    private func textViewDidChange(_ sender: UITextView) {
        delegate?.cellValueDidChange(self)
    }
}

// MARK: add custom cells with segmenterControl and datePicker
