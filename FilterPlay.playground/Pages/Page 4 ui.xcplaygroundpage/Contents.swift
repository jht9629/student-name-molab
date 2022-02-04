import SwiftUI
import PlaygroundSupport
import CoreImage

let categories = [kCICategoryGenerator,
                  kCICategoryVideo,
                  kCICategoryStylize,
                  kCICategoryBlur,
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
            Text("Selected : \(selectedCat)")
        }
    }
}

struct Filter: View {
    @Binding  var list:[String]
    @Binding  var selected:String
    var body: some View {
        VStack {
            Picker("Category", selection: $selected) {
                ForEach(list, id: \.self) { item in
                    Text(item)
                        .tag(item)
                }
            }
            Text("Selected : \(selected)")
        }
    }
}


struct ExampleView: View {
    @State var selectedCat:String = categories[0]
    @State var filterList = CIFilter.filterNames(inCategory: nil)
    @State var selectedFilter: String = "CIBloom"
    var body: some View {
        VStack {
            Spacer()
            Category(selectedCat: $selectedCat)
            Filter(list: $filterList, selected: $selectedFilter)
        }
        .frame(width: 375, height: 812)
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ExampleView())

// https://developer.apple.com/documentation/coreimage/cifilter/filter_category_keys
