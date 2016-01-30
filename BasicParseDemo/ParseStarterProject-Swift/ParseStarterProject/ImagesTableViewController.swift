//
//  ImagesTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Akkshay Khoslaa on 1/13/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class ImagesTableViewController: UITableViewController {

    
    var imageObjects = Array<PFObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImagesFromDB()
    }
    
    
    //This query gets the image objects from the database from the data table named Images. Each object is a row from the database.
    func getImagesFromDB() {
        var query = PFQuery(className:"Images")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                // Set the imageObjects array to the objects found from the database.
                if let objects = objects {
                    self.imageObjects = objects
                }
                //Once we have gotten the objects from the database and stored them in our class variable imageObjects, we reload the tableview
                self.tableView.reloadData()
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //The number of rows in the data table is the number of objects in our imageObjects array
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imageObjects.count
    }

    //In this tableview delegate method, we specify how the cell should look.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //The cell has a custom class ImageTableViewCell, which we created
        let cell = tableView.dequeueReusableCellWithIdentifier("imageCell", forIndexPath: indexPath) as! ImageTableViewCell
        
        
        //imageObjects[indexPath.row] gives us the imageObject from the database corresponding to the current cell. Then when we access its "image" field, we get a PFFile which stores the image.
        var imageFile = imageObjects[indexPath.row]["image"] as! PFFile
        cell.parseImageView.image = nil
        
        //We then get the data from the image file
        imageFile.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                if let imageData = imageData {
                    
                    //We then construct a UIImage out of the data that we got from the image file
                    let image = UIImage(data:imageData)
                    
                    //We then set the cell's imageview's image to hold this UIImage that we constructed
                    cell.parseImageView.image = image
                }
            }
        }

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
