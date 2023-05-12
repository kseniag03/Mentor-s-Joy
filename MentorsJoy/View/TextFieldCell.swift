//
//  TextFieldTableViewCell.swift
//  MentorsJoy
//

import UIKit

protocol AddListItemDelegate {
    
    func newListItem(item: String)
}

class CustomCell: UITableViewCell {
    
    static let reuseIdentifier = "CustomCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //self.contentView.addSubview()
    }

    @available (*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        
    }
}

class TextFieldCell: UITableViewCell, UITextFieldDelegate {
    
    static let reuseIdentifier = "TextFieldCell"
    
    let textField = UITextField()

    var currentIndex = 0
    

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
    
    private func setupView() {
        
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

/*
// MARK: add custom cells with segmenterControl and datePicker???

class TextFieldTableViewCellForList: TextFieldTableViewCell {
    
    var addButton = UIButton()
    
    var delegate: AddListItemDelegate?
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
    
    override func changeValue(index: Int, new: String) {
        guard let change = TextConst.texts[index] else { return }
        change.action(new)
    }
}*/

final class AddListItemCell: UITableViewCell, UITextViewDelegate {
    
    static let reuseIdentifier = "AddListItemCell"
    
    private var textView = UITextView()
    public var addButton = UIButton()
    
    public var delegate: AddListItemDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        textView.font = StyleLibrary.timesFont//.systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .tertiaryLabel
        textView.backgroundColor = .systemTeal//.clear
        //textView.pinHeight(to: self.contentView, 140)
        
        // Set the frame of the text view
        textView.frame = CGRect(x: 20, y: 20, width: contentView.frame.width - 40, height: 200)
        
        textView.delegate = self
        textView.text = "...Добавить элемент списка..."
        
        addButton.configuration = createAddButtonConfig()
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        
        contentView.addSubview(textView)
        
        // Set up the text view's layout constraints to position and size it on the screen
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        contentView.addSubview(addButton)
        
        // Set up the text view's layout constraints to position and size it on the screen
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        /*let stackView = UIStackView(arrangedSubviews: [textView, addButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        
        contentView.addSubview(stackView)
        stackView.pinTop(to: contentView, 16)
        stackView.pinLeft(to: contentView, 16)
        stackView.pinRight(to: contentView, 16)
        stackView.pinBottom(to: contentView, 16)*/
        
        contentView.backgroundColor = .systemBackground
    }
    
    func createAddButtonConfig() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.background.backgroundColor = .label
        config.baseBackgroundColor = .label
        config.baseForegroundColor = .systemBackground
        config.title = "Добавить"
        config.attributedTitle?.font = .systemFont(ofSize: 16, weight: .medium)
        config.buttonSize = .medium
        config.background.cornerRadius = 12
        return config
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        print("clicked to add new list item")
        print("current textView content = \(textView.text ?? "NIL?")")
        //if !textView.text.elementsEqual("...Добавить элемент списка...") && !textView.text.isEmpty {
            // add item to data in ListInputCtrl
            self.delegate?.newListItem(item: textView.text)
            textView.text = "|"
            textView.textColor = .tertiaryLabel
        //}
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .tertiaryLabel {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "|"
            textView.textColor = .tertiaryLabel
        }
    }
}
