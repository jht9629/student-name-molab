import SwiftUI
import PlaygroundSupport

let img_url = "https://jht1493.net/a1/skt/assets/webdb/jht/"
let img_names = ["IMG_7146.JPEG","IMG_6338.JPEG","IMG_4491.JPEG","IMG_5398.JPEG","IMG_7436.JPEG","IMG_6946.JPEG","IMG_6410.JPEG","IMG_7555.JPEG","IMG_6885.JPEG"]
let context = CIContext()
func img_for(index:Int) -> CIImage {
    let myURL = URL(string: img_url + img_names[index])
    let ci_image1 = CIImage(contentsOf: myURL!)!
    print("index \(index) width \(ci_image1.extent.width) height \(ci_image1.extent.height)")
    return ci_image1;
}
let filter_names = ["CICircularScreen","CICMYKHalftone","CIDotScreen","CIHatchedScreen","CILineScreen"]

struct ExampleView: View {
    @State var inputWidth = 10.0
    @State var fill = false
    @State var img_index = 0;
    @State var filter_index = 0;
    var body: some View {
        let param = [
            "inputWidth": inputWidth,
        ];
        let filter_name = filter_names[filter_index]
        let ci_image1 = img_for(index: img_index)
        let ci_image2 = ci_image1.applyingFilter(filter_name, parameters: param)
        let cg_image = context.createCGImage(ci_image2, from: ci_image2.extent)
        VStack {
            Image(cg_image!, scale: 1.0, label: Text("cg_image"))
                .resizable()
                .aspectRatio(contentMode: fill ? .fill: .fit)
                .frame(height: 700.0, alignment: .topLeading)
                .clipped()
            HStack {
                Toggle("Fill", isOn: $fill).frame(width: 100)
                Button("Next") {
                    img_index = (img_index + 1) % img_names.count;
                }.frame(width: 100)
            }
            HStack {
                Text("Filter \(filter_name)")
                Button("Next") {
                    filter_index = (filter_index + 1) % filter_names.count;
                }
            }
            Slider(value: $inputWidth, in: 0...50)
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ExampleView())
