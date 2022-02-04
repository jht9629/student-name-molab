import SwiftUI
import CoreImage

// https://developer.apple.com/documentation/coreimage/cifilter

let filter1 = CIFilter(name: "CICheckerboardGenerator");
filter1?.inputKeys
print("filter1?.inputKeys \(String(describing: filter1?.inputKeys))")
let fd1 = filter1!.attributes.description
print("fd1 \(fd1)")

let filterList = CIFilter.filterNames(inCategory: nil)
func print_filterList() {
    for f in filterList {
        print(f)
    }
}
filterList.count
// 230
print_filterList()

let f1 = filterList[0]
let f2 = filterList[99]

// for in indices
// for display index

// kCICategoryDistortionEffect
// kCICategoryGeometryAdjustment

let flDistortion = CIFilter.filterNames(inCategory: kCICategoryDistortionEffect)
flDistortion.count

let flVideo = CIFilter.filterNames(inCategory: kCICategoryVideo)
flVideo.count

let flBlur = CIFilter.filterNames(inCategory: kCICategoryBlur)
flBlur.count

print(flBlur)
// ["CIBokehBlur", "CIBoxBlur", "CIDepthBlurEffect", "CIDiscBlur", "CIGaussianBlur", "CIMaskedVariableBlur", "CIMedianFilter", "CIMorphologyGradient", "CIMorphologyMaximum", "CIMorphologyMinimum", "CIMorphologyRectangleMaximum", "CIMorphologyRectangleMinimum", "CIMotionBlur", "CINoiseReduction", "CIZoomBlur"]

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
let myURL = URL(string: "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7146.JPEG")
let image = CIImage(contentsOf: myURL!)

let param = [
  "inputRadius": 40.0,
  "inputIntensity": 1.0
];
let image2 = image!.applyingFilter("CIBloom", parameters: param)

let param3 = [
  "inputRadius": 60,
  "inputAngle": (Double.pi / 360) * 25
];
let image3 = image!.applyingFilter("CIMotionBlur", parameters: param3)

let filter = CIFilter(name: "CICheckerboardGenerator", parameters: [:]);
print(filter as Any)
print(filter!.attributes.description)

let sunGenerate = CIFilter(
  name: "CISunbeamsGenerator",
  parameters: [
    "inputStriationStrength": 1,
    "inputSunRadius": 300,
    "inputCenter": CIVector(
        x: 100.0,
      y: 100.0)
  ])?
  .outputImage

//let image4 = filter!.outputImage

//Optional(<CICheckerboardGenerator: 0x6000016f4c80>
//    inputCenter=[150 150]
//    inputColor0=<CIColor 0x6000036ff630 (1 1 1 1) devicergb>
//    inputColor1=<CIColor 0x6000036ff2a0 (0 0 0 1) devicergb>
//    inputWidth=80
//    inputSharpness=1


//Optional(<CIMotionBlur: 0x600003989ea0>
//    inputImage=nil
//    inputRadius=20
//    inputAngle=0
//)

//Optional(<CIBoxBlur: 0x600001542d60>
//    inputImage=nil
//    inputRadius=10
//)

//Optional(<CIBloom: 0x60000221dd50>
//    inputImage=nil
//    inputRadius=10
//    inputIntensity=0.5
//)
