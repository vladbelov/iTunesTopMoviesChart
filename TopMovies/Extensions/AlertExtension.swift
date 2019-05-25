//
//  AlertExtension.swift
//  TopMovies
//
//  Created by Владислав on 21/02/2019.
//  Copyright © 2019 Владислав. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String, dismiss: Bool = false, presented: Bool = false) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { (_: UIAlertAction!) in
            if dismiss {
                if presented {
                    self.dismiss(animated: true)
                }
                else {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }))
        present(alert, animated: true)
    }
}
