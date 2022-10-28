//
//  ContentView.swift
//  cw6
//
//  Created by Aisha AlQabandi on 28/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var height = ""
    @State var weight = ""
    
    @State var bmi = ""
    @State var status = ""
    
    var body: some View {
        VStack {
            Image("bmicalc")
                .resizable()
                .scaledToFit()
            Text("Enter your height and weight")
                .font(.title)
            
            TextField("Enter your height", text: $height)
            TextField("Enter your weight", text: $weight)
            
            Button (action: {
                BMICalculator(height: Double(height) ?? 1.0, weight: Double(weight) ?? 1.0)
            }, label: {
                Text("calculate")
                    .font(.title)
                    .foregroundColor(.white)
            })
            .frame(width: 350, height: 80)
            .background(Color.blue)
            .cornerRadius(15)
            .padding()
            
            
            Text("BMI = \(bmi)")
            Text("Status is \(status)")

        }
        .padding()
    }
    
    func BMICalculator(height: Double, weight: Double){
        var total = weight / height * height
        
        if total <= 20{
            status = "thin"
        } else if total <= 25{
            status = "good"
        } else{
            status = "overweight"
        }
        bmi = "\(total)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
