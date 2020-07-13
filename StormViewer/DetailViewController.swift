//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Sasha Evtushenko on 7/10/20.
//  Copyright © 2020 Sasha Evtushenko. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedImage: String?
    var navBarTitle: String?

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = navBarTitle
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8), let imageName = selectedImage else {
            print("Error getting image from imageView")
            return
        }
        
        let viewController = UIActivityViewController(activityItems: [imageName, image], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
}
