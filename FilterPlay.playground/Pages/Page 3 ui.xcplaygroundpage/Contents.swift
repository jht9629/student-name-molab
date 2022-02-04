import SwiftUI
import PlaygroundSupport

let categories = [kCICategoryGenerator,
                  kCICategoryVideo,
                  kCICategoryStylize,
                  kCICategoryBlur,
                  kCICategoryColorEffect,
                  kCICategoryTransition,
]

struct ExampleView: View {
    @State private var selectedCat:String = categories[0]
    var body: some View {
        VStack {
            Spacer()
            Picker("Category", selection: $selectedCat) {
                ForEach(categories, id: \.self) { cat in
                    Text(cat)
                        .tag(cat)
                }
            }
            Text("Selected : \(selectedCat)")
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ExampleView())

// https://developer.apple.com/documentation/coreimage/cifilter/filter_category_keys
