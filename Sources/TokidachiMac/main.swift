import SwiftUI

@main
struct TokidachiMacApp: App {
    @StateObject private var model = DashboardModel()

    var body: some Scene {
        MenuBarExtra("Tokidachi", systemImage: "chart.bar.xaxis") {
            DashboardView(model: model)
        }
        .menuBarExtraStyle(.window)
    }
}
