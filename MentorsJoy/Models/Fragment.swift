//
//  Fragment.swift
//  MentorsJoy
//

typealias Action = (String) -> Void

typealias RemoveAction = (Int) -> Void

struct Fragment {
    
    let name: String
    
    let action: Action
    
    let removeAction: RemoveAction?
    
    let vc: ListInputViewController?
}
