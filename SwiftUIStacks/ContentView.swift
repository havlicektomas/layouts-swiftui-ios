//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Tomas Havlicek on 30.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //LayoutOne()
        LayoutTwo()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LayoutOne: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack(spacing: 15) {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    PriceLabelView(label: "Best for designers")
                }
            }
            .padding(.horizontal)
            
            ZStack {
                PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
                    .padding()
                PriceLabelView(label: "Perfect for teams with 20 members")
            }
            
            Spacer()
        }
    }
}

struct LayoutTwo: View {
    var body: some View {
        VStack {
            HeaderView()
            
            ZStack {
                VStack {
                    Spacer()
                    PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple, icon: "wand.and.rays")
                        .padding(.horizontal)
                }
                
                VStack {
                    PricingView(title: "Pro", price: "$19", textColor: .white, bgColor: Color(red: 255/255, green: 183/255, blue: 37/255), icon: "wand.and.rays")
                        .padding(.horizontal, 25)
                        //.scaleEffect(0.9)
                }
                
                VStack {
                    PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255), icon: "wand.and.rays")
                        .padding(.horizontal, 35)
                        //.scaleEffect(0.95)
                    Spacer()
                }
            }
            .frame(width: .infinity, height: 480)
            
            Spacer()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack() {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 140)
        .padding(.vertical)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct PriceLabelView: View {
    
    var label: String
    
    var body: some View {
        Text(label)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
            .offset(x: 0, y: 85)
    }
}
