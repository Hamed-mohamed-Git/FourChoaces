//
//  AlertManager.swift
//  FourCoaches
//
//  Created by Hamed Mohamed on 09/05/2023.
//

import Foundation
import UIKit
class AlertManager {
    
    static func showSaveAlert(completion:@escaping ()->Void) -> UIAlertController {
        return self.showAlert(completion: completion, massage: "Do you really want to save this team", title: "Save confirm",ButtonTitle: "save")
    }
    
    static func showDeleteAlert(completion:@escaping ()->Void) -> UIAlertController {
        return self.showAlert(completion: completion, massage: "Do you really want to delete this team", title: "Delete confirm",ButtonTitle: "delete")
    }
    
    static func showEnternetConnectionAlert(completion:@escaping ()->Void) -> UIAlertController {
        return self.showAlert(completion: completion, massage: "No internet Connection. Please try again later.", title: "Loading Error",ButtonTitle: "Retry")
    }
    
    private static func showAlert(completion:@escaping ()->Void,massage:String,title:String,ButtonTitle:String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ButtonTitle, style: .default,handler: {  action in
            completion()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        return alert
    }
}
