//
//  ContentView.swift
//  flitto_ios
//
//  Created by minkpang on 2022/01/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    @State var showLike = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    if vm.images.count != 0 {
                        TabView() {
                            ForEach(0 ..< vm.images.count, id: \.self) { i in
                                let url = URL(string: vm.images[i].download_url)
                                ZStack{
                                    CacheAsyncImage(url: url!, scale: 2.0){ phase in
                                        switch phase{
                                        case .success(let image):
                                            image
                                                .resizable()
                                        case .failure(_):
                                            ProgressView()
                                        case .empty:
                                            ProgressView()
                                        @unknown default:
                                            ProgressView()
                                        }
                                        
                                    }
                                    .scaleEffect()
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                                    .onTapGesture(count: 2) {
                                        withAnimation{
                                            showLike.toggle()
                                        }
                                        
                                        DispatchQueue.main
                                            .asyncAfter(deadline: .now()+1) {
                                                withAnimation{
                                                    showLike.toggle()
                                                }
                                            }
                                    }
                                    
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.white)
                                        .frame(width: 100, height: 100)
                                        .opacity(showLike ? 1 : 0)
                                        .animation(Animation.linear(duration: 0.5))
                                    
                                    VStack(alignment: .leading, spacing: 20){
                                        Text(vm.images[i].author)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.largeTitle)
                                        Text("No. \(vm.images[i].id)")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(.headline)
                                    }
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 10)
                        .tabViewStyle(PageTabViewStyle())
                        .ignoresSafeArea()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
