# Just Movie it
Just Movie it is an app that's recommended movies from TMDB using clean architecture and Unit Tests in your creation. 

Access the web app here: [Just Movie it](https://just-movieit.web.app/)


# Powered by *FLutter* 💙
Flutter web, with its beta flag, has already amazing performance and fewer bugs every day. With a bit of effort, this project searches and solves platform problems to have a delightful user experience.

# Powered by *Firebase Hosting* 🧡 with *Github Actions* 🖤
The web page is hosted by Firebase Hosting and the updates occur through the CD of Github Actions with **main** branch.

## Functionalities:
- [x] The user can view a list of the recommended movies.
- [x] The user can view an overview of the selected movie.
- [ ] The user can sign in to the app 
- [ ] The user can sign up on the app
- [ ] The user can sign in as an anonymous
- [ ] The user can save movies in a favorite list

## Architecture:
The app was created from zero following the Clean Architecture for it to be a maintainable project. The app is divided into 4 layers which have unique functionality.
- **Domain:** It's the heart of the application. In this layer, are the Business Rule which has the smallest possible coupling of libs.
- **Infra:**  In this layer, implemented the domain contracts and created the contracts which been implemented by the External layer. At the same time is in that layer which the exceptions are handled.
- **External:** In this layer, are the world external access, in this case, the TMDB API access.
- **Presenter:** In here are the pages, state management, and widgets of the application.

## Main Libraries:
- [Get_it](https://pub.dev/packages/get_it) - For the Dependency Injection of the project
- [GetX](https://pub.dev/packages/get) - For the State Management and Route Management of the project
- [DartZ](https://pub.dev/packages/dartz) - For Functional Programming
- [Mocktail](https://pub.dev/packages/mocktail) - For the unity tests
- [Responsive Builder](https://pub.dev/packages/responsive_builder) - To create a responsive UI

#### That app uses Firebase Hosting for the fast deployment and  Continuous Integration as a Single-Page web app.
