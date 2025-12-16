
import SwiftUI

struct _Verify_notification: View {
    var body: some View {
        NavigationStack {
                   VStack(spacing: 24) {

                       
                       Text("Great, You're Almost There")
                           .font(.title2)
                           .fontWeight(.bold)
                           .foregroundStyle(.text)

                       Text("To complete your registration process, you will need to")
                           .font(.subheadline)
                           .foregroundColor(.gray)
                           .multilineTextAlignment(.center)

                       
                       VStack(spacing: 20) {
                           StepRow(number: "1", text: "Take photos of your NID Card")
                           StepRow(number: "2", text: "Confirm basic information")
                           StepRow(number: "3", text: "Take a photo of yourself")
                       }
                       .padding()
                       .background(Color.white)
                       .cornerRadius(16)
                       .shadow(radius: 5)

                       Spacer()

                       
                       NavigationLink {
                           Text("Next Screen")
                       } label: {
                           Text("Let’s Continue")
                               .fontWeight(.semibold)
                               .foregroundStyle(.white)
                               .frame(maxWidth: .infinity)
                               .padding()
                               .background(Color.text)
                               .cornerRadius(30)
                       }
                   }
                   .padding()
               }
        
    }
}

#Preview {
    _Verify_notification()
}

struct StepRow: View {
    let number: String
    let text: String

    var body: some View {
        HStack(spacing: 16) {

            Circle()
                .fill(Color.orange)
                .frame(width: 28, height: 28)
                .overlay(
                    Text(number)
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.bold)
                )

            Text(text)
                .font(.subheadline)

            Spacer()
        }
    }
}
