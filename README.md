# 📏 UnitConverter

A simple and elegant SwiftUI Unit Converter app that supports converting between multiple categories — including Length, Temperature, Time, and Volume.
The UI allows selecting an input value, choosing input/output units, and instantly viewing the converted result.

# 🚀 Features
## ✅ Supported Categories
### Length

- meters (m)

- kilometers (km)

- feet (ft)

- yards (yd)

- miles (mi)

### Temperature

- Celsius (°C)

- Fahrenheit (°F)

- Kelvin (K)

### Time

- seconds (s)

- minutes (min)

- hours (hr)

- days (d)

### Volume

- liters (L)

- milliliters (mL)

- gallons (gal)

- cups (cup)

## ⭐ Key Highlights

- Built entirely using SwiftUI

- Clean conversion logic using enums and reusable conversion functions

- Real-time output updates as you type

- Beginner-friendly code structure

- Easily extendable to more categories or units

## 🧮 Example: Length Conversion Logic
```
enum LengthUnit: String, CaseIterable {
    case m = "m"
    case km = "km"
    case ft = "ft"
    case yd = "yd"
    case mi = "mi"

    var toMeters: Double {
        switch self {
        case .m: return 1
        case .km: return 1000
        case .ft: return 0.3048
        case .yd: return 0.9144
        case .mi: return 1609.34
        }
    }
}
```

## Conversion uses one clean formula:
```
let meters = inputValue * inputUnit.toMeters
let result = meters / outputUnit.toMeters
```

- No long switch statements.
- No repeated logic.
- Easy to add more units anytime.

## 🌡 Temperature Conversion Logic Example
```
func convertTemperature(_ value: Double, from: TemperatureUnit, to: TemperatureUnit) -> Double {
    switch (from, to) {
    case (.celsius, .fahrenheit): return value * 9/5 + 32
    case (.fahrenheit, .celsius): return (value - 32) * 5/9
    case (.celsius, .kelvin): return value + 273.15
    case (.kelvin, .celsius): return value - 273.15
    case (.fahrenheit, .kelvin): return (value - 32) * 5/9 + 273.15
    case (.kelvin, .fahrenheit): return (value - 273.15) * 9/5 + 32
    default: return value
    }
}
```

## 📱 Screenshots

(Optional — send me your UI screenshots and I’ll format them beautifully.)

# 🛠 Requirements

- iOS 26.1+

- Xcode 26.1+

- Swift 5.10+

# 📦 Installation

## Clone the repository:

- git clone https://github.com/your-username/UnitConverter.git

- Open the project in Xcode and run.

# 🤝 Contributing

If you'd like to improve the UI, add more units, or support more categories (mass, speed, currency, etc.), feel free to open a PR.

# 📄 License

This project is open-source under the MIT License.
