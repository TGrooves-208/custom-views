//
//  ViewController.swift
//  fresh-table-view
//
//  Created by Gil Aguilar on 2/23/16.
//  Copyright © 2016 redeye-dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var uglyThings = ["https://s-media-cache-ak0.pinimg.com/originals/f1/9a/51/f19a5199180cc1f5c82bb5367fca65b8.jpg", "http://i.telegraph.co.uk/multimedia/archive/01565/blobfish_1565953c.jpg","http://application.denofgeek.com/images/gb/25bb/gremlins2.jpg","https://i.ytimg.com/vi/tSEl8Xlmv70/hqdefault.jpg", "http://2.bp.blogspot.com/_ym-eqNRfJpA/SrQ9KqvREEI/AAAAAAAAEaA/UzVYGyyan9M/s400/Ugly_dog.jpg"]
    
    var uglyTitles = ["Man this is uuuugly!", "Oh hell no!", "WTF is this!","This is nasty!", "Ewwwww!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("UglyCell")
            as? UglyCell {
                
                var img: UIImage!
                
                let url = NSURL(string: uglyThings[indexPath.row])!
                
                if let data = NSData(contentsOfURL: url) {
                    img = UIImage(data: data)
                    
                } else {
                    img = UIImage(named: "eels")
                }
                
                cell.configureCell(img, text: uglyTitles[indexPath.row])
                
                return cell
        } else {
            return UglyCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uglyThings.count
    }

}



