# AMtime

AMtime is a Swift-based iOS application designed to provide users with a seamless movie ticket purchasing simulation experience. This project is based on the assignment requirement from University of Technology Sydney 42889 iOS Development Assignment 3 in 2024 Autumn semester.

The application is built with Swift 5.0 and is compatible with iPhone.

- [AMtime](#amtime)
  - [Features](#features)
    - [Future potential iterative features](#future-potential-iterative-features)
  - [Getting Started](#getting-started)
  - [Requirement](#requirement)
  - [Dependencies](#dependencies)
  - [API Usage](#api-usage)
    - [Environment Variables Setup](#environment-variables-setup)
  - [Contributing](#contributing)
  - [Acknowledgement](#acknowledgement)
  - [Contact](#contact)
  - [License](#license)

## Features

- **Movie Browsing**: Using 3rd party API [TMDB](https://www.themoviedb.org) to fetch the real movie data to create a customer view as simulating the real cinema movie display
- **Seats Selection**: Made a preset seats layout to simulate the seats selection process and ticket purchasing
- **Ticket Display**: Display the purchased the ticket with a simulated shape on the screen to provide visual experience to the user
- **Simulated Payment**: A simulated payment page is included in order to provide a complete user flow.

### Future potential iterative features

> - **User Profile**: Portal to keep all the user record including registration, login, transaction history, ticket record etc.
> - **Payment Gateway Integration**: Integrate industry standard payment gateway to enable the real payment function
> - **Content Management Backend**: A fully customisable portal for non-IT admin to maintain the content in the app based on cinema operation such as screens, movies, ticket price etc.
> - **Select Venue**: Enable the option to let user select movie theatre

## Getting Started

To get started with the project, clone the repository using either GitHub portal or git command as below:

```sh
gh clone https://github.com/john8862/AMtime.git
```

and open the `AMtime.xcodeproj` file in Xcode.

## Requirement

* iOS 17+
* SwiftUI 5.0+

## Dependencies

- [Kingfisher](https://github.com/onevcat/Kingfisher.git): The project uses the Kingfisher library for downloading and caching images from the web.

When you fetched the project to your local storage the dependency should be set automatically.

## API Usage

This app is using the API provided by [TMDB](https://wwww.themoviedb.org) to fetch real movie attributes such name, release date, production company, duration etc. Please refer to `URLExt` help for more detail setup.

This repo doesn't include any API keys. You'll need to register an account at [TMDB Sign Up](https://www.themoviedb.org/signup) and request your own key. The API key and baseURL is set as environment variables in Xcode locally to protect the sensitive information and easy to extend for different environemnt such development, staging, production. Please refer to below secion on how to set the variable to enable the view of data.

### Environment Variables Setup

Below variables need to be set in Xcode locally to enable the data fetching from TMDB:

- `API_KEY`: The value should be your own API key requested from 
[TMDB](https://wwww.themoviedb.org)
- `API_BASE_URL`: https://api.themoviedb.org/3/movie
- `API_BASE_IMAGE_URL`: https://image.tmdb.org/t/p/

**Setup Steps**:
  1. Open the project in Xcode
  2. Click `Product` in menu bar
  3. Navigate to `Scheme` -> `Edit Scheme`
  4. In the pop up window select `RUN` at the left panel
  5. Add above mentioned name and value in `Environment Variables` section by click `+` button
  6. Uncheck `Shared` box to ensure your key won't be tracked by any version control method to avoid expose your key on GitHub or other source code platform.
  7. Click `Close` and the variables will be saved to the environment

Please be aware that if you recreate your local repo, the above setup needs to be done again as they won't be saved to your remote repo.

## Contributing

Contributions are welcome. Please open a pull request with your changes.

## Acknowledgement

We would like to express our gratitude to the following:

- [TMDB](https://www.themoviedb.org/): For providing the API that allows us to fetch movie data.
- [Kingfisher](https://github.com/onevcat/Kingfisher): For providing a powerful, pure-Swift library for downloading and caching images from the web.
- All the contributors who have spent their valuable time improving this project.

**Special Thanks to Team Member**

- [yilinzhao10](https://github.com/yilinzhao10)
- [scel665](https://github.com/scel665)

For their dedicated support during the development, especially on the prototyping phase. Without their creativities and effort on the UI design we can't achieve here.

## Contact

For any questions or concerns, please open an issue on this repository. Can't guarantee the turn around time considering this is a university assignment project. But will check it from time to time and get back to all the queries as much as we can.

## License

This project is licensed under the terms of the MIT license. Please refer to the LICENSE file for more detail.