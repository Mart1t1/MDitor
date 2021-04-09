//
//  OnShareTap.swift
//  MDitor
//
//  Created by Martin Lacaille on 02/03/2021.
//

import Foundation
import UIKit


func onShareTap(InputText : String)
{
    let activityController = UIActivityViewController(activityItems: [InputText], applicationActivities: nil)

            UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
}

//func onOpenTap(
