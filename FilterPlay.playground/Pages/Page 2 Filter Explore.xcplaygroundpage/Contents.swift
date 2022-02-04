import SwiftUI
import CoreImage

// https://developer.apple.com/documentation/coreimage/cifilter
// https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/uid/TP30000136-SW29

//let filter = CIFilter(name: "CICheckerboardGenerator");
//print(filter as Any)
//print(filter!.attributes)

//let image4 = CIFilter(
//  name: "CICheckerboardGenerator",
//  parameters: [
//    "inputCenter": CIVector(
//        x: 150.0,
//        y: 150.0),
//    "inputWidth": 10,
//    "inputSharpness": 1,
//    "inputColor0": CIColor.black,
//    "inputColor1": CIColor.white
//  ])?
//  .outputImage

//let sunGenerate = CIFilter(
//  name: "CISunbeamsGenerator",
//  parameters: [
//    "inputStriationStrength": 1,
//    "inputSunRadius": 300,
//    "inputCenter": CIVector(
//        x: 100.0,
//      y: 100.0)
//  ])?
//  .outputImage

//let image4 = filter!.outputImage

//Optional(<CICheckerboardGenerator: 0x6000016f4c80>
//    inputCenter=[150 150]
//    inputColor0=<CIColor 0x6000036ff630 (1 1 1 1) devicergb>
//    inputColor1=<CIColor 0x6000036ff2a0 (0 0 0 1) devicergb>
//    inputWidth=80
//    inputSharpness=1

print(kCIInputBackgroundImageKey)

