import SwiftUI
import PlaygroundSupport

//AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
//    if let image = phase.image {
//        image // Displays the loaded image.
//    } else if phase.error != nil {
//        Color.red // Indicates an error.
//    } else {
//        Color.blue // Acts as a placeholder.
//    }
//}

let imgurl = "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_4491.JPEG"

struct ExampleView: View {

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imgurl)) { phase in
                if let image = phase.image {
                    image // Displays the loaded image.
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    Color.blue // Acts as a placeholder.
                }
            }
            Spacer()
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}


PlaygroundPage.current.setLiveView(ExampleView())


// https://developer.apple.com/documentation/swiftui/asyncimage
