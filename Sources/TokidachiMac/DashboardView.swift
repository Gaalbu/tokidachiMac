import SwiftUI

struct DashboardView: View {
    @ObservedObject var model: DashboardModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Tokidachi").font(.headline)
                Spacer()
                Button("Refresh") { }
                    .buttonStyle(.bordered)
            }
            if let errorMessage = model.errorMessage {
                Label(errorMessage, systemImage: "exclamationmark.triangle")
                    .foregroundStyle(.orange)
            } else if let document = model.document {
                ForEach(document.providers.values.sorted { $0.id < $1.id }) { provider in
                    ProviderCardView(provider: provider)
                }
                if document.providers.isEmpty {
                    Text("No configured providers")
                        .foregroundStyle(.secondary)
                }
            } else {
                ProgressView("Waiting for collector data…")
            }
        }
        .padding(16)
        .frame(width: 360)
    }
}

private struct ProviderCardView: View {
    let provider: ProviderCard

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(provider.displayName).font(.subheadline.bold())
                Spacer()
                Text(provider.status.capitalized)
                    .font(.caption)
                    .foregroundStyle(provider.status == "ok" ? .green : .orange)
            }
            ForEach(provider.windows) { window in
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text(window.label)
                        Spacer()
                        Text("\(window.usedPercent, specifier: "%.0f")%")
                    }
                    ProgressView(value: window.usedPercent, total: 100)
                }
            }
            ForEach(provider.notices, id: \.self) { notice in
                Text(notice).font(.caption).foregroundStyle(.secondary)
            }
            if let message = provider.message { Text(message).font(.caption).foregroundStyle(.orange) }
        }
        .padding(12)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 10))
    }
}
