//
//  TextFieldTableViewCell.swift
//  MentorsJoy
//

import UIKit

class TextFieldCell: UITableViewCell, UITextFieldDelegate {
    
    static let reuseIdentifier = "TextFieldCell"
    
    let textField = UITextField()

    var currentIndex = 0
    
    var maxLength = 20
    
    var currentType: DocumentType = .common
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(textField)
    }

    @available (*, unavailable)
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
    
    // MARK: defining changed textField content

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Get the new text value of the text field
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)

        print("New text value: \(newText ?? ""), indexPath: \(currentIndex)")
        
        if let text = newText {
            if (text.count <= maxLength) {
                changeValue(index: currentIndex, new: text)
            }
            return text.count <= maxLength
        } else {
            return false
        }
    }
    
    func changeValue(index: Int, new: String) {
        
        var text = TextConst.texts
        switch currentType {
        case .task:
            text = TextConst.taskTexts
            break
        case .note:
            text = TextConst.noteTexts
            break
        case .testing:
            text = TextConst.testingTexts
            break
        case .manual:
            text = TextConst.manualTexts
            break
        case .programm:
            text = TextConst.programTexts
            break
        default:
            break
        }
        
        guard let change = text[index] else { return }
        change.action(new)
    }
}
