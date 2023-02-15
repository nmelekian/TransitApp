//
//  EmailPracticeView.swift
//  TransitApp
//
//  Created by Nicholas Melekian on 2/15/23.
//

import SwiftUI
import Combine

struct EmailPractice: View {
//    private let emailService = EmailService()
//    private var cancellables = Set<AnyCancellable>()
//    @State private var text = ""
//    @State private var label = "hi"
//    @State var isShowingLabel = false
    @StateObject var vm = EmailPracticeViewModel()
    
    var body: some View {
        VStack{
            TextField("Text", text: $vm.text)
                .padding()
            Text(vm.label)
                .opacity(vm.isShowingLabel ? 0 : 1)
                
            
            
            Button("Press Me") {
                vm.sendEmailButtonTapped()
            }
        }
        
    }
    

}

struct EmailPractice_Previews: PreviewProvider {
    static var previews: some View {
        EmailPractice()
    }
}

class EmailPracticeViewModel: ObservableObject {
    private let emailService = EmailService()
    private var cancellables = Set<AnyCancellable>()
    @Published var text = ""
    @Published private(set) var label = "hi"
    @Published var isShowingLabel = false
    
    func sendEmailButtonTapped() {
        isShowingLabel = true
        let message = text

        emailService.send(message: message)
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


struct EmailPracticeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EmailPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        EmailPracticeView()
    }
}
