//
//  ContentView.swift
//  GridWithTabView
//
//  Created by haeryu on 2022/06/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var index = 0

    var body: some View {
        
        VStack {
            //Title
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            //TabButton
            HStack(spacing: 0) {
                //Day
                Text("Day")
                    .foregroundColor(index == 0 ? .white : .black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.black.opacity(index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        index = 0
                    }
                Spacer(minLength: 0)
                //Week
                HStack(spacing: 0) {
                    Text("Week")
                        .foregroundColor(index == 1 ? .white : .black.opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(.black.opacity(index == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = 1
                        }
                }
                Spacer(minLength: 0)
                //Month
                HStack(spacing: 0) {
                    Text("Month")
                        .foregroundColor(index == 2 ? .white : .black.opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(.black.opacity(index == 2 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            index = 2
                        }
                }
            }//TabButton
            .background(.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.top, 25)

            
            TabView(selection: $index) {
                GridView(fit_Data: day_Fit_Data)
                    .tag(0)
                GridView(fit_Data: week_Fit_Data)
                    .tag(1)
                GridView(fit_Data: month_Fit_Data)
                    .tag(2)
            }
            //TabView??? selection??? animation??? ????????????, index??? ????????? ?????? ????????? ????????? ????????????.
            //????????? ?????? ?????? TabButton??? ?????????, day-week-month??? ???????????? index??? ?????? ?????????????????? ?????????.
            .animation(.easeInOut, value: index)
            //????????? ???????????? ?????? ??????
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
            
        }
        .padding(.top)
    }
}
