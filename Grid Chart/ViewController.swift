//
//  ViewController.swift
//  Grid Chart
//
//  Created by Ajay M on 22/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Custom view variables
    @IBOutlet weak var gridViewController: UIView!
        @IBOutlet weak var zoomLabel: UILabel!

    // Custom private variables
    var gridView: GridView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set grid
        gridView = GridView()
        gridView.frame = self.gridViewController.frame
        self.view.addSubview(gridView)
    }
    
    @IBAction func zoomSlide(_ sender: UISlider, forEvent event: UIEvent) {
        let zoomValueStr = String(format: "%.2f", sender.value)
        print("Zoom factor: ", zoomValueStr)
        zoomLabel.text = "\(zoomValueStr)"
        gridView.setNewZoomValue(newScale: CGFloat(sender.value))
    }
}

