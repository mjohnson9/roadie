//
//  ContentView.swift
//  Roadie
//
//  Created by Michael Johnson on 2/12/20.
//  Copyright © 2020 Michael Johnson. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
        Form {
            TextField("Email", text: self.$email)
            SecureField("Password", text: self.$password)
            Button("Login", action: {
                self.attemptLogin(username: self.email, password: self.password)
            })
        }
        }
    }
    
    func attemptLogin(username: String, password: String): Bool {
        return false
    }
    
    func loginResult(
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
