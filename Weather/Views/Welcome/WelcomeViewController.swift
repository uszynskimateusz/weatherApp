//
//  WelcomeViewController.swift
//

import UIKit

final class WelcomeViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = WelcomeViewLayout()
    }
}
