//
//  AddViewController.swift
//  Todo Book
//
//  Created by jzhone on 14-8-31.
//  Copyright (c) 2014年 jzhone. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var todoTitle: UITextField!
    @IBOutlet weak var todoText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDone(sender: AnyObject) {
        
        var userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList: NSMutableArray? = userDefault.objectForKey("itemList") as? NSMutableArray
        
        var todoList: NSMutableDictionary = NSMutableDictionary()
        todoList.setObject(todoTitle.text, forKey: "itemTitle")
        todoList.setObject(todoText.text, forKey: "itemSecription")
        
        if (itemList != nil) {
            var newMutableList: NSMutableArray = NSMutableArray()
            
            for dict: AnyObject in itemList! {
                newMutableList.addObject(dict as NSDictionary)
            }
            
            userDefault.removeObjectForKey("itemList")
            newMutableList.addObject(todoList)
            userDefault.setObject(newMutableList, forKey: "itemList")
            
        } else {
            userDefault.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList!.addObject(todoList)
            userDefault.setObject(itemList!, forKey: "itemList")
        }
        
        userDefault.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
