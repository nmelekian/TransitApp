//
//  EmailService.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/16/23.
//

import Foundation
import Combine
import SwiftUI


class EmailService {
    var busRoute = ""
    @EnvironmentObject var viewModel: ViewModel
    func send(message: String, data: ViewModel) -> AnyPublisher<Bool, Error> {
        
        let data: Data  = {
            let email = "betterridefeedback@gmail.com"
            let json:[String:Any] = [
                "personalizations":[["to": [["email": "betterridefeedback@gmail.com"]]]],
                "from": ["email": email],
                "subject": "Complaint for for Bus \(data.currentResponse.busRoute)",
                "content":[["type":"text/plain", "value":"Bus Route: \(data.currentResponse.busRoute) \n Bus Number: \(data.currentResponse.busNumber) \n Category: \(data.currentResponse.categoryString) \n Date & Time \(data.currentResponse.date) \n Details: \(data.currentResponse.details) \n Name: \(data.currentResponse.name) \n \(data.currentResponse.email) \n \(data.currentResponse.phoneNumber) "]]
            ]
            // category
            // details
            //date and time
            // bus route
            // bus number
            // name
            // email
            // phone number
            return try! JSONSerialization.data(withJSONObject: json, options: [])
        }()
        
//        print("Data: \(String(data: data, encoding: .utf8))")
        
        let request: URLRequest = {
            let apiKey = ""
            
            let url = URL(string: "https://api.sendgrid.com/v3/mail/send")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            print("\(request)")
            return request
            
        }()
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .catch { error in
                return Fail(error: error).eraseToAnyPublisher()
            }.tryMap { output in
                let statusCode = (output.response as? HTTPURLResponse)?.statusCode ?? 0
                return (200...299).contains(statusCode)
            }.eraseToAnyPublisher()





    }
    
}

class EmailPracticeViewModel: ObservableObject {
    var emailService = EmailService()
    @EnvironmentObject var viewModel: ViewModel
    private var cancellables = Set<AnyCancellable>()
    @Published var text = ""
    @Published private(set) var label = "hi"
    @Published var isShowingLabel = false
    
    func sendEmailButtonTapped(data: ViewModel) {
        isShowingLabel = true
        let message = text

        emailService.send(message: message, data: data)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isShowingLabel = false
            if case .failure(let error) = completion {
                self?.label = error.localizedDescription
                }
            } receiveValue: { [weak self] isSuccessful in
                self?.label = isSuccessful ? "Sent Successfully" : "Something went wrong!"
            }.store(in: &cancellables)
    }
}
