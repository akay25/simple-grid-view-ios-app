//
//  ViewController.swift
//  Grid Chart
//
//  Created by Ajay M on 22/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Custom view variables
    @IBOutlet weak var viewport: UIViewController!
    
    // Custom private variables
    var gridView: GridView!
    var zoomFactor: CGFloat = 0.5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set grid
        gridView = GridView()
        gridView.zoomFactor = zoomFactor
        gridView.frame = self.view.frame
        self.view.addSubview(gridView)
        
        // Set gesture handler
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        let touchPoint = sender.location(in: self.view)
        print("Clicked at: \(touchPoint.x), \(touchPoint.y)")
    }
}

