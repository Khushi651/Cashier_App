//
//  UIView+Add.swift
//  ConfigureApp
//
//  Created by MAC on 01/10/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    //MARK:- IBINSPECTABLE
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var shadowColor:  UIColor? {
        set {
            layer.masksToBounds =  false
            layer.shadowColor = newValue?.cgColor
            layer.shadowRadius = 2
            layer.shadowOffset = CGSize.zero//CGSize(width: 2, height: 2)
            layer.shadowOpacity = 0.8
        }
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    //MARK:- Properties
    var width:      CGFloat { return self.frame.size.width }
    var height:     CGFloat { return self.frame.size.height }
    var size:       CGSize  { return self.frame.size}
    
    var origin:     CGPoint { return self.frame.origin }
    var x:          CGFloat { return self.frame.origin.x }
    var y:          CGFloat { return self.frame.origin.y }
    var centerX:    CGFloat { return self.center.x }
    var centerY:    CGFloat { return self.center.y }
    
    var left:       CGFloat { return self.frame.origin.x }
    var right:      CGFloat { return self.frame.origin.x + self.frame.size.width }
    var top:        CGFloat { return self.frame.origin.y }
    var bottom:     CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    //MARK:- Set properties methods
    func setWidth(_ width:CGFloat) {
        self.frame.size.width = width
    }
    
    func setHeight(_ height:CGFloat) {
        self.frame.size.height = height
    }
    
    func setSize(_ size:CGSize) {
        self.frame.size = size
    }
    
    func setOrigin(_ point:CGPoint) {
        self.frame.origin = point
    }
    
    func setX(_ x:CGFloat) {
        //only change the origin x
        self.frame.origin = CGPoint(x: x, y: self.frame.origin.y)
    }
    
    func setY(_ y:CGFloat) {
        //only change the origin x
        self.frame.origin = CGPoint(x: self.frame.origin.x, y: y)
    }
    
    func setCenterX(_ x:CGFloat) {
        //only change the origin x
        self.center = CGPoint(x: x, y: self.center.y)
    }
    
    func setCenterY(_ y:CGFloat) {
        //only change the origin x
        self.center = CGPoint(x: self.center.x, y: y)
    }
    
    
    func setTop(_ top:CGFloat) {
        self.frame.origin.y = top
    }
    
    func setLeft(_ left:CGFloat) {
        self.frame.origin.x = left
    }
    
    func setRight(_ right:CGFloat) {
        self.frame.origin.x = right - self.frame.size.width
    }
    
    func setBottom(_ bottom:CGFloat) {
        self.frame.origin.y = bottom - self.frame.size.height
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func setBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        layer.addBorder(edge: edge, color: color, thickness: thickness)
    }
    
    //MARK:- Load nib methods
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(self)
    }
    
    //MARK:- MAKE BLUR VIEW
    func makeBlurView(_ view: UIView, effectStyle: UIBlurEffect.Style) {
        
        let blurEffect = UIBlurEffect(style: effectStyle) //UIBlurEffectStyle.Light
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        view.addSubview(blurEffectView)
    }
    
    //MARK:- SCREEN SHOT METHODS
    func getSnapshot(_ view: UIView) -> UIImage {
        
        var captureImage: UIImage
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, UIScreen.main.scale)
        
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        
        captureImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return captureImage
    }
    
    func getSnapshot() -> UIImage {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func screenshot() -> UIImage {
        return UIGraphicsImageRenderer(size: bounds.size).image { _ in
            drawHierarchy(in: CGRect(origin: .zero, size: bounds.size), afterScreenUpdates: true)
        }
    }
    
    func getSnapshotWithSize(_ size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        //Originaly ------self.bounds
        //For viewcontroller ------- Only
        var rect:CGRect = self.bounds
        rect.origin.y = -64
        drawHierarchy(in: rect, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}

public extension UIView {
    
    func setGradient(colours: [UIColor]) -> Void {
        self.setGradient(colours: colours, locations: nil)
    }
    
    func setGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func linearGradient(with color1:UIColor, color2:UIColor, vertical:Bool = false, firstColorRatio:Double = 0.5) {
        
        let gradientLayer       = CAGradientLayer()
        gradientLayer.frame     = self.bounds
        gradientLayer.colors    = [color1.cgColor, color1.cgColor]
        
        if vertical {
            gradientLayer.startPoint = CGPoint(x:0.5, y:0.0)
            gradientLayer.endPoint  = CGPoint(x:0.5, y:1.0)
        }else {
            gradientLayer.startPoint = CGPoint(x:0.0, y:0.5)
            gradientLayer.endPoint = CGPoint(x:1.0, y:0.5)
        }
        let value:Double  = 1.0 - firstColorRatio
        gradientLayer.locations = [1, 0]
        gradientLayer.locations = [0.0, NSNumber(floatLiteral: value)]
        self.layer.addSublayer(gradientLayer)
        
    }
    
    func addGradient(with layer: CAGradientLayer, gradientFrame: CGRect? = nil, colorSet: [UIColor],
                     locations: [Double], startEndPoints: (CGPoint, CGPoint)? = nil) {
        layer.frame = gradientFrame ?? self.bounds
        layer.frame.origin = .zero
        
        let layerColorSet = colorSet.map { $0.cgColor }
        let layerLocations = locations.map { $0 as NSNumber }
        
        layer.colors = layerColorSet
        layer.locations = layerLocations
        
        if let startEndPoints = startEndPoints {
            layer.startPoint = startEndPoints.0
            layer.endPoint = startEndPoints.1
        }
        
        self.layer.insertSublayer(layer, above: self.layer)
    }
}

public extension UIView{
    func addDashedBorder(cgColor: CGColor) {
        let dashedBorder = CAShapeLayer()
        dashedBorder.strokeColor = cgColor
        dashedBorder.lineDashPattern = [2, 2]
        dashedBorder.frame = self.bounds
        dashedBorder.fillColor = nil
        dashedBorder.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(dashedBorder)
    }
    func addRoundedDashedBorder(cgColor: CGColor,cornerRadius: CGFloat) {
        let dashedBorder = CAShapeLayer()
        dashedBorder.strokeColor = cgColor
        dashedBorder.lineDashPattern = [4,4]
        dashedBorder.lineWidth = 1.5
        dashedBorder.frame = self.bounds
        dashedBorder.fillColor = nil
        dashedBorder.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(dashedBorder)
    }
}
