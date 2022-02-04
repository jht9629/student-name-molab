import SwiftUI
import CoreImage

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
let myURL = URL(string: "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_4491.JPEG")
let image = CIImage(contentsOf: myURL!)

let filter = CIFilter(name: "CIMotionBlur");
//print(filter)
//print(filter!.attributes)
print(filter!.inputKeys)

//Optional(<CIMotionBlur: 0x6000018bed10>
//    inputImage=nil
//    inputRadius=20 range: 0 ... 100
//    inputAngle=0 range: -3.141592653589793 ... 3.141592653589793

let param = [
    "inputRadius": 20.0,
    "inputAngle": Double.pi/4,
];
let image2 = image!.applyingFilter("CIMotionBlur", parameters: param)
