# Tokidachi macOS

Native macOS menu bar host for the Tokidachi collector. This repository owns
the SwiftUI presentation layer; the collector and JSON contract remain in
[`Gaalbu/tokidachi`](https://github.com/Gaalbu/tokidachi).

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
