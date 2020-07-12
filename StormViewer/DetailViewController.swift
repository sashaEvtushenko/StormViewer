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
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = false
    }
}
