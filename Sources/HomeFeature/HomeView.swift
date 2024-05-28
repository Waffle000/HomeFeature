// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Foundation
import DetailFeature
import Core
import FavoriteFeature
import ProfileFeature

public struct HomeView : View {
        
    @StateObject private var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        
        NavigationStack {
            ZStack(alignment: .topLeading){
                Color(Color.black).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    HStack {
                        Text("Rawg Game").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.semibold).foregroundColor(.white)
                        Spacer()
                        NavigationLink(
                            destination: FavoriteView(),
                            label: {
                                Image(systemName: "heart").resizable().frame(width: 24, height: 24).padding(.trailing, 8).foregroundColor(.white)
                            })
                        NavigationLink(
                            destination: ProfileView(),
                            label: {
                                Image(systemName: "person").resizable().frame(width: 24, height: 24).padding(.trailing, 8).foregroundColor(.white)
                            })
                       
                    }
                    if (viewModel.isLoading) {
                        ZStack(alignment:.center) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.5)
                        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    } else {
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.gamesResult, id: \.id) { user in
                                    NavigationLink(destination: DetailView(parameter: ConnectionStatus.online, id: user.id, name: user.name ?? "Game")) {
                                        HomeListView(name: user.name ?? "Game", date: user.released ?? "0000-00-00", image: user.background_image ?? "", rating: user.rating ?? 0.0, maxRating: user.ratingTop ?? 5)
                                    }
                                }
                            }
                        }
                    }
                    
                }.padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.onAppear{
            let _ = print("Testing2")
            viewModel.loadGames()
        }
        
    }
}
//
//#Preview {
//    HomeView()
//}
