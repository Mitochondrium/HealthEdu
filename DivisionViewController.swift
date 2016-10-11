//
//  DivisionViewController.swift
//  The first viewController in Class tab menu
//  HealthEdu
//
//  Created by Yu-Ju Lin, Hsieh-Ting Lin.
//  Copyright © 2016年 衛教成大. All rights reserved.
//

import UIKit

class DivisionViewController: UIViewController, UITableViewDataSource{
    
    // MARK: - Variable Declaration
    
    var hierarchy = [domain?]()
    
    @IBOutlet var tableView: UITableView!

    
    let NckuHospital = ["最新消息"]
    let InternalMedicine = ["胸腔內科","感染科","血液腫瘤科"]
    let Surgical = ["一般外科","小兒外科","骨科"]
    
    /**
     Define how many section in table view, need modified in beta version
     - returns: 1:Int
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            
            try hierarchy = DomainsDivisions.getHierarchy()
            
        } catch {
            
            // can not build Domains Division json hierarchy
            let alertMessage = UIAlertController(title: "APP檔案毀損", message: "請移除「衛教成大」，再重新下載、安裝！", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "知道了", style: .Default, handler: nil)

            
            alertMessage.addAction(okAction)
            
            // need add dispatch
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.presentViewController(alertMessage, animated: true, completion:nil)
            })

            
        }
        
        
        
        
    }
    
    func ShowgetHierarchyError() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return hierarchy.count
    }
    
    /**
     Define numberOfRowsInSection
     
     - returns: count of different array. Add more condition in future
     */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hierarchy[section]!.division_data.count
        
    }
    /**
     Define cell
     - returns: cell
     */
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("division", forIndexPath: indexPath) as UITableViewCell
        

        let division_name = hierarchy[indexPath.section]!.division_data[indexPath.row]!.division
        cell.textLabel?.text = division_name
        
         // MARK: important ! Change in future
        
        return cell
    }
    /**
     Define the title for header in section
     - returns: string
     */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return hierarchy[section]!.domain
        
        // MARK: important ! Change in future
    }
    
    /**
     Pass the data to the DevisionOnlyVC
     - returns: string
     */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let devisionVC = segue.destinationViewController as! DevisionOnlyVC
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            
            devisionVC.sectionSelected = indexPath.section
            devisionVC.rowSelected = indexPath.row
            
        }
    }
    
}
