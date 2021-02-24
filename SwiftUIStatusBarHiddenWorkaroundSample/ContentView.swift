//
//  ContentView.swift
//  SwiftUIStatusBarHiddenWorkaroundSample
//
//  Created by hajime-nakamura on 2021/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var isFullScreenPresented: Bool = false

    var body: some View {
        ZStack {
            StatusBarControl(statusBarHidden: isFullScreenPresented)
            NavigationView {
                TabView {
                    content
                }
            }
        }
        .fullScreenCover(
            isPresented: $isFullScreenPresented,
            onDismiss: {},
            content: {
                Color.blue
                    .onTapGesture {
                        withAnimation {
                            isFullScreenPresented = false
                        }
                    }
            }
        )
    }

    var content: some View {
        Button(action: {
            withAnimation {
                isFullScreenPresented = true
            }
        }, label: {
            Text("⦿")
                .font(.system(size: 100))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
