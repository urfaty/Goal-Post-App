//
//  UIViewControllerExt.swift
//  GoalPostApp
//
//  Created by Tayfur Salih Şen on 18.01.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        //transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: nil)
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)

           
    }
    
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
       // transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight

        guard let presentedViewController = presentedViewController else { return }
        viewControllerToPresent.modalPresentationStyle = .fullScreen

        presentedViewController.dismiss(animated: true) {
            self.view.window?.layer.add(transition, forKey: nil)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
