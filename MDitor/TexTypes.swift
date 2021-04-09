//
//  TexTypes.swift
//  MDitor
//
//  Created by Martin Lacaille on 23/11/2020.
//

import Foundation
import SwiftUI

enum TextType
{
    case body
    case T1
    case T2
    case T3
    case italic
    case bold
    case underline
}

//TextToPrint("hello", TextType.T1)

func TextToPrint(content: String, textType: TextType) -> Text
{
    var text = Text(content)
    switch textType
    {
    case TextType.T1:
        text = text.font(.title)
    case TextType.T2:
        text = text.font(.title2)
    case TextType.T3:
        text = text.font(.title3)
    case TextType.italic:
        text = text.italic()
    case TextType.bold:
        text = text.bold()
    case TextType.underline:
        text = text.underline()
    default:
        break
        
    }
    
    return text
    
}


