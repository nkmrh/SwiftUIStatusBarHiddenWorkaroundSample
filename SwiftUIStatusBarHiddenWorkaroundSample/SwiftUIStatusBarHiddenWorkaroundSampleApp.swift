//
//  SwiftUIStatusBarHiddenWorkaroundSampleApp.swift
//  SwiftUIStatusBarHiddenWorkaroundSample
//
//  Created by hajime-nakamura on 2021/02/24.
//

import SwiftUI

@main
struct SwiftUIStatusBarHiddenWorkaroundSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct StatusBarControl: UIViewControllerRepresentable {
    var statusBarHidden: Bool

    func makeUIViewController(context: Context) -> StatusBarControlViewController {
        StatusBarControlViewController()
    }

    func updateUIViewController(_ uiViewController: StatusBarControlViewController, context: Context) {
        uiViewController.setStatusBarHidden(statusBarHidden)
    }
}

final class StatusBarControlViewController: UIViewController {
    private var statusBarHidden = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.isHidden = true
    }

    override var prefersStatusBarHidden: Bool {
        statusBarHidden
    }

    func setStatusBarHidden(_ hidden: Bool) {
        statusBarHidden = hidden
    }
}
