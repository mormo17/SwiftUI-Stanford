//
//  PalleteChooser+MenuButton.swift
//  Assignment 5
//
//  Created by Mariam Ormotsadze on 17.03.23.
//

import Foundation

extension PaletteChooser {
    enum MenuButton: String {
        case new = "New"
        case edit = "Edit"
        case delete = "Delete"
        case manage = "Manage"
        case goTo = "Go to"
        
        var imageName: String {
            switch self {
            case .new: return Image_Names.addButton
            case .edit: return Image_Names.editButton
            case .delete: return Image_Names.deleteButton
            case .manage: return Image_Names.manageButton
            case .goTo: return Image_Names.goToButton
            }
        }
        
        var title: String { rawValue }
    }

}
