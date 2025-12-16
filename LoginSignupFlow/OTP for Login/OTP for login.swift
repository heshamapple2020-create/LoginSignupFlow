
import SwiftUI

struct OTP_for_login: View {
    @State private var field = ""
    var body: some View {
        NavigationStack{
            VStack{
                Text("Enter OTP")
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity,alignment: .leading)
                TextField("***", text: $field)
                    .padding(.horizontal,25)
                    .padding(.vertical,12)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(width: 370,height: 60)
                
                    .keyboardType(.numberPad)
                    .textContentType(.dateTime)
                    .submitLabel(.next)
                    .onSubmit {
                        print(field)
                    }
                Button("Resend code? 28s"){}
                    .foregroundStyle(.text)
            }
            .navigationTitle("Verify your number")
            NavigationLink{
                _Verify_notification()
            }label: {
                ZStack{
                    Circle()
                        .foregroundStyle(.text)
                        .frame(width: 100,height: 100)
                        
                    
                    Image(systemName:("arrowshape.right.fill"))
                        .font(.system(size: 35, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
            .offset(x: 130 , y: 25)
        }
    }
}

#Preview {
    OTP_for_login()
}
