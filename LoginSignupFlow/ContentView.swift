
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Image("creator")
                    .resizable()
                    .scaledToFit()
                    Spacer()
                NavigationLink{
                    Login()
                }label: {
                    Text("Get Started!")
                        .font(.headline)
                        .padding(.horizontal,65)
                        .padding(.vertical,19)
                        .foregroundStyle(.white)
                        .background(
                            Capsule()
                                .fill(.text)
                        )
                        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 10)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
