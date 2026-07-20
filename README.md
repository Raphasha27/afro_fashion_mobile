<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:0d1117,100:00ffcc&height=200&section=header&text=Afro%20Fashion%20Mobile&fontSize=50&fontColor=ffffff&fontAlignY=40&desc=Premium%20Mobile%20Commerce%20for%20the%20African%20Digital%20Economy&descAlignY=65" width="100%"/>

  [![Status](https://img.shields.io/badge/Status-Active-00ffcc?style=for-the-badge)](#)
  [![Framework](https://img.shields.io/badge/Framework-Flutter-02569B?style=for-the-badge&logo=flutter)](#)
  [![Backend](https://img.shields.io/badge/Backend-Firebase-FFCA28?style=for-the-badge&logo=firebase)](#)
</div>

## 🌍 Overview

[![Security](https://img.shields.io/badge/Security-Policy-1f6feb?style=for-the-badge&logo=github)](SECURITY.md)
Welcome to the official repository for **Afro Fashion Mobile**. 
This is a premium mobile fashion hub built specifically for the African digital economy. It features high-fidelity asset showcasing, seamless cross-platform performance, and an intuitive user experience.

---

## 📐 System Architecture Demo

Our mobile commerce platform is built on a high-performance Flutter frontend tightly integrated with a serverless backend for real-time inventory and seamless checkout flows.

```mermaid
graph TD
    %% Styling
    classDef frontend fill:#02569B,stroke:#fff,stroke-width:2px,color:#fff
    classDef backend fill:#050d12,stroke:#00ffcc,stroke-width:2px,color:#fff
    classDef external fill:#111,stroke:#b39ddb,stroke-width:1px,color:#fff

    %% Nodes
    App["Flutter Mobile App<br>iOS & Android"]:::frontend
    
    Auth["Authentication<br>Firebase Auth"]:::backend
    DB["(Firestore<br>Product Catalog)"]:::backend
    Storage["(Cloud Storage<br>High-Res Assets)"]:::backend
    
    Payment["Payment Gateway<br>Paystack / Stripe"]:::external

    %% Relationships
    App -->|Login / OTP| Auth
    App -->|Query Inventory| DB
    App -->|Fetch Images| Storage
    App -->|Process Checkout| Payment
```

### 🛍️ Mobile Flow Demonstration
1. **Discovery:** The Flutter app fetches high-fidelity images from Cloud Storage and product metadata from Firestore in real-time.
2. **Engagement:** State management handles user favorites, cart sessions, and personalized sizing recommendations.
3. **Checkout:** Secure tokenization connects the cart to regional payment gateways (e.g., Paystack) for localized African currency processing.

---

## ⚡ Key Architectural Features
- **High-Performance UI:** Built with Flutter for smooth 60fps animations and native performance.
- **Real-Time Database:** Utilizes Firestore for instantaneous inventory updates.
- **Sovereign Infrastructure Ready:** Fully abstracted data layer, currently migrating to the Kirov Dynamics cloud ecosystem.
- **Responsive & Accessible:** Scales beautifully across different mobile screen sizes and accessibility settings.

## 🛠️ Local Development Setup

To run this project locally on your emulator or physical device:

```bash
git clone https://github.com/Raphasha27/afro_fashion_mobile.git
cd afro_fashion_mobile

# Install Flutter dependencies
flutter pub get

# Run the app
flutter run
```

## 🗺️ Roadmap
- [x] Clear dead links and optimize asset loading.
- [x] Upgrade documentation with System Architecture Diagrams.
- [ ] Migrate CI/CD to local GitHub Actions for automated IPA/APK builds.
- [ ] Implement AI-driven fashion recommendations.

<br/>
## Product Ladder

```
GitHub (this repo)
    ↓
Portfolio → https://raphasha27.github.io/raphasha-dev-portfolio
    ↓
Case Study → https://github.com/Raphasha27/afro_fashion_mobile/blob/main/CASE_STUDY.md
    ↓
Live Demo → https://github.com/Raphasha27/afro_fashion_mobile
    ↓
Contact → https://github.com/Raphasha27
```

Part of the [Kirov Dynamics](https://github.com/Raphasha27/kirov-dynamics) ecosystem.

**Built by Koketso Raphasha — Practical AI for Africa**

## License

MIT