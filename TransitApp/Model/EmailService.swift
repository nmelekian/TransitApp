//
//  EmailService.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/15/23.
//

import Foundation
import Combine


class EmailService {
    var busRoute = ""
    var viewModel = ViewModel()
    func send(message: String) -> AnyPublisher<Bool, Error> {
        
        let data: Data  = {
            let email = "betterridefeedback@gmail.com"
            let json:[String:Any] = [
                "personalizations":[["to": [["email": "betterridefeedback@gmail.com"]]]],
                "from": ["email": email],
                "subject": "Complaint for for Bus \(viewModel.currentResponse.busRoute)",
                "content":[["type":"text/plain", "value":"Bus Route: \(viewModel.currentResponse.busRoute) Bus Number: \(viewModel.currentResponse.busNumber) \n Category: \(viewModel.currentResponse.categoryString) \n Date & Time \(viewModel.currentResponse.date) \n Details: \(viewModel.currentResponse.details) \n Name: \(viewModel.currentResponse.name) \n \(viewModel.currentResponse.email) \n \(viewModel.currentResponse.phoneNumber) "]]
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
