//
//  ContentView.swift
//  Shared
//
//  Created by Tomas Kafka on 06.08.2021.
//

import SwiftUI

/// hack from https://stackoverflow.com/a/68448681/38729
struct OverlayWrapper<Content: View>: UIViewRepresentable {
		
		var content: Content
		
		init(@ViewBuilder content: @escaping () -> Content) {
				self.content = content()
		}
		
		func makeUIView(context: Context) -> UIView {
				
				let uiView = UIView()
				
				// Get reference to the SwiftUI view wrapped inside ScrollView
				let child = UIHostingController(rootView: content)
				
				let screenWidth = UIScreen.main.bounds.width
				let screenHeight = UIScreen.main.bounds.height
				
				// Get size of the child
				let newSize = child.view.sizeThatFits(CGSize(width: screenWidth, height: screenHeight))
				
				let frame = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
				
				child.view.frame = frame
				child.view.backgroundColor = UIColor.clear

				uiView.frame = frame
				uiView.backgroundColor = UIColor.clear
				
				uiView.addSubview(child.view)
				
				return uiView
		}
		
		
		func updateUIView(_ uiView: UIView, context: Context) {
				// If the UI is not updated, updateUIView will not be called
		}
}

struct HorizontalView: View {
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				Group {
					Text("Scroll this ->")
					Text("B")
					Text("C")
					Text("D")
					Text("E")
					Text("F")
					Text("G")
					Text("H")
					Text("I")
					Text("J")
				}
				Group {
					Text("K")
					Text("L")
					Text("M")
					Text("N")
					Text("O")
					Text("P")
					Text("Q")
					Text("R")
					Text("S")
					Text("T")
				}
			}
		}
	}
}

struct ContentView: View {
		var body: some View {
			ZStack(alignment: .topTrailing) {

				/// this seems to work
				OverlayWrapper() {
					Rectangle()
						.background(Color.red)
						.frame(width: 128, height: 192)
						.opacity(0.25)
				}
					.frame(width: 128, height: 192)
					.disabled(true)
					.zIndex(1)
				
				ScrollView(.vertical) {
					VStack {
						HorizontalView()
						
						Text("You can tap the button through the red view, but you cannot scroll the scrollviews, even though the Rectangle is disabled and should have no hit testing!")
						
						Button(action: {}) {
							Text("Tap me")
						}
							.frame(idealWidth: .infinity, maxWidth: .infinity)
						Text("Line 1")
				
						Group {
							Text("Line 2")
							Text("Line 3")
							Text("Line 4")
							Text("Line 5")
							Text("Line 6")
							Text("Line 7")
							Text("Line 8")
							Text("Line 9")
							Text("Line 10")
							Text("Line 11")
						}
						Group {
							Text("Line 12")
							Text("Line 13")
							Text("Line 14")
							Text("Line 15")
							Text("Line 16")
							Text("Line 17")
							Text("Line 18")
							Text("Line 19")
							Text("Line 20")
							Text("Line 21")
						}
					}
				} /// scrollview
				.zIndex(0)
				
			} /// zstack
			.frame(width: 256, height: 256)
			.background(Color.white)
		}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
