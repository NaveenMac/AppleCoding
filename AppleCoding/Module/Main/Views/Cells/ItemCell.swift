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
    var container: UIStackView?
    var allViewContraints = [NSLayoutConstraint]()
    private let metrics = ["imageWidth":60.0, "spacing":16.0, "margin":16.0]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        itemLabel = UILabel()
        itemImageView = UIImageView()
        
        itemLabel?.translatesAutoresizingMaskIntoConstraints = false
        itemImageView?.translatesAutoresizingMaskIntoConstraints = false
        
        container = UIView.HStack(spacing: 16,alignment: .fill, distribution: .fill)
        container!.translatesAutoresizingMaskIntoConstraints = false
        container!.addArrangedSubview(itemImageView!)
        container!.addArrangedSubview(itemLabel!)
        
        self.contentView.addSubview(container!)
        
        
        self.addAllViewConstraints()
       
    }
    
    
    func addAllViewConstraints() {
        let viewDict = ["image":itemImageView, "title": itemLabel,"container":container]
        
        let containerHorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-margin-[container]-margin-|", options: [.alignAllCenterY], metrics: metrics, views: viewDict as [String : Any])
        allViewContraints += containerHorizontalConstraints
        
        let containerVerticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-[container]-|", options: [], metrics: metrics, views: viewDict as [String : Any])
        allViewContraints += containerVerticalConstraints
        let imageConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[image(==imageWidth)]", options: [.alignAllCenterY], metrics: metrics, views: viewDict as [String : Any])
        
        allViewContraints += imageConstraints
        
        
        NSLayoutConstraint.activate(allViewContraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
