import SwiftUI
import PlaygroundSupport

let imgurl = "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_4491.JPEG"

let context = CIContext()
let myURL = URL(string: imgurl)
let ci_image1 = CIImage(contentsOf: myURL!)

struct ExampleView: View {
    @State var inputRadius = 20.0
    @State var inputAngle = Double.pi/6

    var body: some View {
        let param = [
            "inputRadius": inputRadius,
            "inputAngle": inputAngle,
        ];
        let ci_image2 = ci_image1!.applyingFilter("CIMotionBlur", parameters: param)
        let cg_image = context.createCGImage(ci_image2, from: ci_image2.extent)
        VStack {
            Image(cg_image!, scale: 0.5, label: Text("cg_image"))
                .frame(height: 740)
//                .aspectRatio(contentMode: .fit)
//            Spacer()
            Slider(value: $inputRadius, in: 0...200)
            Slider(value: $inputAngle, in: -Double.pi...Double.pi)
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}


PlaygroundPage.current.setLiveView(ExampleView())
