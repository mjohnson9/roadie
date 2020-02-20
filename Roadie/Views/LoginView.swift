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
		NavigationView {
			Form {
				TextField("Email", text: self.$email)
				SecureField("Password", text: self.$password)
				Spacer()
				Button("Login", action: {
					self.attemptLogin(username: self.email, password: self.password)
				})
			}
			.navigationBarTitle(Text("Login"))
		}
	}

	func attemptLogin(username: String, password: String) {
		print("Would attempt login")
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
