//
//  RandomUserListingViewController.swift
//  RandomUsers
//
//  Created by Preeti Lekha on 6/27/17.
//  Copyright © 2017 randomuser. All rights reserved.
//

import Foundation
import UIKit


let  minCellHeight : CGFloat = 70


class RandomUserListingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var userListingTableView : UITableView!
    var randomlyGeneratedUsers : [RandomUser] = []
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Random Users"
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named:"backarrow")?.withRenderingMode(.alwaysOriginal)
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named:"backarrow")?.withRenderingMode(.alwaysOriginal)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.titleView?.tintColor = Constants.HsGrayColor
        
        generatedUserList()
    }
    
    
    func generatedUserList()
    {
        let requestURL: NSURL = NSURL(string: "https://randomuser.me/api/?results=50&nat=us&inc=name,email,phone,cell,picture&noinfo")!
        
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        URLSession.shared.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:Any]
                    if let users = jsonData["results"] as? [Any] {
                        for user in users {
                            let userObj = RandomUser(user: user as! NSDictionary)
                            self.randomlyGeneratedUsers.append(userObj)
                        }
                        if self.randomlyGeneratedUsers.count>0 {
                            OperationQueue.main.addOperation {
                                self.userListingTableView.reloadData()
                            }
                        }
                    }
                }catch {
                    print("Error with Json: \(error)")
                }
            }
            else {
                // Move to the UI thread
                DispatchQueue.main.async (execute: { () -> Void in
                    let alertcontroller = UIAlertController(title: "Error loading Data.", message: "Try again later.", preferredStyle: UIAlertControllerStyle.alert)
                    self.present(alertcontroller, animated: true, completion: nil)
                })
            }
        }.resume()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.randomlyGeneratedUsers.count
        return Int(count)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (HSUtilities.isIphone ? minCellHeight : (minCellHeight * 1.5))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomUserListingCell") as! RandomUserListingCell
        
        let user = randomlyGeneratedUsers[indexPath.row]
        cell.userName.textColor = Constants.HsBlueColor
        cell.userName.font = Constants.Font.RalewayMedium.withSize(Constants.randomUserListingPageUserNameFontSize)
        cell.userName.text = user.userName.fullName()
        
        
        if !user.userThumbnailImageUrlString.isEmpty {
            let url = URL(string: user.userThumbnailImageUrlString)
            let imageData = NSData(contentsOf: (url)!)
            cell.userThumbnailImage.image = UIImage(data: imageData! as Data)
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listingToDetailPage" {
            if let indexPath = self.userListingTableView?.indexPath(for: sender as! UITableViewCell) {
                let nextVC = segue.destination as! RandomUserDetailPageViewController
                nextVC.userDetails = self.randomlyGeneratedUsers[indexPath.row]
            }
        }
    }
}
