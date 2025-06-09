# 🛍️ Online Store

A modern, feature-rich e-commerce mobile application built with Flutter, showcasing best practices in mobile app development and clean architecture.

![App Banner](assets/images/bann![2025-06-09 20_46_05-Greenshot](https://github.com/user-attachments/assets/3b0566c6-9b6f-43cf-a0ac-91cdd967afe3)
er.png)

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

### Authentication / المصادقة
| Sign Up / التسجيل | Login / تسجيل الدخول |
|:---:|:---:|
| ![Sign Up Screen](screenshots/sig![2025-06-09 19_08_02-Greenshot](https://github.com/user-attachments/assets/09951827-aafe-43a3-b9b4-2992a885b279)
nup_en.png) | ![Login Screen](screen![2025-06-09 19_09_03-Greenshot](https://github.com/user-attachments/assets/bc118b69-2c7c-4b6e-b59c-74bc806c5c42)
shots/login_en.png) |
| ![Sign Up Arabic](screenshots/signup_ar.png) | ![Login Arabic](screenshots/login_ar.png) |

### Home & Navigation / الرئيسية والتنقل
| Home Screen / الشاشة الرئيسية | Categories / الفئات | Brands / العلامات التجارية |
|:---:|:---:|:---:|
| ![Home English](screenshot![2025-06-09 19_16_16-Greenshot](https://github.com/user-attachments/assets/12535e9c-6e4a-41f3-8630-deb82014953e)
s/home_en.png) |
| ![Home Arabic](screenshots/home_ar.png) |

### Product Discovery / اكتشاف المنتجات
| Search / البحث | Product Details / تفاصيل المنتج | Filters / المرشحات |
|:---:|:---:|:---:|
| ![Search](screenshots/se![2025-06-09 19_13_37-Greenshot](https://github.com/user-attachments/assets/7542ffae-e951-4001-8681-bafee9bd95eb)
arch_en.png) | ![Product Details](screenshots/pro![2025-06-09 19_11_11-Greenshot](https://github.com/user-attachments/assets/69a8aab4-da84-4245-bc7a-de9f0c05689e)
duct_details_en.png) | ![Filters](screenshots/filters_en.png) |
| ![Search Arabic](screenshots/search_ar.png) | ![Product Details Arabic](screenshots/product_details_ar.png) | ![Filters Arabic](screenshots/filters_ar.png) |

### Shopping Experience / تجربة التسوق
| Shopping Cart / سلة التسوق | Wishlist / المفضلة | Checkout / الدفع |
|:---:|:---:|:---:|
| ![Cart](screenshots/c![2025-06-09 19_13_17-Greenshot](https://github.com/user-attachments/assets/bca4cf47-28c6-46ed-807c-d0b9c8cf953e)
art_en.png) | ![Wishlist](screenshots/wi![2025-06-09 19_12_40-Greenshot](https://github.com/user-attachments/assets/06fa0340-0720-47e9-867b-b3bb8965a6cf)
shlist_en.png) | ![Checkout](screenshots/checkout_en.png) |
| ![Cart Arabic](screenshots/cart_ar.png) | ![Wishlist Arabic](screenshots/wishlist_ar.png) | ![Checkout Arabic](screenshots/checkout_ar.png) |

### User Profile / الملف الشخصي
| Profile / الملف الشخصي | Settings / الإعدادات | Order History / تاريخ الطلبات |
|:---:|:---:|:---:|
| ![Profile](screensho![2025-06-09 19_12_58-Greenshot](https://github.com/user-attachments/assets/66b66427-d198-4d23-8588-30518ea7736d)
ts/profile_en.png) | ![Settings](screenshots/settings_en.png) | ![Orders](screenshots/orders_en.png) |
| ![Profile Arabic](screenshots/profile_ar.png) | ![Settings Arabic](screenshots/settings_ar.png) | ![Orders Arabic](screenshots/orders_ar.png) |

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
- LinkedIn: Wasim Ghonim

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
