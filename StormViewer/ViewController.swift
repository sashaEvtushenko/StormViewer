//
//  ViewController.swift
//  StormViewer
//
//  Created by Sasha Evtushenko on 7/9/20.
//  Copyright © 2020 Sasha Evtushenko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAppTapped))
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let destinationViewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            destinationViewController.selectedImage = pictures[indexPath.row]
            destinationViewController.navBarTitle = "Picture \(indexPath.row + 1) of \(pictures.count)"
            navigationController?.pushViewController(destinationViewController, animated: true)
        }
    }
    
    @objc func shareAppTapped() {
        let activityViewController = UIActivityViewController(activityItems: ["Check out my app Storm Viewer.\nAmazing pictures already there.\nCheck it out!"], applicationActivities: [])
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }

}

