//
//  ItemCell.swift
//  AppleCoding
//
//  Created by Naveen Chauhan on 10/11/21.
//

import UIKit

class ItemCell: UITableViewCell {
    typealias ImageDownloadedAction = (UIImage)->Void
    
    private var imageDownloadedAction:ImageDownloadedAction?
    
    var itemLabel: UILabel?
    var itemImageView:  UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        itemLabel = UILabel()
        itemImageView = UIImageView()
        
        itemLabel?.translatesAutoresizingMaskIntoConstraints = false
        itemImageView?.translatesAutoresizingMaskIntoConstraints = false
        
    
        self.contentView.addSubview(itemImageView!)
        self.contentView.addSubview(itemLabel!)
        
        let viewDict = ["image":itemImageView, "title": itemLabel]
        var viewConstraints = [NSLayoutConstraint] ()
        
        let rowConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(=60)]-16-[title]-|", options: [], metrics: nil, views: viewDict as [String : Any])
        
        viewConstraints += rowConstraints
        
        NSLayoutConstraint.activate(viewConstraints)
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
