//
//  RefreshableBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 05/07/23.
//

import SwiftUI


final class RefreshableDataService {
    
    func getData() -> [String] {
        ["Apple", "Orange", "Banana"].shuffled()
    }
}

@MainActor
final class RefreshableBootcampViewModel: ObservableObject {
    @Published var items: [String] = []
    
    let manager = RefreshableDataService()
    
    func loadData() {
        Task {
            do {
                items = try await manager.getData()
            } catch {
                print(error)
            }
        }
    }
}

struct RefreshableBootcamp: View {
    
    @StateObject private var viewModel = RefreshableBootcampViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .font(.headline)
                    }
                }
            }
        }
        .refreshable {
            viewModel.loadData()
        }
        .navigationTitle("Refreshable")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.loadData()
        }
    }
}

struct RefreshableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RefreshableBootcamp()
    }
}
