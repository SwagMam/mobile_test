//
//  SecondScreenView.swift
//  Mobiledev_Test
//
//  Created by Mas Bagus on 15/01/25.
//


import SwiftUI

struct SecondScreenView: View {
    let name: String
    @StateObject private var viewModel = SecondScreenViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome")
                .font(.largeTitle)
                .padding()
            
            Text("Your name: \(name)")
            
            Text("Selected User: \(viewModel.selectedUserName)")
                .foregroundColor(.gray)
            
            NavigationLink(destination: ThirdScreenView(selectedUserName: $viewModel.selectedUserName)) {
                Text("Choose a User")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Second Screen")
    }
}
