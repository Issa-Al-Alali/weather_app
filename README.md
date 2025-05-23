# Weather App

A simple Flutter weather application that displays current weather conditions using the OpenWeatherMap API with BLoC state management pattern.

## Features

- 🌤️ Current weather display
- 📍 Location-based weather (GPS)
- 🎨 Clean and intuitive UI
- 🔄 Pull-to-refresh functionality
- 📱 Responsive design

## Architecture

This app follows the **BLoC (Business Logic Component)** pattern for state management, ensuring:
- Separation of concerns
- Testable business logic
- Reactive programming with streams
- Predictable state changes

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  geolocator: ^11.0.0      # Location services
  weather: ^3.1.1          # OpenWeatherMap API wrapper
  intl: ^0.19.0           # Internationalization and date formatting
  flutter_bloc: ^8.1.4    # BLoC state management
  equatable: ^2.0.5       # Value equality for state comparison
```

## Getting Started


### Installation

1. **Clone the repository**
   ```bash
   git clone repo_url
   cd weather_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Get OpenWeatherMap API Key**
    - Visit [OpenWeatherMap](https://openweathermap.org/api)
    - Sign up for a free account
    - Generate an API key

4. **Configure API Key**

## Usage

### Running the App

```bash
flutter run
```

### Key Components

## State Management

**BLoC Pattern Implementation:**

1. **Events**: User interactions (refresh, search, location request)
2. **States**: Loading, loaded, error states
3. **BLoC**: Business logic processing
4. **UI**: Reactive updates based on state changes

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [OpenWeatherMap](https://openweathermap.org/) for weather data
- [BLoC Library](https://bloclibrary.dev/) for state management
- Flutter community for excellent packages

**API Key Issues:**
- Ensure API key is valid and active
- Check API usage limits
- Verify network connectivity

**Build Issues:**
```bash
flutter clean
flutter pub get
flutter pub deps
```

## Support

For support, email issa.al.alali@gmail.com or create an issue in the repository.

---

Made with ❤️ and Flutter