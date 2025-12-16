
import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @FocusState private var focusedField: Field?
    @State private var navigate = false
    
    enum Field {
        case email
        case password
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Email")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,20)
                TextField("", text: $email)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 370 ,height: 60)
                
                    .textFieldStyle(.automatic)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .submitLabel(.return)
                    .focused($focusedField,equals: .email)
                    .onSubmit {
                        focusedField = .password
                        print("the \(email)")
                    }
                Text("Password")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,20)
                
                SecureField("", text: $password)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 370 ,height: 60)
                
                
                
                    .keyboardType(.default)
                    .textContentType(.password)
                    .disableAutocorrection(true)
                    .submitLabel(.done)
                    .focused($focusedField,equals: .password)
                    .onSubmit {
                        navigate = true
                        print(password)
                    }
                
            }
            
            .navigationTitle("Login")
            
            .navigationDestination(isPresented: $navigate) {
                OTP_for_login()
            }
            
            NavigationLink{
                OTP_for_login()
            }label: {
                Text("Login")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 150)
                    .padding(.vertical, 19)
                    .background(
                        Capsule()
                            .fill(.text)
                    )
                
                    .frame(width: 370,height: 60)
                
            }
            
            .padding()
            VStack{
                HStack{
                    Text("Do you have account?")
                        .foregroundStyle(.black)
                    NavigationLink{
                        Signup()
                    }label: {
                        Text("Sign up")
                            .foregroundStyle(.text)
                    }
                    .padding(5)
                }
            }
        }
        
        
    }
    
}

#Preview {
    Login()
}

