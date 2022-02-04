import SwiftUI
import PlaygroundSupport
import UIKit

let imgurl = "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7555.JPEG"

//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7146.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_6338.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_4491.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_5398.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_6410.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_6885.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_6946.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7436.JPEG
//https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7555.JPEG

let context = CIContext()
let myURL = URL(string: imgurl)
let ci_image1 = CIImage(contentsOf: myURL!)

let filter = CIFilter(name: "CIMotionBlur");
//print(filter)
//print(filter!.attributes)

//Optional(<CIMotionBlur: 0x6000018bed10>
//    inputImage=nil
//    inputRadius=20 range: 0 ... 100
//    inputAngle=0 range: -3.141592653589793 ... 3.141592653589793

let param = [
    "inputRadius": 20.0,
    "inputAngle": Double.pi/6,
];
let ci_image2 = ci_image1!.applyingFilter("CIMotionBlur", parameters: param)

let cg_image = context.createCGImage(ci_image2, from: ci_image2.extent)!

let ui_image = UIImage(cgImage: cg_image)
//let data = ui_image.jpegData(compressionQuality: 1)
let data = ui_image.pngData()

let directory = try? FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true) as URL
//let directory = URL(fileURLWithPath: "/Users/jht2/Documents/projects/")
//!!explicit path fails
//print(directory as Any)
let filePath = directory!.appendingPathComponent("CIMotionBlur.png");

let err: ()? = try? data?.write(to: filePath)
print("err \(String(describing: err))\nfilePath \(filePath)")

//struct ExampleView: View {
//
//    var body: some View {
//        VStack {
//            //Image(decorative: cg_image!, scale: 1.0)
//            Image(cg_image!, scale: 1.0, label: Text("cg_image"))
//            Spacer()
//        }
//        .frame(width: 375, height: 812)
//        .padding()
//    }
//}
//
//
//PlaygroundPage.current.setLiveView(ExampleView())


// https://developer.apple.com/documentation/swiftui/asyncimage
