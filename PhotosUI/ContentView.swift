//
//  ContentView.swift
//  PhotosUI
//
//  Created by Apple on 2/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ScannerView().tabItem{
                Label("Scan Text", systemImage: "doc.text.viewfinder")
            }
            QRView().tabItem{
                Label("QR Code", systemImage: "qrcode.viewfinder")
            }
        }
    }
}
