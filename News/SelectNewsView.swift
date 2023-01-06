//
//  SelectNewsView.swift
//  News
//
//  Created by steven on 2023/1/6.
//
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit
import SafariServices

struct SelectNewsView: View {
    
    @State private var rotateDegree: Double = 0
    @State private var moveDistance: Double = 0
    @State private var opacity: Double = 0
    @State var showTWSafari = false
    @State var TWNewsUrlString = "https://www.youtube.com/watch?v=AVONqDufr30"
    @State var showUSSafari = false
    @State var USNewsUrlString = "https://www.youtube.com/watch?v=w_Ma8oQLmSM"
    
    var body: some View {
        
      NavigationView {
        ZStack{
          Text("Welcome Back")
            .font(.system(size:40))
            .fontWeight(.heavy)
            .padding([.top, .trailing], 120.0)
            .frame(width: 800, height: 1100, alignment: .top )
            .foregroundColor(.white)
            .background( LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom))
            //.offset(x: -60, y: -300)
          
          VStack(alignment: .center) {

            Button(action: {
              self.rotateDegree = 360
            }){
              Image("Newslogo")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
                .rotationEffect(.degrees(rotateDegree))
                .animation(
                  Animation.easeOut(duration: 2)
                    .repeatCount(1, autoreverses: false)
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            Text("News")
              .font(.system(size:70))
              .fontWeight(.heavy)
              .frame(width: 200, height: 100, alignment: .center )
              .offset(x: 0, y: -100)
            
            HStack{
              NavigationLink(destination: ContentView()) {
                Text("國內新聞")
                  .font(.title)
                  .fontWeight(.semibold)
                  .frame(width: 170, height: 90, alignment: .center)
                  .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom))
                  .foregroundColor(.white)
                  .cornerRadius(8.0)
              }
              
              
             Spacer()
              
              NavigationLink(destination: USANewsView()) {
                Text("國際新聞")
                  .font(.title)
                  .fontWeight(.semibold)
                  .frame(width: 170, height: 90, alignment: .center)
                  .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom))
                  .foregroundColor(.white)
                  .cornerRadius(8.0)
              }
            }
            
            padding()
            
            HStack{
              Button(action: {
                self.TWNewsUrlString = "https://www.youtube.com/watch?v=AVONqDufr30"
                self.showTWSafari = true
              }){
                Text("News直播")
                  .font(.title)
                  .fontWeight(.semibold)
                  .frame(width: 170, height: 90, alignment: .center)
                  .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom))
                  .foregroundColor(.white)
                  .cornerRadius(8.0)

              }.sheet(isPresented: $showTWSafari) {
                TWSafariView(TWurl:URL(string: self.TWNewsUrlString)!)
              }
              
              Spacer()
              
              
              Button(action: {
                self.USNewsUrlString = "https://www.youtube.com/watch?v=w_Ma8oQLmSM"
                self.showUSSafari = true
              }){
                Text("ABC News LIVE")
                  .font(.system(size:20))
                  .fontWeight(.semibold)
                  .frame(width: 170, height: 90, alignment: .center)
                  .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom))
                  .foregroundColor(.white)
                  .cornerRadius(8.0)
                
              }.sheet(isPresented: $showUSSafari) {
                USSafariView(USurl:URL(string: self.USNewsUrlString)!)
              }

              
            }
            
          }
          .frame(width: 350, height: 200)

        }
        
      }

    }
}

struct SelectNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectNewsView()
    }
}


struct TWSafariView: UIViewControllerRepresentable {

    let TWurl: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<TWSafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: TWurl)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<TWSafariView>) {

    }

}

struct USSafariView: UIViewControllerRepresentable {

    let USurl: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<USSafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: USurl)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<USSafariView>) {

    }

}

