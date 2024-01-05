//
//  Home.swift
//  AnimatedStickyHeader
//
//  Created by Naman Vaishnav on 05/01/24.
//

import SwiftUI

struct Home: View {
    var safeArea: EdgeInsets
    var size: CGSize
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                ArtWork()
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                    
                    Button(action: {
                        
                    }, label: {
                        Text("SHIFFLE PLAY")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 45)
                            .padding(.vertical, 12)
                            .background{
                                Capsule().fill(Color.white.gradient)
                            }
                        }
                        
                        
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(y: minY < 50 ? -(minY - 50) : 0)
                    
                    
                }
                .frame(height: 50)
                .padding(.top, -34)
                .zIndex(1.0)
                
                VStack {
                    Text("Pupular")
                        .fontWeight(.heavy)
                    AlbumView()
                }
                .padding(.top, 10)
                .zIndex(1)
                HeaderView()
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func ArtWork()-> some View {
        let height = size.height * 0.45
        
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            Image("IMG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay {
                    ZStack (alignment: .bottom, content: {
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    .black.opacity(0 - progress),
                                    .black.opacity(0.1 - progress),
                                    .black.opacity(0.3 - progress),
                                    .black.opacity(0.5 - progress),
                                    .black.opacity(0.8 - progress),
                                    .black.opacity(1)
                                ], startPoint: .top, endPoint: .bottom)
                            )
                        VStack(spacing: 0) {
                            Text("Forest\n Sounds")
                                .font(.system(size:45))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("509, 082 Monthly Listeners".uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                                .padding(.top, 15)
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress ))
                        .padding(.bottom, 55)
                        .offset(y: minY < 0 ? minY : 0)
                    })
                    
                }
                .offset(y: -minY)
                
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    func AlbumView()-> some View {
        VStack(spacing: 25) {
            ForEach(albums.indices, id: \.self) { index in
                HStack {
                    Text("\(index + 1)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    
                    
                    VStack (alignment: .leading, spacing: 6) {
                        Text(albums[index].albumName)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Text("2,283,929")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.gray)
                }
                
            }
        }
        .padding(15)
    }
    
    @ViewBuilder
    
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress = minY/height
            
            HStack(spacing: 15) {
                Button(action: {}, label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundStyle(.white)
                    
                })
                Spacer(minLength: 0)
                Button(action: {}, label: {
                    Text("FOLLOWING")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .border(.white, width: 1.5)
                    
                })
                .opacity(1 + progress)
                
                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundColor(.white)
                })
            }
            .overlay(content: {
                Text("Forest Sounds")
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
                    .clipped()
                    .animation(.easeOut(duration: 0.25), value: -titleProgress > 0.75)
            })
            
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)
            .background{
                Color.black
                    .opacity(-progress > 1 ?  1 : 0)
            }
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
    
}

//#Preview {
//    Home(safeArea: <#T##EdgeInsets#>, size: <#T##CGSize#>)
//}
