//
//  homeMain.swift
//  ui swift app
//
//  Created by Tatsiana Marchanka on 11.01.22.
//

import SwiftUI

struct homeMain: View {
  @Binding var showProfile : Bool
  @Binding var showContent : Bool
  var body: some View {
    ScrollView(.vertical) {
    VStack {
      HStack {
        ImageButton(showProfile: $showProfile)
        Spacer()
      }
      .padding(.horizontal)
      .padding(.leading, 100)
      .padding(.top, 30)
      ScrollView(.horizontal, showsIndicators: false) {
      ViewOfRings()
          .padding(.vertical, 60)
          .onTapGesture {
            self.showContent = true
          }
      }
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 30) {
          ForEach(sectiondata) { item in
            GeometryReader { geometryView in
            SectionView(section: item)
                .rotation3DEffect(Angle(degrees: Double(geometryView.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
            }
            .frame(width: 275, height: 275)
          }
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
      }

      HStack{
    Text("курсы")
        .font(.title)
        .bold()
      }.padding(.leading)
      SectionView(width: screen.width - 60, height: 275, section: sectiondata[1])
      Spacer()
    }
    }
    }

}

struct homeMain_Previews: PreviewProvider {
    static var previews: some View {
      homeMain(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
  var width :CGFloat = 275
  var height : CGFloat = 275
  var section : Section
  var body: some View {
    VStack {
      HStack(alignment: .top) {
        Text(section.name)
          .font(.system(size: 30, weight: .bold))
          .frame(width: 160, alignment: .leading)
          .foregroundColor(.white)
        Spacer()
        Image(section.logo)
      }
      Text(section.text.uppercased())
        .frame(maxWidth: .infinity, alignment: .leading)
      section.image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 210)
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .frame(width: width, height: height)
    .background(section.color)
    .cornerRadius(30)
    .shadow(radius: 10)
  }
}

struct Section : Identifiable{
  var id = UUID()
  var name : String
  var text : String
  var logo : String
  var image : Image
  var color : Color
}

let sectiondata = [Section(name: "дизайн в swift UI", text: "50 уроков", logo: "Logo SwiftUI", image: Image("1"), color: Color.purple), Section(name: "основы в swift", text: "30 уроков", logo: "Logo SwiftUI", image:  Image("2"), color: Color.pink), Section(name: "решение задач на языке swift", text: "100 уроков", logo: "Logo SwiftUI", image: Image("2"), color: Color.blue)]

struct ViewOfRings: View {
  var body: some View {
    HStack {
      HStack {
        RingView(percentage: 80, color1: Color.mint, color2: Color.orange, width: 80, height: 80, show: .constant(true))
          .padding(.all, 10)
        VStack {
          Text("осталось 10 минут")
            .bold()
            .padding(.trailing, 10)
            .font(.subheadline)
          Text("отсмотрено: 10 минут")
            .font(.footnote)
            .padding(.trailing, 10)
        }
      }

      .padding(8)
      .background(Color.white)
      .cornerRadius(30)
      .shadow(radius: 30)
      .padding(.all, 3)

      HStack {
        RingView(percentage: 30, color1: Color.pink, color2: Color.purple, width: 40, height: 40, show: .constant(true))
          .padding(.all, 10)
      }
      .padding(8)
      .background(Color.white)
      .cornerRadius(100)
      .shadow(radius: 30)

      HStack {
        RingView(percentage: 90, color1: Color.pink, color2: Color.accentColor, width: 40, height: 40, show: .constant(true))
          .padding(.all, 10)
      }
      .padding(8)
      .background(Color.white)
      .cornerRadius(100)
      .shadow(radius: 30)

    }.padding(.horizontal)
  }
}
