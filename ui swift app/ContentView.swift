//
//  ContentView.swift
//  ui swift app
//
//  Created by Tatsiana Marchanka on 10.01.22.
//

import SwiftUI

struct ContentView: View {
  @State var show = false
  @State var viewState = CGSize.zero
  @State var showCard = false
  var body: some View {
    ZStack {
      TitleView()
        .blur(radius: show ? 20 : 0)
        .opacity(showCard ? 0.4 : 1)
        .offset(y: showCard ? -200 : 0)
        .animation(.default)
      BackCardView()
        .background(Color(hue: 0.623, saturation: 0.636, brightness: 0.94))
        .cornerRadius(20)
        .offset(x: 0, y: show ? -200 : -40)
        .offset(x: viewState.width, y: viewState.height)
        .scaleEffect(0.9)
        .rotationEffect(.degrees(show ? 0 : 10))
        .rotation3DEffect(.degrees(10), axis: (x: 0, y: 0, z: 0))
          .blendMode(.hardLight)
          .shadow(radius: 10)
          .animation(.easeInOut)
        BackCardView()
          .background(Color(hue: 0.749, saturation: 0.621, brightness: 0.978))
          .cornerRadius(20)
          .offset(x: 0, y: show ? -120 : -20)
          .offset(x: viewState.width, y: viewState.height)
          .scaleEffect(0.95)
          .rotationEffect(.degrees(show ? 0 : 5))
          .rotation3DEffect(.degrees(5), axis: (x: 0, y: 0, z: 0))
          .blendMode(.hardLight)
          .shadow(radius: 10)
          .animation(.easeInOut)
        CardView()
        .offset(x: viewState.width, y: viewState.height)
        .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
          self.showCard.toggle()
        }
        .gesture(DragGesture().onChanged({ value in
          self.viewState = value.translation
          self.show = true
        })
                  .onEnded({ value in
          self.viewState = .zero
          self.show = false
        })
        )

      BottomView(show: $showCard)
        .offset(x: 0, y: showCard ? 0 : 1000)
        .blur(radius: show ? 20 : 0)
        .animation(.easeInOut)

      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text("Дизайн в SwiftUI")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
          Text("Сертификат") .foregroundColor(.mint)
        }
        Spacer()
        Image("Logo SwiftUI")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50)
      }
      .padding(.horizontal, 20)
      .padding(.top, 30)

      Image("2")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 300, height: 110, alignment: .top)
    }
    .frame(width: 340, height: 220)
    .background(Color.pink)
    .cornerRadius(20)
    .shadow(radius: 20)
    .blendMode(.hardLight)
  }
}

struct BackCardView: View {
  var body: some View {
    VStack {
      Spacer()
    }.frame(width: 340, height: 220)
  }
}

struct TitleView: View {
  var body: some View {
    VStack {
      HStack {
        Text("сертификаты")
          .font(.largeTitle)
          .fontWeight(.bold)
        Spacer()
      }
      .padding()
      Spacer()
    }
  }
}

struct BottomView: View {
  @Binding var show : Bool
  var body: some View {
    VStack(spacing: 20) {
      Rectangle()
        .frame(width: 40, height: 5)
        .cornerRadius(3)
        .opacity(0.1)
      Text("Изучение особенностей разработки адаптивного дизаина в Swift UI")
        .multilineTextAlignment(.center)
        .font(.subheadline)
        .lineSpacing(4)
      HStack {
      RingView(percentage: 30, color1: Color.blue, color2: Color.purple, width: 80, height: 80, show: $show)
          .padding(.horizontal)
        .animation(.easeInOut)

              VStack {
                Text("дизайн в swift UI")
                  .bold()
                Text("10 из 30 уроков завершено")
                  .font(.footnote)
                  .foregroundColor(.gray)

              }.padding(.horizontal, 30)
          .background(Color.white)
          .cornerRadius(10)
          .shadow(radius: 30)

      }

      Spacer()
    }
    .padding(.top, 8)
    .padding(.horizontal, 20)
    .frame(maxWidth: .infinity)
    .background(Color(hue: 0.57, saturation: 0.085, brightness: 0.97))
    .cornerRadius(30)
    .shadow(radius: 30)
    .offset(x: 0, y: 500)
  }
}
