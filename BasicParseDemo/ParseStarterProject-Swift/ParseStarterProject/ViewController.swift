/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This function is called when the Select Image button is tapped on. This function uses the imagePickerController function to open up a screen that lets the user choose an image from the photo library.
    @IBAction func selectImage(sender: AnyObject) {
        let image = UIImagePickerController()
        
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        //Once the user has chosen the image, the imageView in our viewcontroller gets this image.
        imageView.image = image
        
    }
    
    
    //This function is called when the Post Image button is tapped on. It creates a PFObject, specifies its fields, and saves the object to our database.
    @IBAction func postImage(sender: AnyObject) {
        var imageObject = PFObject(className: "Images")
        imageObject["createdBy"] = "Akkshay"
        imageObject["image"] = PFFile(data: UIImageJPEGRepresentation(imageView.image!, 0.5)!)
        imageObject.saveInBackgroundWithTarget(nil, selector: nil)
    }
    
    
    
}
