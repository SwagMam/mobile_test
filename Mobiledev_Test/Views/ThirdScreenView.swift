//
//  ThirdScreenView.swift
//  Mobiledev_Test
//
//  Created by Mas Bagus on 15/01/25.
//


import SwiftUI

struct ThirdScreenView: View {
    @Binding var selectedUserName: String
    @StateObject private var viewModel = ThirdScreenViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.users) { user in
                Button(action: {
                    selectedUserName = "\(user.firstName) \(user.lastName)"
                }) {
                    HStack {
                        AsyncImage(url: URL(string: user.avatar)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
        .refreshable {
            viewModel.refreshUsers()
        }
        .navigationTitle("Third Screen")
    }
}
