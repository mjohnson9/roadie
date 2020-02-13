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
		Form {
			TextField("Email", text: self.$email)
			SecureField("Password", text: self.$password)
			HStack {
				Button(action: {}) {
					Text("Button 1")
				}
				Spacer()
				Button(action: {}) {
					Text("Login")
				}
			}
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
