//
//  File.swift
//  MDitor
//
//  Created by Martin Lacaille on 23/11/2020.
//

import Foundation
import SwiftUI


func parseLine(line : String)-> [Text]
{
    var str: [String]
    str = []
    
    var isItalic = false
    var isBold = false
    var isUnderlined = false
    
    if line.prefix(2) == "# "
    {
        str.append(String(line.dropFirst(2)) + "\n")
        return [TextToPrint(content: str[0], textType: TextType.T1)]
        
    }
    
    if line.prefix(3) == "## "
    {
        str.append(String(line.dropFirst(3)) + "\n")
        return [TextToPrint(content: str[0], textType: TextType.T2)]
    }
    
    
    if line.prefix(4) == "### "
    {
        str.append(String(line.dropFirst(4)) + "\n")
        return [TextToPrint(content: str[0], textType: TextType.T3)]
        
    }
    
    var returnLine: [Text]
    returnLine = []
    
    for word in line.split(separator: " ")
    {
        let wordToModify = word.replacingOccurrences(of: "**", with: "").replacingOccurrences(of: "_", with: "") + " "
        
        
        if word.prefix(2) == "**"
        {
            isBold = true
        }
        

        if word.prefix(2) == "__"
        {
            isUnderlined = true
        }
        else if word.prefix(1) == "_"
        {
            isItalic = true
        }
        
        if(isBold)
        {
            returnLine.append(TextToPrint(content: String(wordToModify), textType: TextType.bold))
        }
        
        else if (isItalic)
        {
            returnLine.append(TextToPrint(content: String(wordToModify), textType: TextType.italic))
        }
        else if (isUnderlined)
        {
            returnLine.append(TextToPrint(content: String(wordToModify), textType: TextType.underline))
        }
        else
        {
            returnLine.append(TextToPrint(content: String(wordToModify), textType: TextType.body))
        }
        
        if word.suffix(2) == "**"
        {
            isBold = false
        }
        
        if word.suffix(2) == "__"
        {
            isUnderlined = false
        }
        
        else if word.suffix(1) == "_"
        {
            isItalic = false
        }
        
        
        
    }
    
    returnLine.append(Text("\n"))
    
    return returnLine
        
    
    
}

func Parser(content: [String.SubSequence])->[Text]
{
    var returnText : [Text]
    returnText = []
    
    
    for line in content
    {
        returnText += parseLine(line: String(line))
        
    }
    
    
    return returnText
}

func greatView(content: [String.SubSequence])-> Text
{
    
    let txtToDisplay = Parser(content: content)
    var final = Text("")
    for  i in txtToDisplay
    {
        final = final + i
    }

    return final
    
}
