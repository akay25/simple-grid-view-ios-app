//
//  ViewController.swift
//  Grid Chart
//
//  Created by Ajay M on 22/07/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // Custom view variables
    @IBOutlet weak var gridViewController: UIScrollView!
    @IBOutlet weak var zoomLabel: UILabel!

    // Custom private variables
    var gridView: GridView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set scrollview window
        gridViewController.delegate = self
        gridViewController.maximumZoomScale = 2
        gridViewController.minimumZoomScale = 0.5
        let contentWidth = CGFloat(1600)
        let contentHeight = CGFloat(1600)
        gridViewController.contentSize = CGSize(width: contentWidth, height: contentHeight)

        // Set grid
        gridView = GridView()
        gridView.frame = self.gridViewController.frame
        gridView.contentSize = gridViewController.contentSize
        gridViewController.addSubview(gridView)
    }
    
    @IBAction func zoomSlide(_ sender: UISlider, forEvent event: UIEvent) {
        let zoomValueStr = String(format: "%.2f", sender.value)
        print("Zoom factor: ", zoomValueStr)
        zoomLabel.text = "\(zoomValueStr)"
        gridView.setNewZoomValue(newScale: CGFloat(sender.value))
        gridViewController.setZoomScale(CGFloat(sender.value), animated: true)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
            return gridView
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("Dragging started")
    }
}

