//
//  PinLibrary.swift
//  MentorsJoy
//

import UIKit

extension UIView {
    
    @discardableResult
    func pinTop(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(
            equalTo: superview.topAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinTop(to side: NSLayoutYAxisAnchor, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinBottom(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(
            equalTo: superview.topAnchor,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinBottom(to side: NSLayoutYAxisAnchor, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinLeft(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(
            equalTo: superview.leadingAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinLeft(to side: NSLayoutXAxisAnchor, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinRight(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(
            equalTo: superview.trailingAnchor,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinRight(to side: NSLayoutXAxisAnchor, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinWidth(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(
            equalTo: superview.widthAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinWidth(to side: NSLayoutDimension, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinHeight(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(
            equalTo: superview.heightAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinHeight(to side: NSLayoutDimension, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func setHeight(_ const: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: const)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func setWidth(_ const: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: const)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinCenterX(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerXAnchor.constraint(
            equalTo: superview.centerXAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func pinCenterY(to superview: UIView, _ const: CGFloat = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerYAnchor.constraint(
            equalTo: superview.centerYAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        return constraint
    }
    
    func pinCenter(to superview: UIView) {
        pinCenterX(to: superview)
        pinCenterY(to: superview)
    }
}
