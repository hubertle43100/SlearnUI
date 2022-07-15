//
//  SelectionScreen.swift
//  DelegateProtocol
//
//  Created by Hubert Le on 5/31/22.
//

import UIKit

class SelectionScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func blueButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func redButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
