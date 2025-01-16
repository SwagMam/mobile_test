//
//  FirstScreenViewModel.swift
//  Mobiledev_Test
//
//  Created by Mas Bagus on 15/01/25.
//


import Foundation

class FirstScreenViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var sentence: String = ""
    @Published var isPalindrome: Bool? = nil
    
    func checkPalindrome() {
        let cleanText = sentence.replacingOccurrences(of: " ", with: "").lowercased()
        isPalindrome = cleanText == String(cleanText.reversed())
    }
}
