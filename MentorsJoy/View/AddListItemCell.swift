//
//  AddListItemCell.swift
//  MentorsJoy
//

import UIKit

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
        textView.font = StyleLibrary.timesFont16
        textView.textColor = .tertiaryLabel
        textView.backgroundColor = .white
        
        addButton.configuration = StyleLibrary.createAddButtonConfig(title: "Добавить")
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        
        contentView.addSubview(textView)
        textView.setHeight(150)
        textView.pinLeft(to: contentView)
        textView.pinRight(to: contentView)
        textView.pinTop(to: contentView)

        contentView.addSubview(addButton)
        addButton.setHeight(50)
        addButton.pinTop(to: textView.bottomAnchor, 25)
        addButton.pinCenterX(to: textView)
        
        textView.delegate = self
        textView.text = "...Добавить элемент списка..."
        
        contentView.backgroundColor = .systemGray6
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        print("clicked to add new list item")
        print("current textView content = \(textView.text ?? "NIL?")")
        if !textView.text.elementsEqual("...Добавить элемент списка...") && !textView.text.isEmpty {
            // add item to data in ListInputCtrl
            self.delegate?.newListItem(item: textView.text)
            textView.text = "...Добавить элемент списка..."
            textView.textColor = .tertiaryLabel
        }
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
