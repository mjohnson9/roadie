//
//  SignUpView.swift
//  Roadie
//
//  Created by Michael Johnson on 2/19/20.
//  Copyright © 2020 Michael Johnson. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
	@State private var username = ""
	@State private var password = ""

	@State private var firstName = ""
	@State private var lastName = ""
	@State private var phoneNumber = 0

	@State private var DLNumber = ""
	@State private var DLIssueDate = ""
	@State private var DLExpireDate = ""

	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Email", text: self.$username)
					SecureField("Password", text: self.$password)
				}

                Section(header: Text("Personal Information")) {
					TextField("First Name", text: self.$firstName)
					TextField("Last Name", text: self.$lastName)
					TextField("Phone Number", value: self.$phoneNumber, formatter: NumberFormatter())
				}

				Section(header: Text("Driver's License")) {
					TextField("Driver's License Number", value: self.$DLNumber, formatter: NumberFormatter())
				}
			}
		}
	}

	func processSignup(username: String, password: String) {
		print("Would sign up")
	}
}

struct SignUpView_Previews: PreviewProvider {
	static var previews: some View {
		SignUpView()
	}
}
