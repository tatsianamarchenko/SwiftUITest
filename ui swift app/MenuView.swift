//
//  MenuView.swift
//  ui swift app
//
//  Created by Tatsiana Marchanka on 10.01.22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
      VStack {
        Spacer()
        VStack(spacing: 16) {
          Text("обучение завершено на 10%")
            .font(.caption)
          Color.white
            .frame(width: 30, height: 5, alignment: .center)
            .cornerRadius(3)
            .frame(width: 130, height: 5, alignment: .leading)
            .background(Color.black.opacity(0.09))
            .cornerRadius(3)
            .frame(width: 150, height: 24, alignment: .center)
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
          MenuRow(title: "личный кабинет", icon: "gear")
          MenuRow(title: "счет", icon: "creditcard")
          MenuRow(title: "выход", icon: "person.crop.circle")
        }
          .frame(maxWidth: .infinity)
          .frame(height: 300)
          .background(LinearGradient(gradient: Gradient(colors: [.mint,.blue]), startPoint: .bottomLeading, endPoint: .top))
          .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 30)
        .padding(.horizontal)
      }.padding(.bottom, 30)
        .overlay(Image("avatar")
                  .resizable()
                  .aspectRatio( contentMode: .fit)
                  .frame(width: 70,height: 60)
                  .clipShape(Circle())
                  .offset(y: 60))


    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
  var title : String
  var icon : String
  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: icon)
        .font(.system(size: 20, weight: .light, design: .default))
        .imageScale(.large)
        .frame(width: 32, height: 32)

      Text(title)
        .font(.system(size: 20, weight: .bold, design: .rounded))
        .frame(width: 120, alignment: .leading)
    }
  }
}
