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
let myURL = URL(string: "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7555.JPEG")
let image = CIImage(contentsOf: myURL!)

let filter = CIFilter(name: "CIEdges");
//print(filter)
//print(filter!.attributes)
print(filter!.inputKeys)

//Optional(<CIEdges: 0x600001990000>
//    inputImage=nil
//    inputIntensity=1 0...10
//)

let param = [
    "inputIntensity": 9.0
];
let image2 = image!.applyingFilter("CIEdges", parameters: param)
