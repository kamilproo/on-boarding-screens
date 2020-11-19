//
//  ContentView.swift
//  OnBoarding
//
//  Created by Камиль Зиязетдинов on 15.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State var slideGes = CGSize.zero
    @State var slideOne = false
    @State var slideOnePre = false
    @State var slideTwo = false
    @State var slideTwoPre = false
    @AppStorage("status") var status = false
    @AppStorage("statusHome") var statusHome = false
    var body: some View {
        HStack {
            Circle().frame(width: 10, height: 10)
                .foregroundColor(.gray)
            Circle().frame(width: 10, height: 10)
                .foregroundColor(.gray)
            Circle().frame(width: 10, height: 10)
                .foregroundColor(.gray)
                
        }.padding(.top, 50)
        ZStack {
            ViewThree()
                .offset(x: slideGes.width)
                .offset(x: slideTwo ? 0 : 500)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.slideGes = value.translation
                    }.onEnded { value in
                        if self.slideGes.width > 150 {
                            self.slideTwo = false
                            self.slideTwoPre = true
                          
                        }
                        self.slideGes = .zero
                    }
                
                )
            ViewTwo()
                .offset(x: slideGes.width)
                .offset(x: slideOne ? 0 : 500)
                .offset(x: slideOnePre ? 500 : 0)
                .offset(x: slideTwo ? -500: 0)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.slideGes = value.translation
                    }
                    .onEnded { value in
                        if self.slideGes.width < -150 {
                            self.slideOne = true
                            self.slideTwo = true
                           
                        }
                        if self.slideGes.width > 150 {
                            self.slideOnePre = true
                            self.slideOne = false
                      
                        }
                        self.slideGes = .zero
                    }
                
                )
            ViewOne()
                .offset(x: slideGes.width)
                .offset(x: slideOne ? -500 : 0)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.slideGes = value.translation
                    }
                    .onEnded { value in
                        if self.slideGes.width < -150 {
                            self.slideOne = true
                            self.slideOnePre = false
                         
                        }
                        self.slideGes = .zero
                    }
                
                )
           
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}




struct ViewOne: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("------>>>>> slide to next")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}

struct ViewTwo: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("------>>>>> slide to next")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}

struct ViewThree: View {
    @AppStorage("status") var status = false
    @State var select = false
    var body: some View {
        NavigationView {
            VStack {
            Image("p1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            NavigationLink(
                destination: Login(), isActive: $select){
                Text("").hidden()
                }
               
                ZStack {
            Button(action: {
                select.toggle()
                status = true
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 50, alignment: .center)
                        .foregroundColor(.blue)
                        .cornerRadius(18)
                Text("Skip")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
            }
                }.padding(.bottom, 80)
    
}
}
}
}
struct Login: View {
    var body: some View {
        Text("Home")
    }
}
