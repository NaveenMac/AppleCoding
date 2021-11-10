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
    
    private var allViewConstraints = [NSLayoutConstraint]()
    private enum Metrics {
        static let padding:CGFloat = 15.0
        static let imageWidth:CGFloat = 60.0
        static let topMargin:CGFloat = 40.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table = UITableView()
        table?.backgroundColor = .gray
        table?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(table!)
       
        if records.isEmpty {
            for index in 0...4 {
                if let url = URL(string: imageUrls[index]) {
                    records.append(Item(detail: "Image \(index+1)", image: ImageCache.publicCache.placeholderImage, url: url))
                }
               
            }
        }
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        if !allViewConstraints.isEmpty{
            NSLayoutConstraint.deactivate(allViewConstraints)
            allViewConstraints.removeAll()
        }
        let newInsets = self.view.safeAreaInsets
        let leftMargin = newInsets.left > 0 ? newInsets.left : Metrics.padding
        let rightMargin = newInsets.right > 0 ? newInsets.right:Metrics.padding
        let topMargin = newInsets.top > 0 ? newInsets.top : Metrics.padding
        let bottomMargin = newInsets.bottom > 0 ? newInsets.bottom : Metrics.padding
        let metrics = [
            "leftMargin": leftMargin,
            "rightMargin": rightMargin,
            "topMargin": topMargin,
            "bottomMargin": bottomMargin,
            "imageWidth": Metrics.imageWidth
        ]
        let views = ["table":table]
        
        let tableHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftMargin-[table]-rightMargin-|", options: [], metrics: metrics, views: views as [String : Any])
        let tableVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-topMargin-[table]-bottomMargin-|", options: [], metrics: metrics, views:views as [String : Any])
        
        allViewConstraints+=tableHorizontalConstraints
        allViewConstraints+=tableVerticalConstraints
        
        NSLayoutConstraint.activate(allViewConstraints)
        
        
    }


}

