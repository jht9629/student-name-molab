import SwiftUI
import PlaygroundSupport
import CoreImage
let categories = [
    kCICategoryBlur,
    kCICategoryGenerator,
    kCICategoryVideo,
    kCICategoryStylize,
    kCICategoryColorEffect,
    kCICategoryTransition,
]
struct Category: View {
    @Binding  var selectedCat:String
    var body: some View {
        VStack {
            Picker("Category", selection: $selectedCat) {
                ForEach(categories, id: \.self) { cat in
                    Text(cat)
                        .tag(cat)
                }
            }
            Text("Selected: \(selectedCat) count:\(categories.count) ")
        }
    }
}
struct Filter: View {
    var list:[String]
    @Binding  var selected:String
    var body: some View {
        VStack {
            Picker("Filter", selection: $selected) {
                ForEach(list, id: \.self) { item in
                    Text(item)
                        .tag(item)
                }
            }
            Text("Selected: \(selected) count:\(list.count)")
        }
    }
}
struct ExampleView: View {
    @State var selectedCat:String = categories[0]
    @State var selectedFilter: String = "CIBloom"
    var body: some View {
        VStack {
            Spacer()
            Category(selectedCat: $selectedCat)
            let filterList = CIFilter.filterNames(inCategory: selectedCat)
            Filter(list: filterList, selected: $selectedFilter)
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}
PlaygroundPage.current.setLiveView(ExampleView())

// https://developer.apple.com/documentation/coreimage/cifilter/filter_category_keys
