import SwiftUI
import PlaygroundSupport
import CoreImage
let categories = [
    kCICategoryBuiltIn,
    kCICategoryBlur,
    kCICategoryGenerator,
    kCICategoryVideo,
    kCICategoryStylize,
    kCICategoryColorEffect,
    kCICategoryTransition,
    kCICategoryHalftoneEffect,
]
struct ListPicker: View {
    var title:String
    var list:[String]
    @Binding  var selected:String
    var body: some View {
        VStack {
            Picker(title, selection: $selected) {
                ForEach(list, id: \.self) { item in
                    Text(item)
                        .tag(item)
                }
            }
            Text("\(title) Selected: \(selected) count:\(list.count)")
        }
    }
}
struct ExampleView: View {
    @State var selectedCat:String = categories[0]
    @State var selectedFilter: String = "CIBloom"
    var body: some View {
        VStack {
            Spacer()
            ListPicker(title: "Category", list: categories, selected: $selectedCat)
            let filterList = CIFilter.filterNames(inCategory: selectedCat)
            ListPicker(title: "Filters", list: filterList, selected: $selectedFilter)
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}
PlaygroundPage.current.setLiveView(ExampleView())

// https://developer.apple.com/documentation/coreimage/cifilter/filter_category_keys
