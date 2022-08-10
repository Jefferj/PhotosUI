//
//  QRView.swift
//  PhotosUI
//
//  Created by Apple on 3/06/22.
//

import SwiftUI
import CodeScanner
struct QRView: View {
    
    @State private var showScanner = false
    @State private var qrtext = "Escanear qr"
    
    func scan(result: Result<ScanResult, ScanError>){
        showScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "")
            qrtext = details[0]
        case .failure(let error):
            print("Fallo el escaneo", error.localizedDescription)
        }
    }
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Button {
                    showScanner = true
                } label: {
                    Text("Escanear")
                }.sheet(isPresented: $showScanner) {
                    CodeScannerView(codeTypes: [.qr], completion: scan)
                }
                Text(qrtext)

            }.navigationTitle("Escanear QR")
        }
    }
}

