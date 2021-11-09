//
//  ItemDataSource.swift
//  AppleCoding
//
//  Created by Naveen Chauhan on 10/11/21.
//

import UIKit

class ItemDataSource: NSObject {
    var items:[Item]?
    enum ItemSection:Int, CaseIterable{
        case item
        
        var displayTitle:String {
            switch self {
                case .item:
                    return "List of items"
                default:
                    print("Section Not Found")
            }
        }
        func cellIdentifier()->String{
            switch self {
                case .item:
                    return "itemCellIdentifier"
                default:
                    print("Section Not Found")
            }
        }
    }
    init(items:[Item]?) {
        self.items = items
    }
    private func dequeueAndConfigureCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        guard let section = ItemSection(rawValue: indexPath.section) else {
            fatalError("Section index out of range")
        }
        let identifier = section.cellIdentifier()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}

extension ItemDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
