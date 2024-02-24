//
//  LoginView.swift
//  PumpedApp
//
//  Created by Derek Denehy on 2/23/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        
        if userIsLoggedIn {
            Feed()
        } else {
            content
        }
    }
    var content: some View { ZStack{
        Color.black

        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .frame(width: 500)
            .foregroundStyle(.linearGradient(colors: [.black, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing
                
                                        ))
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .padding(.bottom)
            .opacity(0.6)
            .frame(width:365, height:600)
            .offset(y: 125)
        
        VStack(alignment: .center
               , spacing: 32.0){
            Text("Welcome")
                
                .font(.montExtraBold30)
                .foregroundColor(.white)
                .padding(.top)
                .offset(y:-200)
                .shadow(radius: 100)
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
//                        .placeholder(when: email.isEmpty){
//                            Text("Email")
//                                .foregroundColor(.white)
//                        }
//                    RoundedRectangle(cornerRadius: 20)
//                        .foregroundColor(.white)
//                        .frame(width: 350, height: 40)
//                        .opacity(0.1)
//
            
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
//                        .placeholder(when: password.isEmpty){
//                            Text("Password")
//                                .foregroundColor(.white)
//                                .background(                    RoundedRectangle(cornerRadius: 20)
//                                    .foregroundColor(.white)
//                                    .frame(width: 350, height: 40)
//                                    .opacity(0.1)
//)
//                        }
                
            
            Button {
                register()
                //sign up (make Gradient
            }label: {
                Text("Sign up")
                  
                    .font(.montMeditalic)
            }
            Button {
                login()
            }label: {
                Text("Already Have an account? Login")
                    .font(.montMeditalic)

            }
        }
        .frame(width: 350)
        .onAppear{
            Auth.auth().addStateDidChangeListener { auth, user in if user != nil {
                userIsLoggedIn.toggle()
                }
            }
        }
           
    }
    .ignoresSafeArea()}
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result,  error in if error != nil {
            print(error!.localizedDescription)
        }
        }}
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in if error != nil {
            print(error!.localizedDescription)
        }}
    }
}

#Preview {
    LoginView()
}
// .placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View{
            ZStack(alignment: alignment){
                placeholder().opacity(shouldShow ? 1 : 0)
            }
        }
    }

