//
//  ViewController.swift
//  AppleCoding
//
//  Created by Naveen Chauhan on 09/11/21.
//

import UIKit

class ItemListViewController: UIViewController {
    private var table:UITableView?
    private var tableDataSource:UITableViewDataSource?
    private var records = [Item]()
    private let imageUrls = [
        "https://images.hindustantimes.com/img/2021/08/19/1600x900/shiny_fruits_1629353640607_1629353653667.jpg",
        "https://www.eatthis.com/wp-content/uploads/sites/4//media/images/ext/769504118/apples-best-fruit-weight-loss.jpg?quality=82&strip=1&resize=640%2C360",
        "https://www.thekohsamuiguide.com/wp-content/uploads/2012/01/thai-fruit-32-1.jpg",
        "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/05/apples-1296x728-header.jpg?w=1155&h=1528",
        "https://www.verywellfit.com/thmb/a4580FjTjbub9q4kI5m9X-Po-p0=/2002x1334/filters:no_upscale():max_bytes(150000):strip_icc()/Bananas-5c6a36a346e0fb0001f0e4a3.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table = UITableView()
        
        let views = ["table":table]
        var viewConstraints = [NSLayoutConstraint]()
        
        let tableHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[table]-|", options: [], metrics: nil, views: views as [String : Any])
        let tableVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[table]-|", options: [], metrics: nil, views:views as [String : Any])
        
        viewConstraints+=tableHorizontalConstraints
        viewConstraints+=tableVerticalConstraints
        
        NSLayoutConstraint.activate(viewConstraints)
        
        
        if records.isEmpty {
            for index in 0...4 {
                if let url = URL(string: imageUrls[index]) {
                    records.append(Item(detail: "Image \(index+1)", image: ImageCache.publicCache.placeholderImage, url: url))
                }
               
            }
        }
    }


}

