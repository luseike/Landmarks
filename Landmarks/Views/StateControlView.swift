//
//  StateControlView.swift
//  Landmarks
//
//  Created by 远路蒋 on 2024/10/15.
//

import SwiftUI

// 遵循 ObservableObject协议的对象，表示可被观察的对象
class CounterViewModel: ObservableObject {
    @Published var counter = 0
}

struct ObservableView: View {
    // @ObservedObject 用于将 遵循ObservableObject的对象 注入到视图中
    @ObservedObject var viewModel = CounterViewModel()
    var body: some View {
        VStack {
            Text("Counter: \(viewModel.counter)")
            Button("Increment") {
                viewModel.counter += 2
            }
        }
    }
}

struct ChildView2: View {
    @EnvironmentObject var viewModel: CounterViewModel
    var body: some View {
        Button("Increment in child2 view") {
            viewModel.counter += 1
        }
    }
}
struct ChildView1: View {
    @EnvironmentObject var viewModel: CounterViewModel
    var body: some View {
        Text("Counter: \(viewModel.counter)")
    }
}

struct ParentView: View {
    @StateObject var viewModel = CounterViewModel()
    var body: some View {
        VStack {
            ChildView1()
            ChildView2()
        }.environmentObject(viewModel)
        // EnvironmentObject 允许在视图层次结构中共享一个可观察的对象
    }
}

struct ChildView: View {
    /**
     @Binding 用于在子视图中访问和修改父视图中由 @State 管理的属性
     */
    @Binding var counter: Int
    var body: some View {
        Button("Increment in child") {
            counter += 1
        }
    }
}

struct StateControlView: View {
    @State private var counter = 0
    var body: some View {
        VStack {
            Spacer()
            Text("Counter: \(counter)")
            ChildView(counter: $counter)
            Spacer()
            ObservableView()
            
            Spacer()
            ParentView()
            Spacer()
        }
        
        /*
        Button(role: .destructive) {
            counter += 1
        } label: {
            Text("Add")
        }
         */
    }
}

#Preview {
    StateControlView()
}
