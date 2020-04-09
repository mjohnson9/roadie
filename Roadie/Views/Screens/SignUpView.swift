import SwiftUI

struct SignUpView: View {
    @State var username = ""
    @State var password = ""

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber: Int?

    @State private var DLNumber = ""
    @State private var DLIssueDate = ""
    @State private var DLExpireDate = ""

    var body: some View {
        Form {
            Section {
                TextField("Email", text: self.$username).textContentType(.emailAddress)
                SecureField("Password", text: self.$password)
            }

            Section(header: Text("Personal Information").font(.headline)) {
                TextField("First Name", text: self.$firstName)
                TextField("Last Name", text: self.$lastName)
                TextField("Phone Number", value: self.$phoneNumber, formatter: NumberFormatter())
            }

            Section(header: Text("Driver's License").font(.headline)) {
                TextField("Driver's License Number", value: self.$DLNumber, formatter: NumberFormatter())
            }
        }
        .navigationBarTitle(Text("Sign Up").font(.largeTitle))
        .navigationBarItems(leading: NavigationLink(destination: LoginView()) {
            Text("Cancel")
        }, trailing: Button(action: self.processSignup) { Text("Sign Up") })
    }

    func processSignup() {
        print("Would sign up")
    }
}

#if DEBUG
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SignUpView()
            }
            NavigationView {
                SignUpView()
            }
            .environment(\.colorScheme, .dark)
            NavigationView {
                SignUpView()
            }
            .environment(\.locale, Locale(identifier: "ar_SA"))
            .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
#endif
