import SwiftUI
import Sliders

struct ContentView: View {
    @State var nativeValue = 0.5
    @State var value1 = 0.5
    @State var value2 = 0.5
    @State var value3 = 0.5
    @State var value4 = 0.5
    @State var range1 = 0.2...0.8
    @State var range2 = 0.2...0.8
    @State var range3 = 0.1...0.9
    @State var range4 = 0.1...0.9
    
    var body: some View {
        NavigationView {
            List {
                Section(header: HStack {
                    Text("Native Slider")
                    Spacer()
                    Text("\(nativeValue.description)")
                }) {
                    Slider(value: $nativeValue, in: 0.0...1.0, step: 0.01)
                }
                
                Section(header: HStack {
                    Text("Value Sliders")
                    Spacer()
                    Text("\(value1.description)")
                }) {
                    ValueSlider(value: $value1)
                    ValueSlider(value: $value2)
                        .clippedValue(false)
                    ValueSlider(value: $value4)
                        .sliderStyle(
                            GradientSliderStyle(colors: [.green, .yellow, .red])
                        )
                    ValueSlider(value: $value3)
                        .thickness(6)
                        .clippedValue(false)
                        .sliderStyle(
                            GradientSliderStyle()
                        )
                }
                
                Section(header: HStack {
                    Text("Range Sliders")
                    Spacer()
                    Text("\(range1.description)")
                }) {
                    RangeSlider(range: $range1)
                    RangeSlider(range: $range2)
                        .clippedValue(false)
                    RangeSlider(range: $range3)
                        .sliderStyle(
                            GradientSliderStyle(colors: [.blue, .red])
                        )
                    RangeSlider(range: $range4)
                        .thickness(6)
                        .clippedValue(false)
                        .sliderStyle(
                            GradientSliderStyle()
                        )
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Sliders")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
