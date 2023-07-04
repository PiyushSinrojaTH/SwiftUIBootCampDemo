//
//  Demo1App.swift
//  Demo1
//
//  Created by Piyush Sinroja on 19/10/22.
//

import SwiftUI

@main
struct Demo1App: App {
    
    @StateObject var appContext = AppContext()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appdelegate
    
    var body: some Scene {
        WindowGroup {
          //  ContentView()
          //  ImagePicker()
            
          //  ScrollViewBootcamp()
          //  LazyStackBootcamp()
          //  AppStorageBootcamp()
          //  ImproveListBootcamp()
          //  ViewModelBootcamp()
            FocusStateBootcamp()
        }
    }
    
    func loadExportFiles() {
        ExportFilesBootcamp()
            .environmentObject(self.appContext)
            .fileExporter(
                isPresented: $appContext.fileSaveDialogShown,
                documents: [
                    TextFile(initialText: "ExportFilesExample")
                ],
                contentType: .plainText // Match this to your representation in ImageDocument
            ) { url in
                print("Saved to", url) // [URL]
            }
    }
}
class AppContext: ObservableObject {
    @Published var fileSaveDialogShown = false
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Finished launching")
        return true
    }
}
