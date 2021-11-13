//
//  MainTableViewController.swift
//  SampleChatKitApp
//
//  Created by Apple on 13/11/21.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let simpleChatViewController = SimpleChatViewController()
            navigationController?.pushViewController(simpleChatViewController, animated: true)
        default:
            break
        }
    }
    
}
