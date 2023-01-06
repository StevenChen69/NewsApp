//
//  ChangeView.swift
//  News
//
//  Created by steven on 2023/1/6.
//
//

import SwiftUI

struct ChangeView: View {
    var body: some View {
            TabView {
                SelectNewsView()
                    .tabItem {
                        Image(systemName: "tv")
                        Text("NEWS")
                }
                RAndMView()
                    .tabItem {
                        Image(systemName: "flame")
                        Text("RICK & MORTY")
                }
                UnsplashView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("DAILY PLAN")
                }

            }
        }
    }

struct ChangeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeView()
    }
}
