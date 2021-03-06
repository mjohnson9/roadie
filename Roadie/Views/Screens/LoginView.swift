import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        Form {
            TextField("Email", text: self.$email)
            SecureField("Password", text: self.$password)
            HStack {
                Button("Login", action: {
                    self.attemptLogin(username: self.email, password: self.password)
                })
                Spacer()
                Button("Sign Up", action: {})
            }
        }
        .navigationBarTitle(Text("Login"))
    }

    func attemptLogin(username: String, password: String) {
        print("Would attempt login")
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
#endif
