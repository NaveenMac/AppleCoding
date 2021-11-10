//
//  ItemDetailViewController.swift
//  AppleCoding
//
//  Created by Naveen Chauhan on 10/11/21.
//

import UIKit
import PDFKit
class ItemDetailViewController: UIViewController {
    var fileURL:URL?
    
    private var imageView:UIImageView?
    private var pdfView:PDFView?
    
    private var allViewsConstraints = [NSLayoutConstraint]()
    
    private enum Metrics {
        static let margin:CGFloat = 8.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = fileURL {
            let ext = url.pathExtension
            switch ext {
                case "pdf":
                    if let document = PDFDocument(url: url) {
                        pdfView = PDFView()
                        pdfView?.translatesAutoresizingMaskIntoConstraints = false
                        pdfView?.document = document
                        self.view.addSubview(pdfView!)
                    }
               
                default:
                    if let image = UIImage(contentsOfFile: url.path) {
                        imageView = UIImageView()
                        imageView?.translatesAutoresizingMaskIntoConstraints = false
                        imageView?.image = image
                        self.view.addSubview(imageView!)
                    }
            }
        }
        
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        
        addAllViewConstraints()
        
    }
    
    private func addAllViewConstraints(){
        if let url = fileURL {
            let ext = url.pathExtension
            switch ext {
                case "pdf":
                    let viewDict = ["pdfView":pdfView]
                    let viewInsets = self.view.safeAreaInsets
                    let metrics = [
                        "leftMargin":viewInsets.left > 0 ? viewInsets.left : Metrics.margin,
                        "rightMargin" : viewInsets.right > 0 ?  viewInsets.right : Metrics.margin,
                        "topMargin" : viewInsets.top > 0 ? viewInsets.top : Metrics.margin,
                        "bottomMargin": viewInsets.bottom > 0 ? viewInsets.bottom : Metrics.margin
                        
                    ]
                    let pdfViewHorizontalConstraints = NSLayoutConstraint.constraints(
                        withVisualFormat: "H:|-leftMargin-[pdfView]-rightMargin-|",
                        options: [],
                        metrics: metrics,
                        views: viewDict as [String : Any]
                    )
                    allViewsConstraints += pdfViewHorizontalConstraints
                    
                    let pdfViewVerticalConstraints = NSLayoutConstraint.constraints(
                        withVisualFormat: "V:|-topMargin-[pdfView]-bottomMargin-|", options: [], metrics: metrics, views: viewDict as [String : Any])
                    allViewsConstraints += pdfViewVerticalConstraints
                default:
                    let viewDict = ["imageView":imageView]
                    let viewInsets = self.view.safeAreaInsets
                    let metrics = [
                        "leftMargin":viewInsets.left > 0 ? viewInsets.left : Metrics.margin,
                        "rightMargin" : viewInsets.right > 0 ?  viewInsets.right : Metrics.margin,
                        "topMargin" : viewInsets.top > 0 ? viewInsets.top : Metrics.margin,
                        "bottomMargin": viewInsets.bottom > 0 ? viewInsets.bottom : Metrics.margin
                        
                    ]
                    let pdfViewHorizontalConstraints = NSLayoutConstraint.constraints(
                        withVisualFormat: "H:|-leftMargin-[imageView]-rightMargin-|",
                        options: [],
                        metrics: metrics,
                        views: viewDict as [String : Any]
                    )
                    allViewsConstraints += pdfViewHorizontalConstraints
                    
                    let pdfViewVerticalConstraints = NSLayoutConstraint.constraints(
                        withVisualFormat: "V:|-topMargin-[imageView]-bottomMargin-|", options: [], metrics: metrics, views: viewDict as [String : Any])
                    allViewsConstraints += pdfViewVerticalConstraints
            }
        }
        
        NSLayoutConstraint.activate(allViewsConstraints)
    }
}
