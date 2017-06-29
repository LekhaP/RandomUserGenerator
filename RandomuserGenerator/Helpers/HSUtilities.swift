//
//  HSUtilities.swift
//  HomeSafety
//
//  Created by osuappcenter on 9/15/16.
//  Copyright © 2016 osuappcenter. All rights reserved.
//

import UIKit


open class HSUtilities {
        
    static let sharedUtilities = HSUtilities()
    
    static var isIpad:Bool {
        if #available(iOS 8.0, *) {
            return UIScreen.main.traitCollection.userInterfaceIdiom == .pad
        } else {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    static var isIphone:Bool {
        if #available(iOS 8.0, *) {
            return UIScreen.main.traitCollection.userInterfaceIdiom == .phone
        } else {
            return UIDevice.current.userInterfaceIdiom == .phone
        }
    }
   }

