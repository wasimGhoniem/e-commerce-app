# 🛍️ Online Store

A modern, feature-rich e-commerce mobile application built with Flutter, showcasing best practices in mobile app development and clean architecture.

![App Banner](![2025-06-09 20_46_05-Greenshot](https://github.com/user-attachments/assets/b80bf920-737d-4cb1-ac4e-6d77d0233bd1)
)

## 📱 Features

### 🏠 Home Screen
- Featured products showcase
- Category browsing
- Brand showcase
- Announcements and promotions

### 🔍 Search & Discovery
- Advanced product search
- Filter by name and price
- Real-time search results
- Smart product recommendations

### 🛒 Shopping Cart
- Add/remove items
- Quantity management
- Real-time price updates
- Persistent cart state

### ❤️ Wishlist
- Save favorite products
- Quick add to cart
- Wishlist management

### 👤 User Authentication
- Secure login/registration
- Profile management
- Session persistence

### 🌐 Localization
- Arabic and English support
- RTL layout support
- Culturally adapted UI

## 🛠️ Technology Stack

- **Framework**: Flutter 3.19.0
- **Language**: Dart 3.3.0
- **State Management**: Flutter BLoC
- **Dependency Injection**: Injectable
- **Architecture**: Clean Architecture
- **Localization**: Flutter Localization
- **UI Components**: Material Design 3
- **Responsive Design**: Flutter ScreenUtil

## 📦 Project Structure

```
lib/
├── core/
│   ├── error/
│   ├── services/
│   └── utils/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── use_cases/
├── features/
│   ├── ui/
│   │   ├── auth/
│   │   ├── pages/
│   │   └── widgets/
│   └── data/
└── l10n/
    └── localization/
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.19.0 or higher)
- Dart SDK (3.3.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/wasimGhoniem/online-store.git
```

2. Navigate to project directory:
```bash
cd online-store
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## 📸 Screenshots

### 🔐 Authentication Screens
Secure user authentication with bilingual support

| **Sign Up** | **Login** |
|:---:|:---:|
| ![Sign Up Screen](https://github.com/user-attachments/assets/09951827-aafe-43a3-b9b4-2992a885b279) | ![Login Screen](https://github.com/user-attachments/assets/bc118b69-2c7c-4b6e-b59c-74bc806c5c42) |

---

### 🏠 Home & Core Features
Main application interface with featured products and navigation

| **Home Screen** | **Search & Discovery** | **Product Details** |
|:---:|:---:|:---:|
| ![Home Screen](https://github.com/user-attachments/assets/12535e9c-6e4a-41f3-8630-deb82014953e) | ![Search Screen](https://github.com/user-attachments/assets/7542ffae-e951-4001-8681-bafee9bd95eb) | ![Product Details](https://github.com/user-attachments/assets/69a8aab4-da84-4245-bc7a-de9f0c05689e) |
| Browse featured products and categories | Advanced search with filters | Detailed product information and reviews |

---

### 🛒 Shopping Experience
Complete shopping cart and wishlist functionality

| **Shopping Cart** | **Wishlist** | **Profile** |
|:---:|:---:|:---:|
| ![Shopping Cart](https://github.com/user-attachments/assets/bca4cf47-28c6-46ed-807c-d0b9c8cf953e) | ![Wishlist](https://github.com/user-attachments/assets/06fa0340-0720-47e9-867b-b3bb8965a6cf) | ![User Profile](https://github.com/user-attachments/assets/66b66427-d198-4d23-8588-30518ea7736d) |
| Manage cart items and quantities | Save favorite products | User account management |

---

### 🎨 UI/UX Highlights

#### ✨ **Key Features Demonstrated:**
- **Clean Material Design 3** interface with modern aesthetics
- **Responsive layouts** optimized for mobile devices
- **Intuitive navigation** with bottom tab bar and drawer
- **Rich product displays** with high-quality images
- **Seamless user experience** across all screens
- **Consistent branding** and visual hierarchy

#### 🌟 **Design Excellence:**
- Smooth animations and transitions
- Optimized loading states
- Error handling with user-friendly messages
- Accessibility-focused design
- Cross-platform consistency

---

### 📱 App Flow Overview

```
🔐 Authentication → 🏠 Home → 🔍 Search → 📦 Product Details → 🛒 Cart → ✅ Checkout
                    ↓
                 ❤️ Wishlist ← → 👤 Profile
```

**Total Screenshots:** 8 screens showcasing complete user journey

## 🎯 Features in Detail

### Clean Architecture
- Separation of concerns
- Domain-driven design
- Repository pattern
- Use case implementation

### State Management
- BLoC pattern for predictable state management
- Event-driven architecture
- Reactive programming

### UI/UX
- Material Design 3 components
- Responsive layouts
- Custom animations
- Dark/Light theme support

### Performance
- Optimized image loading
- Efficient state management
- Lazy loading implementation
- Memory leak prevention

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Developer

**Wasim Ghonim**
- GitHub: @wasimGhoniem
- LinkedIn:[ Wasim Ghonim](https://linkedin.com/in/wasim-ghonim-37bb98333)

## 🔮 Future Roadmap

- ✅ Payment gateway integration
- ✅ Push notifications
- ✅ Social media integration
- ✅ Advanced analytics
- ✅ Offline mode support
- ✅ AR product visualization
- ✅ Voice search capability

## 📞 Contact

**Phone:** 00201030350389

For any queries or support, please reach out to:
- **Email:** [wasimghoniem@gmail.com](mailto:wasimghoniem@gmail.com)
- **LinkedIn:** [linkedin.com/in/wasim-ghonim-37bb98333](https://linkedin.com/in/wasim-ghonim-37bb98333)

---

⭐ **Star this repository if you find it helpful!**
