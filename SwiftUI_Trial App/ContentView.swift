//
//  ContentView.swift
//  SwiftUI_Trial App
//
//  Created by 髙津悠樹 on 2023/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var result = ""
    @State private var currentOperation: Operation? = nil

    enum Operation {
        case add, subtract, multiply, divide
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("計算結果: \(result)")
                    .font(.largeTitle)
                    .padding(40)
                TextField("Number 1", text: $number1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                TextField("Number 2", text: $number2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)

                HStack {
                    Button("足し算") { self.performOperation(.add) }
                    Button("引き算") { self.performOperation(.subtract) }
                    Button("掛け算") { self.performOperation(.multiply) }
                    Button("割り算") { self.performOperation(.divide) }
                }

                Button("クリア") {
                    self.clearAll()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            }
            .padding()
            .navigationTitle("SwiftUI計算機")
        }
    }

    func performOperation(_ operation: Operation) {
        guard let value1 = Double(number1), let value2 = Double(number2) else {
            self.result = "数が入力されていません。"
            return
        }

        switch operation {
        case .add:
            self.result = "\(value1 + value2)"
        case .subtract:
            self.result = "\(value1 - value2)"
        case .multiply:
            self.result = "\(value1 * value2)"
        case .divide:
            self.result = value2 != 0 ? "\(value1 / value2)" : "Cannot divide by zero"
        }
    }

    func clearAll() {
        self.number1 = ""
        self.number2 = ""
        self.result = ""
        self.currentOperation = nil
    }
}


#Preview {
    ContentView()
}
