# Top Brokers Flutter App

A professional Flutter application that displays a list of financial brokers with detailed information and navigation capabilities.

## Features

-   **Broker Listing**: Browse through a comprehensive list of financial brokers
-   **Detailed Information**: View detailed broker information including regulations, account options, and descriptions
-   **Search Functionality**: Search brokers by name, country, regulation, or other criteria
-   **Offline Support**: Graceful handling of network connectivity issues
-   **Responsive Design**: Optimized for both phones and tablets
-   **Professional UI**: Clean, modern interface with loading states and error handling

## Architecture

This project follows **MVVM (Model-View-ViewModel)** architecture with:

-   **Riverpod** for state management with code generation
-   **Freezed** for immutable data classes
-   **Go Router** for navigation
-   **Dio** for network requests
-   Clean separation between business logic and UI

## Tech Stack

-   **Flutter SDK**: 3.9.0+
-   **State Management**: Riverpod with code generation
-   **Navigation**: Go Router
-   **HTTP Client**: Dio
-   **Data Classes**: Freezed
-   **UI Components**: Shimmer loading effects
-   **Connectivity**: Connectivity Plus

## Getting Started

### Prerequisites

-   Flutter SDK (3.9.0 or higher)
-   Dart SDK
-   Android Studio / VS Code
-   iOS development tools (for iOS deployment)

### Installation

1.  **Clone/Fork the repository**

    ```bash
    git clone https://github.com/yinonh/top_brokers
    cd top_brokers
    
    ```

2.  **Install dependencies**

    ```bash
    flutter pub get
    
    ```

3.  **Generate code (Important!)**

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    
    ```

    _Note: This step is crucial as the project uses code generation for Riverpod providers and Freezed classes._

4.  **Run the application**

    ```bash
    flutter run
    
    ```

## License

This project is licensed under the MIT License - see the LICENSE file for details.