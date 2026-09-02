# Tokidachi macOS

Native macOS menu bar host for Tokidachi. Tokidachi is three coordinated
components: the shared collector and Linux/GNOME host in
[`tokidachi`](https://github.com/Gaalbu/tokidachi), this native macOS host, and
the native Windows host in [`tokidachiWin`](https://github.com/Gaalbu/tokidachiWin).
This repository owns only the SwiftUI presentation layer; the collector and
versioned JSON contract remain in `tokidachi`.

### Tokidachi components

| Component | Scope | Repository / downloads |
| --- | --- | --- |
| Collector + Linux host | Java collector and GNOME Shell widget | [tokidachi](https://github.com/Gaalbu/tokidachi) · [Linux releases](https://github.com/Gaalbu/tokidachi/releases) |
| macOS host | Swift/AppKit/SwiftUI menu bar app | [tokidachiMac](https://github.com/Gaalbu/tokidachiMac) · _macOS releases: TBD_ |
| Windows host | WinUI 3/.NET tray app | [tokidachiWin](https://github.com/Gaalbu/tokidachiWin) · _Windows releases: TBD_ |

Target: macOS 13+. The current vertical slice provides a `MenuBarExtra`, a
dashboard with provider cards, contract decoding, and explicit error state.
Collector process launching, periodic refresh, settings, packaging, and real
Mac credential validation are next slices.

## Build and test

```sh
swift test
swift build
```

The fixture in `Tests/TokidachiMacTests/Fixtures/` mirrors the shared examples
in `tokidachi/fixtures/collector/` and is used only for offline decoder tests.
