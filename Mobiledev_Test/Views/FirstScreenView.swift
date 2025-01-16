import SwiftUI

struct FirstScreenView: View {
    @StateObject private var viewModel = FirstScreenViewModel()
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Enter a sentence", text: $viewModel.sentence)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("Check") {
                viewModel.checkPalindrome()
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Result"),
                    message: Text(viewModel.isPalindrome == true ? "Palindrome" : "Not Palindrome"),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            NavigationLink(destination: SecondScreenView(name: viewModel.name)) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .navigationTitle("First Screen")
    }
}
