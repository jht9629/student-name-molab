import UIKit
import CoreImage

let imgurl = "https://jht1493.net/a1/skt/assets/webdb/jht/IMG_7146.JPEG"
let context = CIContext()
let myURL = URL(string: imgurl)
let ci_image1 = CIImage(contentsOf: myURL!)!
let cg_image = context.createCGImage(ci_image1, from: ci_image1.extent)!
let ui_image = UIImage(cgImage: cg_image)

extension UIImage {
    func coreImageAverageColor() -> UIColor? {
        // Shrink down a bit first
        let aspectRatio = self.size.width / self.size.height
        let resizeSize = CGSize(width: 40.0, height: 40.0 / aspectRatio)
        let renderer = UIGraphicsImageRenderer(size: resizeSize)
        let baseImage = self
        
        let resizedImage = renderer.image { (context) in
            baseImage.draw(in: CGRect(origin: .zero, size: resizeSize))
        }

        // Core Image land!
        guard let inputImage = CIImage(image: resizedImage) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}

let avg_color = ui_image.coreImageAverageColor()
print(avg_color as Any)
// Optional(UIExtendedSRGBColorSpace 0.509804 0.419608 0.388235 0.996078)

// https://stackoverflow.com/questions/69912713/how-can-i-access-the-pixels-data-in-swiftui-canvas

extension UIImage {
    func pixelData() -> [UInt8]? {
        let size = self.size
        let dataSize = size.width * size.height * 4
        var pixelData = [UInt8](repeating: 0, count: Int(dataSize))
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: &pixelData,
                                width: Int(size.width),
                                height: Int(size.height),
                                bitsPerComponent: 8,
                                bytesPerRow: 4 * Int(size.width),
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)
        guard let cgImage = self.cgImage else { return nil }
        context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))

        return pixelData
    }
 }
let pixelData = ui_image.pixelData()
print(pixelData!.count)
// 971472


