//
//  homeView.swift
//  ui swift app
//
//  Created by Tatsiana Marchanka on 11.01.22.
//

import SwiftUI

struct homeView: View {
  @State var showProfile = false
  @State var viewState = CGSize.zero
  @State var showContent = false
    var body: some View {
      ZStack {
        Color.gray.opacity(0.3)
          .edgesIgnoringSafeArea(.all)


        homeMain(showProfile: $showProfile, showContent: $showContent)
          .background(Color.white)
          .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
          .shadow(radius: 30)
          .offset(y: showProfile ? -450 : 0)
          .rotation3DEffect(.degrees(showProfile ? viewState.height/10 : 0), axis: (x: 10, y: 0, z: 0))
          .scaleEffect(showProfile ? 0.9 : 1)
          .animation(.easeInOut)
          .edgesIgnoringSafeArea(.all)



        MenuView()
          .background(Color.black.opacity(0.001))
          .offset(y: showProfile ? 0 : screen.height)
          .offset(y: viewState.height)
          .animation(.easeInOut)
          .onTapGesture {
            showProfile.toggle()
          }
          .gesture(DragGesture().onChanged({ value in
            self.viewState = value.translation
            self.showProfile = true
            if self.viewState.height > 50 {
              self.showProfile = false
            }
          })
                    .onEnded({ value in
            self.viewState = .zero
          })
          )

        if showContent {
          Color.white
            .edgesIgnoringSafeArea(.all)
          ContentView()

          VStack {
            HStack {
              Spacer()
              Image(systemName: "xmark")
                .frame(width: 36, height: 36)
                .foregroundColor(.white)
                .background(Color.black)
                .clipShape(Circle())

            }
           Spacer()
          }
          .offset(x: -16, y: 16)
          .transition(.move(edge: .top))
          .animation(.easeInOut)
          .onTapGesture {
            self.showContent = false
          }
        }
      }
    }
}


let screen = UIScreen.main.bounds

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}

struct ImageButton: View {
  @Binding var showProfile : Bool
  var body: some View {
    HStack {
      Button {
        self.showProfile.toggle()
      } label: {
        Image("avatar")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 100, height: 80, alignment: .leading)
          .clipShape(Circle())
      }
      Spacer()
    }.padding(.horizontal)
      .padding(.top, 30)
  }
}
