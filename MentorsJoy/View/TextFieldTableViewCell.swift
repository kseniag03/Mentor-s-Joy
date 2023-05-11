//
//  TextFieldTableViewCell.swift
//  MentorsJoy
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    let textField = UITextField()
    
    var currentIndex = 0
    
    //public var delegate: UITextFieldDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(textField)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textField.delegate = self
        textField.frame = self.contentView.bounds.inset(
            by: UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        )
    }
    
    @objc
    private func textViewDidChange(_ sender: UITextView) {
        //delegate?.cellValueDidChange(self)
    }
    
    // MARK: defining changed textField content
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Get the new text value of the text field
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)

        // Get the index path of the cell that contains the text field
        let tableView = superview as? UITableView
        currentIndex = tableView?.indexPath(for: self)?.row ?? -1

        // Do something with the new text value and the index path
        print("New text value: \(newText ?? ""), indexPath: \(currentIndex)")
        
        if let text = newText {
            changeValue(index: currentIndex, new: text)
        }

        // Return true to allow the text change, or false to reject it
        return true
    }
    
    func changeValue(index: Int, new: String) {
        guard let change = TextConst.texts[index] else { return }
        change.action(new)
    }
}

// MARK: add custom cells with segmenterControl and datePicker???

