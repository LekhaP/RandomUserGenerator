//
//  Constants.swift
//  FireFighters
//
//  Created by OSU App Center on 10/27/15.
//  Copyright © 2015 OSU AppCenter. All rights reserved.
//

import Foundation
import UIKit

struct Constants {

    //Random User Listing Page
    static let randomUserListingPageUserNameFontSize : CGFloat = (HSUtilities.isIphone ? 18 : (18*1.2))

    //Random User Details Page
    static let randomUserDetailPageUserNameFontSize : CGFloat = (HSUtilities.isIphone ? 20 : (20*1.2))
    static let randomUserDetailPageOthersFontSize : CGFloat = (HSUtilities.isIphone ? 16 : (16*1.2))

    
    //Text Color
    static let HsGrayColor : UIColor = UIColor(colorLiteralRed: 68/255, green: 68/255, blue: 68/255, alpha: 1)
    static let HsGrayColorShade1 : UIColor = UIColor(colorLiteralRed: 52/255, green: 182/255, blue: 244/255, alpha: 1)
    static let HsBlueColor : UIColor = UIColor(colorLiteralRed: 83/255, green: 198/255, blue: 252/255, alpha: 1)

    struct Font {
        static let RalewayBold = UIFont(name: "Raleway-Bold",size: 16.0)!
        static let RalewayExtraBold = UIFont(name: "Raleway-ExtraBold",size: 16.0)!
        static let RalewayExtraLight = UIFont(name: "Raleway-ExtraLight",size: 16.0)!
        static let RalewayHeavy = UIFont(name: "Raleway-Heavy",size: 16.0)!
        static let RalewayLight = UIFont(name: "Raleway-Light",size: 16.0)!
        static let RalewayMedium = UIFont(name: "Raleway-Medium",size: 16.0)!
        static let RalewayRegular = UIFont(name: "Raleway",size: 16.0)!
        static let RalewaySemiBold = UIFont(name: "Raleway-SemiBold",size: 16.0)!
        static let RalewayThin = UIFont(name: "Raleway-Thin",size: 16.0)!
        
    }

}
