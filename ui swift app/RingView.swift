//
//  RingView.swift
//  ui swift app
//
//  Created by Tatsiana Marchanka on 11.01.22.
//

import SwiftUI

struct RingView: View {
  var percentage = 80
  var color1 = Color.pink
  var color2 = Color.purple
var width = CGFloat(80)
  var height = CGFloat(80)
  @Binding var show : Bool

  var body: some View {
    let multiplier = width / 44
    let progress : Double = Double((100 - percentage)) * 0.01
    return ZStack {
Circle()
        .stroke(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.1), .black.opacity(0.3)]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 8 * multiplier, lineJoin: .round))
        .frame(width: width, height: height, alignment: .center)

    Circle()
        .trim(from: show ? progress : 1, to: 1)
      .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 8 * multiplier, lineJoin: .round))
      .rotationEffect(Angle(degrees: 90))
      .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
      .frame(width: width, height: height, alignment: .center)
      .shadow(color: Color.purple.opacity(0.9), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
      Text("\(percentage)%")
        .font(.system(size: 10 * multiplier))
        .fontWeight(.bold)
  }
  }
}

struct RingView_Previews: PreviewProvider {
  static var previews: some View {
    RingView(show: .constant(true))
  }
}
