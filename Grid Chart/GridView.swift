//
//  GridView.swift
//  Grid Chart
//
//  Created by Ajay M on 22/07/22.
//
import UIKit

class GridView: UIView
{
    let GRID_SIZE: CGFloat = 160
    
    let GRID_COLOR = UIColor.black.cgColor
    var zoomFactor: CGFloat = 1
    
    var hLinesCount = -1
    var vLinesCount = -1
    
    var showGridLines = true
    var localGridSize: CGFloat = 160
    
    var contentSize: CGSize!
    
    private var path = UIBezierPath()
    var gridLayer: CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if(showGridLines){
            drawGrid()
        }else{
            removeGrid()
        }
    }
    
    fileprivate func calcGrid(){
        localGridSize = GRID_SIZE * zoomFactor
        hLinesCount = Int(contentSize.height / localGridSize)
        vLinesCount = Int(contentSize.width / localGridSize)
        print("Lines: H:\(hLinesCount), V:\(vLinesCount)")
        print("Gridsize: \(localGridSize)")
    }
    
    func setNewZoomValue(newScale: CGFloat) {
        zoomFactor = newScale
        removeGrid()
        drawGrid()
    }
    
    fileprivate var gridCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }

    fileprivate func drawGrid()
    {
        calcGrid()
        path = UIBezierPath()
        path.lineWidth = 5.0
        
        // Vertical lines
        for i in 0...vLinesCount{
            let xPos = CGFloat(i) * localGridSize

            path.move(to: CGPoint(x: xPos, y: 0))
            path.addLine(to: CGPoint(x: xPos, y: contentSize.height))
            path.close()
        }
        
        // Horizontal lines
        for i in 0...hLinesCount{
            let yPos = CGFloat(i) * localGridSize

            path.move(to: CGPoint(x: 0, y: yPos))
            path.addLine(to: CGPoint(x: contentSize.width, y: yPos))
        }
        
        path.close()
        
        if gridLayer != nil {
            // Remove gridLayer
            removeGrid()
        }
        // Add it as shape
        gridLayer = CAShapeLayer()
        gridLayer?.path = path.cgPath
        gridLayer?.strokeColor = GRID_COLOR
        self.layer.addSublayer(gridLayer!)

        //Above line will add this grid at the very top of this view.

        // if you want to add this grid below some layer/object you can use method
        //self.layer.insertSublayer(gridLayer, at: 0)
        //Give the index number to this method so that it can place this grid at the index
    }

    func removeGrid() {
        guard let gLayer = gridLayer else {return}
        gLayer.removeFromSuperlayer()
    }
}
