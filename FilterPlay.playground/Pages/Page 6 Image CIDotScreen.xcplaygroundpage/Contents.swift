import SwiftUI
import PlaygroundSupport

let imgurl = "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_6946.JPEG"

let context = CIContext()
let myURL = URL(string: imgurl)
let ci_image1 = CIImage(contentsOf: myURL!)!
print("width \(ci_image1.extent.width) height \(ci_image1.extent.height)")

//Optional(<CIDotScreen: 0x600002d4e600>
//    inputImage=nil
//    inputCenter=[150 150]
//    inputAngle=0
//    inputWidth=6
//    inputSharpness=0.7
//)

struct ExampleView: View {
    @State var inputWidth = 6.0
    @State var inputAngle = Double.pi/6
    
    var body: some View {
        let param = [
            "inputWidth": inputWidth,
            "inputAngle": inputAngle,
        ];
        let ci_image2 = ci_image1.applyingFilter("CIDotScreen", parameters: param)
        let cg_image = context.createCGImage(ci_image2, from: ci_image2.extent)
        VStack {
            Image(cg_image!, scale: 1.0, label: Text("cg_image"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 740, alignment: .topLeading)
                .clipped()
            Slider(value: $inputWidth, in: 0...50)
            Slider(value: $inputAngle, in: -Double.pi...Double.pi)
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}


PlaygroundPage.current.setLiveView(ExampleView())

//https://jht1493.net/a1/skt/assets/webdb/jht/
// IMG_7146.JPEG IMG_6338.JPEG IMG_4491.JPEG IMG_5398.JPEG IMG_6410.JPEG IMG_6885.JPEG IMG_6946.JPEG IMG_7436.JPEG IMG_7555.JPEG
