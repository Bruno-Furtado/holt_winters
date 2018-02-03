<h1 align="center">
  Forecasting with Holt-Winters
</h1>
<p align="center">
  <img alt="Swift" src="https://img.shields.io/badge/swift-2.2-orange.svg" />
  <img alt="Platforms" src="https://img.shields.io/badge/platform-mac-lightgrey.svg" />
</p>

The Holt-Winters method is a popular and effective approach to forecasting seasonal time series. [Click here](https://www.otexts.org/fpp/7/5) to see more.

## Requirements

- [x] MacOS X 10.11 or later
- [x] Xcode 7 or later

## How to use

### Add a file to desktop folder

The file is a TXT with a couple of numbers separeted by `\n`. A sample file can be found in the `Resources` folder.

```txt
1,989.00 // (en format)
1.981,00 // (pt_BR format)
1999.00
1995,00
1990,50
//...
```

### Setup the initial values

```swift
// main.swift

let dataFileName = "historical_data.txt" // file created in step 1
let forecastingFileName = "forecasting.csv" // file with forecasting results
let errorsFileName = "errors.csv" // file with errors

let s: Int = 3
let alpha: Float = 0.3
let beta: Float = 0.3
let gamma: Float = 0.3
```

### Build the project

The project uses the file created in step 1 to show the forecasting results and errors.

## Change-log

A brief summary of each app release can be found on the [releases](https://github.com/Bruno-Furtado/holt_winters/releases).

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
