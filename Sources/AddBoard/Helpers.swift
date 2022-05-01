//
//  Helpers.swift
//  
//
//  Created by Lucek Krzywdzinski on 01/05/2022.
//

import SwiftUI

/// Form Class for AddBoard
///
/// You can change form of your add board using this class or using CGSize.
///
/// - Parameters:
///  - Parameter small: Small size of AddBoard
///  - Parameter medium: Medium size of AddBoard
///  - Parameter large: Large size of AddBoard
///  - Parameter extraLarge: Extra large size of AddBoard
///  - Parameter detail: Something between medium and large size
public struct AddBoardForm {
    #if os(watchOS)
    public static let small = CGSize(width:120, height:90)
    public static let medium = CGSize(width:120, height:160)
    public static let large = CGSize(width:180, height:90)
    public static let extraLarge = CGSize(width:180, height:90)
    public static let detail = CGSize(width:180, height:160)
    #else
    public static let small = CGSize(width: 180, height:120)
    public static let medium = CGSize(width: 180, height:240)
    public static let large = CGSize(width: 360, height:120)
    public static let extraLarge = CGSize(width: 360, height:240)
    public static let detail = CGSize(width: 180, height:120)
    #endif
}

/// Style class for AddBoard
///
/// You can costumize your add board using that class. For better expirence you should make style for dark mode using darkModeStyle
///
/// - Parameters:
///  - Parameter backgroundColor: Board background color
///  - Parameter accentColor: Color of buttons on your board. It can be accentColor of your app.
///  - Parameter textColor: Color of text on your board
///  - Parameter legendTextColor: text of down text
///  - Parameter dropShadowColor: Color of shadow
///  - Parameter darkModeStyle: Style of dark mode.
public class AddBoardStyle {
    /// Backgrond color of board.
    public var backgroundColor: Color
    /// Color of buttons on your board. It can be accentColor of your app.
    public var accentColor: Color
    /// Color of text on your board
    public var textColor: Color
    /// Color of legend on your board
    public var legendTextColor: Color
    /// Color of shadow behind your board
    public var dropShadowColor: Color
    /// Dark mode style of your board.
    public weak var darkModeStyle: AddBoardStyle?
    
    init(backgroundColor: Color, accentColor: Color, textColor: Color, legendTextColor: Color, dropShadowColor: Color) {
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.textColor = textColor
        self.legendTextColor = legendTextColor
        self.dropShadowColor = dropShadowColor
    }
    
    init(backgroundColor: Color, accentColor: Color, textColor: Color, legendTextColor: Color, dropShadowColor: Color, darkModeStyle: AddBoardStyle) {
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.textColor = textColor
        self.legendTextColor = legendTextColor
        self.dropShadowColor = dropShadowColor
        self.darkModeStyle = darkModeStyle
    }
    
    init() {
        let darkModeStyle = AddBoardStyle(backgroundColor: Color.black,
                                          accentColor: Color.accentColor,
                                          textColor: Color.white,
                                          legendTextColor: Color.gray,
                                          dropShadowColor: Color.gray)
        self.backgroundColor = Color.white
        self.accentColor = Color.accentColor
        self.textColor = Color.black
        self.legendTextColor = Color.gray
        self.dropShadowColor = Color.gray
        self.darkModeStyle = darkModeStyle
    }
}
