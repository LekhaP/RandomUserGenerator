//
//  RandomUserDetailPageViewController.swift
//  RandomUsers
//
//  Created by Preeti Lekha on 6/28/17.
//  Copyright © 2017 randomuser. All rights reserved.
//

import Foundation
import UIKit

let  PROFILE_IMAGEVIEW_TAG = 101
let  DETAIL_NAME_LABEL_TAG = 102
let  DETAIL_HEADING_LABEL_TAG = 103
let  DETAIL_CONTENT_LABEL_TAG = 104


class RandomUserDetailPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var userDetailTableView : UITableView!
    var userDetails : RandomUser!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        var cellHeight :CGFloat = 0
        switch indexPath.row {
        case 0:
            cellHeight = (HSUtilities.isIphone ? max(150,UITableViewAutomaticDimension) : max((150*1.2),(UITableViewAutomaticDimension*1.2)))
            break;
        case 1:
             cellHeight = (HSUtilities.isIphone ? max(60,UITableViewAutomaticDimension) : max((60*1.2),(UITableViewAutomaticDimension*1.2)))
             break;
        default:
            cellHeight = UITableViewAutomaticDimension
        }
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileImageCell")
            if !userDetails.userFullImageUrlSting.isEmpty {
                let url = URL(string: userDetails.userFullImageUrlSting)
                let imageData = NSData(contentsOf: (url)!)
                
                let profileImageView = cell?.contentView.viewWithTag(PROFILE_IMAGEVIEW_TAG) as! UIImageView
                profileImageView.image = UIImage(data: imageData! as Data)
            }
            return cell!
            
        }  else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserNameCell", for: indexPath)
            let nameLabel = cell.contentView.viewWithTag(DETAIL_NAME_LABEL_TAG) as! UILabel
            nameLabel.font = Constants.Font.RalewaySemiBold.withSize(Constants.randomUserDetailPageUserNameFontSize)
            nameLabel.text = userDetails.userName.fullName()
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell")
            
            let headingLabel = cell?.contentView.viewWithTag(DETAIL_HEADING_LABEL_TAG) as! UILabel
            headingLabel.font = Constants.Font.RalewayRegular.withSize(Constants.randomUserDetailPageOthersFontSize)
            
            let contentLabel = cell?.contentView.viewWithTag(DETAIL_CONTENT_LABEL_TAG) as! UILabel
            contentLabel.font = Constants.Font.RalewayRegular .withSize(Constants.randomUserDetailPageOthersFontSize)
            
            
            var heading :String!
            var content :String!
            
            switch indexPath.row {
            case 2:
                heading = "Email: "
                content = userDetails.userEmail
                break;
            case 3:
                heading = "Phone: "
                content = userDetails.userPhone
                break;
            case 4:
                heading = "Cell: "
                content = userDetails.userCell
                break;
            default:
                heading = ""
                content = ""
            }
            
            headingLabel.text = heading
            contentLabel.text = content
            return cell!
        }
    }
    
}
