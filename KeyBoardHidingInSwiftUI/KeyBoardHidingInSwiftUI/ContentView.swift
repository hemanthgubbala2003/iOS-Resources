//
//  ContentView.swift
//  KeyBoardHidingInSwiftUI
//
//  Created by FCI on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    
    enum Field {
        case firstName
        case lastName
        case emailAddress
    }

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @FocusState private var focusedField: Field?
    
    
    var body: some View {
        VStack {
                    TextField("Enter your first name", text: $firstName)
                        .focused($focusedField, equals: .firstName)
                        .textContentType(.givenName)
                        .submitLabel(.next)
            
                    TextField("Enter your last name", text: $lastName)
                        .focused($focusedField, equals: .lastName)
                        .textContentType(.familyName)
                        .submitLabel(.next)

                    TextField("Enter your email address", text: $emailAddress)
                        .focused($focusedField, equals: .emailAddress)
                        .textContentType(.emailAddress)
                        .submitLabel(.join)
                }
                .onSubmit {
                    switch focusedField {
                    case .firstName:
                        focusedField = .lastName
                    case .lastName:
                        focusedField = .emailAddress
                    default:
                        print("Creating account…")
                    }
                }
    }
}

#Preview {
    ContentView()
}
