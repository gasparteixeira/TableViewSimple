//
//  ViewController.swift
//  TableView
//
//  Created by Gaspar on 12/09/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource : NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...20
        {
            let tempName : String  = "Gaspar \(i)"
            let tempLastName : String = "Teixeira \(i)"
            let tempUser : NSArray = NSArray(objects: tempName, tempLastName)
            self.dataSource.addObject(tempUser)
            
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let myObject : NSArray = self.dataSource.objectAtIndex(indexPath.row) as! NSArray
        let myMessage : String = (myObject.objectAtIndex(0) as! String) + " " + (myObject.objectAtIndex(1) as! String)
        print(myMessage)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myId : String = "example"
        
        var cell : UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(myId)
        
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: myId)
        }
        
        let myObject : NSArray = self.dataSource.objectAtIndex(indexPath.row) as! NSArray
        
        cell.textLabel?.text = myObject.objectAtIndex(0) as? String
        cell.detailTextLabel?.text = myObject.objectAtIndex(1) as? String
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

