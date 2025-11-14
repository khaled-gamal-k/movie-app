# 🎬 CINEMAX

A modern Flutter movie browsing app built with **Clean Architecture**, **Cubit**, and **TMDB API**.
Explore Popular & Upcoming movies, watch trailers, view production information, and enjoy a polished cinematic experience.

---

## ⭐ Features

* 🟦 Beautiful **Onboarding Screens**
* 🎬 Browse **Popular / Recommendations / Upcoming** movies
* 🔍 **Search** with instant results
* 📄 **Movie Details Page** (overview, rating, recommendations, production)
* 🎞 Watch **Trailers** (youtube_player_flutter)
* ✨ **Shimmer** loading effects
* 📱 Fully **Responsive UI** (ScreenUtil)
* 🧭 Navigation using **GoRouter**
* 🧱 Clean Architecture + MVVM + Cubit
* 🌙 Full **Dark Mode** UI
* ⚡ Fast with **cached_network_image**

---

## 📸 Screenshots


| Onboarding                      | Home                      | Details                      | Trailer                      |
| ------------------------------- | ------------------------- | ---------------------------- | ---------------------------- |
| ![](screenshots/onboarding.png) | ![](screenshots/home.png) | ![](screenshots/details.png) | ![](screenshots/trailer.png) |

---

## 🧰 Tech Stack

```
retrofit
freezed
json_serializable
go_router
dio
flutter_bloc
get_it
shared_preferences
cached_network_image
flutter_screenutil
flutter_dotenv
google_fonts
smooth_page_indicator
carousel_slider
youtube_player_flutter
dartz
shimmer
```

---

## 🏛 Architecture (Clean Architecture + MVVM + Cubit)

```
lib/
 ├── core/
 │   ├── extensions/
 │   ├── network/
 │   ├── routers/
 │   ├── services/
 │   ├── shared/
 │   ├── themes/
 │   └── utils/
 └── features/
     ├── onboarding/
     ├── movie/
     |   ├── data/
     |   │   ├── models/
     |   │   └── repos/
     |   ├── domain/
     |   │   ├── repos/
     |   │   └── usecases/
     |   ├── presentation/
     |   │   ├── cubit/
     |   │   ├── views/
     |   │   └── widgets/
     ├── movie_details/
```

---

## 🌐 API

This app uses the **TMDB API** for fetching all movie data.
Docs: [TMDB API LINK](https://developer.themoviedb.org/)

---

## 🧰 Example Retrofit API Service

```dart
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET(Endpoints.upcomingMovies)
  Future<BaseResponse<List<MoviesModel>>> getUpcomingMovies(
    @Queries() Map<String, dynamic> queries,
  );
}
```

---

## 🧪 Example Cubit

```dart
class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.movieRepo) : super(const MovieState.initial());
  final MovieRepo movieRepo;

  void getUpcomingMovies() async {
    emit(const MovieState.loading());
    final result = await movieRepo.getUpcomingMovies();
    result.fold(
      (l) => emit(MovieState.error(l.message)),
      (r) => emit(MovieState.getUpcomingMovies(r)),
    );
  }
}
```

---

## ✨ UI Highlights

* Netflix-inspired dark design
* Clean typography (GoogleFonts)
* SmoothPageIndicator for onboarding
* Carousel for upcoming movies
* Shimmer placeholders

---

## ❤️ Support

If you like this project, please ⭐ the repository!
