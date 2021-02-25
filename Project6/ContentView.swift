//
//  ContentView.swift
//  Project6
//
//  Created by Jacob LeCoq on 2/21/21.
//

import SwiftUI

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

struct ContentView: View {
    // Implicit Animations
    //    @State private var animationAmount: CGFloat = 1

    // Explicit Animations
    @State private var animationAmount = 0.0
    @State private var enabled = false

    // Gesture Animations
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")

    // Animating Tranisitons
    @State private var isShowingRed = false

    var body: some View {
        /**
         Animating Transitions
         */

        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }

        /**
         Animating with Gestures
         */
        //        HStack(spacing: 0) {
        //            ForEach(0..<letters.count) { num in
        //                Text(String(self.letters[num]))
        //                    .padding(5)
        //                    .font(.title)
        //                    .background(self.enabled ? Color.blue : Color.red)
        //                    .offset(self.dragAmount)
        //                    .animation(Animation.default.delay(Double(num) / 20))
        //            }
        //        }
        //        .gesture(
        //            DragGesture()
        //                .onChanged { self.dragAmount = $0.translation }
        //                .onEnded { _ in
        //                    self.dragAmount = .zero
        //                    self.enabled.toggle()
        //                }
        //        )

        //        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        //            .frame(width: 300, height: 200)
        //            .clipShape(RoundedRectangle(cornerRadius: 10))
        //            .offset(dragAmount)
        //            .gesture(
        //                DragGesture()
        //                    .onChanged { self.dragAmount = $0.translation }
        //                    .onEnded { _ in
        //                        withAnimation(.spring()) {
        //                            self.dragAmount = .zero
        //                        }
        //                    }
        //            )

        /*
         Explicit Animations
         **/

        // Animation Order Matters

        //        Button("Tap Me") {
        //            self.enabled.toggle()
        //        }
        //        .frame(width: 200, height: 200)
        //        .background(enabled ? Color.blue : Color.red)
        //        .animation(nil)
        //        .foregroundColor(.white)
        //        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        //        .animation(.interpolatingSpring(stiffness: 10, damping: 1))

        // Animating Explicitly :)

        //        Button("Tap Me") {
        //            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
        //                self.animationAmount += 360
        //            }
        //        }
        //        .padding(50)
        //        .background(Color.red)
        //        .foregroundColor(.white)
        //        .clipShape(Circle())
        //        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))

        /*
         Animating Values
         **/

        //        VStack {
        //            Stepper("Scale amount", value: $animationAmount.animation(
        //                Animation.easeInOut(duration: 1)
        //                    .repeatCount(3, autoreverses: true)
        //            ), in: 1...10)
        //
        //            Spacer()
        //
        //            Button("Tap Me") {
        //                self.animationAmount += 1
        //            }
        //            .padding(40)
        //            .background(Color.red)
        //            .foregroundColor(.white)
        //            .clipShape(Circle())
        //            .scaleEffect(animationAmount)
        //        }

        /*
         Implicit Animations
         **/

        //        Button("Tap Me") {
        //            // self.animationAmount += 1
        //        }
        //        .padding(40)
        //        .background(Color.red)
        //        .foregroundColor(.white)
        //        .clipShape(Circle())
        //        .overlay(
        //            Circle()
        //                .stroke(Color.red)
        //                .scaleEffect(animationAmount)
        //                .opacity(Double(1.5 - animationAmount))
        //                .animation(
        //                    Animation.easeOut(duration: 1)
        //                        .repeatForever(autoreverses: false)
        //                )
        //        )
        //        .onAppear {
        //            self.animationAmount = 1.5
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
