
import Foundation

//let home = FileManager.default.homeDirectoryForCurrentUser

let directory = try? FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true) as URL
print(directory as Any)
