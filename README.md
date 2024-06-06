# SwiftUI MVVM ListView with CoreData

This project is a demonstration of using SwiftUI with the MVVM (Model-View-ViewModel) architecture pattern to fetch data from an API, store it in CoreData, and display it in a ListView.

## Features

- Fetch data from an API.
- Store data in CoreData.
- Display data in a SwiftUI ListView.
- Implement MVVM architecture for better code separation and testability.

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+

## Installation

1. Clone the repository:

   - https://github.com/DixPatel009/ListView.git

3. Open the project in Xcode:

    - open ListView.xcodeproj

3. Build and run the project on your preferred simulator or device.

## Architecture

The project follows the MVVM architecture pattern:

  - Model: Represents the data and business logic. This includes CoreData entities and API data models.
  
  - View: SwiftUI views that display the data.
  
  - ViewModel: Manages the data for a view by interacting with the model and preparing the data for presentation in the view.

## Project Structure

    ListView/
    ├── ListViewApp.swift  # Entry point of the app
    ├── Models/
    │   ├── DocsResponse.swift               # Data model for items fetched from the API
    │   ├── LocalListModel.swift             # Data model for items fetched from the Coredata
    ├── Views/
    │   ├── ListView.swift                   # Main view displaying the list
    │   └── ListRow.swift                    # Subview for displaying individual items
    ├── ViewModels/
    │   └── ListViewModel.swift              # ViewModel for managing item data
    ├── Services/
    │   └── APIService.swift                 # Service for making API calls
    └── Persistence/
        └── CoreDataManager.swift            # CoreData stack and helper methods
        └── ListView.xcdatamodeld/           # CoreData model

## Acknowledgements

  - SwiftUI Documentation
  - CoreData Documentation
  - MVVM Architecture Patterns

## Contact

  - For any questions or suggestions, please open an issue or contact akabaridixit009@gmail.com
