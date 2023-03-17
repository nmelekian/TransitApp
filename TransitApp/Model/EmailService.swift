//
//  EmailService.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/15/23.
//

import Foundation
import Combine


class EmailService {
    
    func send(message: String) -> AnyPublisher<Bool, Error> {
        
        let data: Data  = {
            let email = "betterridefeedback@gmail.com"
            let json:[String:Any] = [
                "personalizations":[["to": [["email": "burlywalter@gmail.com"]]]],
                "from": ["email": email],
                "subject": "Sending with SendGrid is Fun",
                "content":[["type":"text/plain", "value":"and easy to do anywhere, even with Swift"]]
            ]
            
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
