//
//  Scanner.swift
//  PhotosUI
//
//  Created by Apple on 3/06/22.
//

import Foundation
import SwiftUI
import VisionKit

struct Scanner : UIViewControllerRepresentable {
    typealias UIViewControllerType = VNDocumentCameraViewController
    
    let completionHandler : ([String]?) -> Void
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(completion: completionHandler)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    
    init(completion: @escaping ([String]?) -> Void){
        completionHandler = completion
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let completionHandler : ([String]?) -> Void
        
        init(completion: @escaping ([String]?) -> Void){
            completionHandler = completion
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizerText(competionHandler: completionHandler)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completionHandler(nil)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            completionHandler(nil)
        }
        
    }
    
    
    
}

