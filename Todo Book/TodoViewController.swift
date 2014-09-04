//
//  TodoViewController.swift
//  Todo Book
//
//  Created by jzhone on 14-8-31.
//  Copyright (c) 2014年 jzhone. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
    
    var todoItemList: NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled = false
        noteTextView.userInteractionEnabled = false

        titleTextField.text = todoItemList.objectForKey("itemTitle") as NSString
        noteTextView.text = todoItemList.objectForKey("itemSecription") as NSString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func deleteItem(sender: AnyObject) {
        var userDafults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var itemListArray: NSMutableArray = userDafults.objectForKey("itemList") as NSMutableArray
        var mutableItemArray: NSMutableArray = NSMutableArray()
        
        for dict: AnyObject in itemListArray{
            mutableItemArray.addObject(dict as NSDictionary)
        }
        
        mutableItemArray.removeObject(todoItemList)
        
        userDafults.removeObjectForKey("itemList")
        userDafults.setObject(mutableItemArray, forKey: "itemList")
        userDafults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
    }
    

}
