# 📱 Flutter REST API Learning Project

This project is a **Flutter-based learning app** that demonstrates how to work with **REST APIs** using the `http` package. It covers fetching data, authentication, and file uploads with proper error handling and JSON parsing.

---

## 🚀 Features

- ✅ Fetch **Posts**, **Photos**, and **Users** from [JSONPlaceholder](https://jsonplaceholder.typicode.com)  
- ✅ Fetch **Shop Data** from a custom Webhook API  
- ✅ Handle **User Login** via `POST` request (`dummyjson` API)  
- ✅ Upload files using **Multipart Request** (`escuelajs` API)  
- ✅ Error handling and success/error **SnackBar messages**  
- ✅ Well-structured models for JSON parsing  

---

## ⚡ API Endpoints Used

| Feature       | Method | Endpoint                                                    |
|---------------|--------|-------------------------------------------------------------|
| Get Posts     | GET    | [https://jsonplaceholder.typicode.com/posts](https://jsonplaceholder.typicode.com/posts)   |
| Get Photos    | GET    | [https://jsonplaceholder.typicode.com/photos](https://jsonplaceholder.typicode.com/photos) |
| Get Users     | GET    | [https://jsonplaceholder.typicode.com/users](https://jsonplaceholder.typicode.com/users)   |
| Get Shop Data | GET    | [Custom Webhook.site Endpoint](https://webhook.site)        |
| User Login    | POST   | [https://dummyjson.com/auth/login](https://dummyjson.com/auth/login) |
| File Upload   | POST   | [https://api.escuelajs.co/api/v1/files/upload](https://api.escuelajs.co/api/v1/files/upload) |

---

##  Tech Stack 🛠️

- **Flutter** – Cross-platform UI toolkit.  
- **Dart** – Programming language for Flutter.  
- **VS Code / Android Studio** – IDEs.  
- **Git** – Version control.  

---

## 📦 Dependencies 

This project uses the following dependencies:
- [`http`](https://pub.dev/packages/http) – Make HTTP requests (GET, POST, Multipart) and handle REST APIs.  
- [`image_picker`](https://pub.dev/packages/image_picker) – Select images from gallery or camera.  

---
## Setup Instructions ⚙️

### Clone and Run
```bash
git clone https://github.com/muhammadXainAhmad/rest_api_flutter
cd rest_api_flutter
flutter pub get
flutter run
```

---

## License 📄
This project is licensed under the [MIT License](LICENSE).