//
//  HelperUI.swift
//  SearchMeli
//
//  Created by Julian Ramos on 4/27/22.
//

import Foundation
import UIKit

class HelperUI {
    static func showAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "Alert", message: "Solo el Buscador del encabezado esta funcional. para la prueba", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // swiftlint:disable switch_case_alignment
            switch action.style {
                case .default:
                print("default")
                alert.dismiss(animated: true, completion: nil)
                case .cancel:
                break
                case .destructive:
                break
            @unknown default:
                break
            }
        }))
        vc.present(alert, animated: true, completion: nil)
    }
}
