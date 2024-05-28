//
//  File.swift
//  
//
//  Created by Enrico Maricar on 28/05/24.
//

import Foundation
import SwiftUI
import Core

struct HomeListView: View {
    @State var name: String
    @State var date: String
    @State var image: String
    @State var rating: Double
    @State var maxRating: Int
    
    var body: some View {
        HStack() {
            CacheAsyncImage(url: URL(string: image)!) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)
                        .clipped()
                case .empty:
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(16)
                default:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(16)
                        .foregroundColor(.gray)
                }
            }
            VStack(alignment: .leading) {
                Text(name).font(.headline).foregroundColor(.white).lineLimit(1)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text(date).font(.subheadline).foregroundColor(Color.orange)
                    Spacer()
                    Text("\(String(format: "%.2f", rating)) / \(maxRating)").font(.subheadline).foregroundColor(Color.yellow).padding(.top, 8)
                }.padding(.top, 8)
                
            }.padding(8)
            
            Spacer()
        }.frame(maxWidth: .infinity).background(Color.gray.opacity(0.5)).cornerRadius(16).padding(4)
    }
}
