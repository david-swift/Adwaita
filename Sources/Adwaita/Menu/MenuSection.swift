//
//  Submenu.swift
//  Adwaita
//
//  Created by david-swift on 22.10.23.
//

import GTUI

/// A section for menus.
public struct MenuSection: MenuItem {

    /// The content of the section.
    var sectionContent: MenuContent

    /// Initialize a section for menus.
    /// - Parameter content: The content of the section.
    public init(@MenuBuilder content: () -> MenuContent) {
        self.sectionContent = content()
    }

    /// Add the section to a menu.
    /// - Parameters:
    ///   - menu: The menu.
    ///   - app: The application containing the menu.
    ///   - window: The application window containing the menu.
    public func addMenuItem(menu: GTUI.Menu, app: GTUIApp, window: GTUIApplicationWindow?) {
        let section = GTUI.Menu()
        _ = menu.append("", section: section)
        for element in sectionContent {
            element.addMenuItems(menu: section, app: app, window: window)
        }
    }

}
