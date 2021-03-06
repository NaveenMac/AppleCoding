//
//  ItemDataSource.swift
//  AppleCoding
//
//  Created by Naveen Chauhan on 10/11/21.
//

import UIKit

class ItemDataSource: NSObject {
    var records = [Item]()
    enum ItemSection:Int, CaseIterable{
        case main
        
        var displayTitle:String {
            switch self {
                case .main:
                    return "List of items"
                
            }
        }
        func cellIdentifier()->String{
            switch self {
                case .main:
                    return "itemCellIdentifier"
                
            }
        }
    }
    init(items:[Item]) {
        self.records = items
    }
    private func dequeueAndConfigureCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        
        guard let section = ItemSection(rawValue: indexPath.section) else {
            fatalError("Section index out of range")
        }
        
        let identifier = section.cellIdentifier()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let currentItem = records[indexPath.row]
        
        switch section {
            case .main:
                if let mainCell = cell as? ItemCell {
                    mainCell.itemLabel?.text = currentItem.detail
                    mainCell.itemImageView?.image = currentItem.image
                }
        }
        
        return cell
    }
}

extension ItemDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueAndConfigureCell(
                for: indexPath,
                from: tableView
           )
        let currentItem = records[indexPath.row]
        ImageCache.publicCache.load(
            url: currentItem.url as NSURL,
            item: currentItem
        ) { (fetchedItem, image) in
            
            if let _ = cell as? ItemCell,
               let img = image,
               img != fetchedItem.image
            {
                currentItem.image = img
                tableView.reloadData()
               // itemCell.itemImageView?.image = img
            }
        }
        
        return cell
    }
    
    
}
