# Agrivysor Ryzen 🌾

Agrivysor Ryzen is an advanced agricultural diagnostic tool built with Flutter. It leverages machine learning to identify diseases and pests in various crops, providing farmers and enthusiasts with instant insights and actionable recommendations.

## 🚀 Features

- **Real-time Crop Diagnosis**: High-performance image classification using MobileNetV3.
- **Comprehensive Support**: Identifies 32 distinct conditions across 5 major crop types.
- **AI-Powered Insights**: Integrated with Google Gemini (Generative AI) to provide detailed treatment plans and agricultural advice.
- **Modern UI/UX**: Features a sleek, responsive design with liquid glass effects and intuitive navigation.
- **Camera & Gallery Integration**: Capture photos directly or upload from your device for analysis.

## 🧠 Machine Learning

The core of Agrivysor Ryzen is a custom-trained **MobileNetV3** model (`plantmodel_MNv3.tflite`). This lightweight yet powerful architecture is optimized for mobile performance, ensuring quick and accurate predictions.

### Supported Classes (32)

The model is trained to recognize the following categories:

| Crop | Conditions |
| :--- | :--- |
| **Banana** | Cordana, Healthy, Insect Pest, Dry Leaf, Mosaic, Panama, Yellow Sigatoka |
| **Coconut** | Bud Root Dropping, Bud Rot, Caterpillar Spot, Fruit Healthy, Fruit Infected, Gray Leaf Spot, Leaf Rot, Stem Bleeding |
| **Corn** | Cercospora Leaf Spot, Common Rust, Healthy, Northern Leaf Blight |
| **Pineapple** | Crown Rot, Fruit Fasciation, Fruit Rot, Healthy, Wilt, Multiple Crown, Root Rot |
| **Sugarcane** | Healthy, Mosaic, Red Rot, Rust, Yellow Leaf |
| **Other** | Unknown |

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **ML Engine**: [LiteRT (TensorFlow Lite)](https://www.tensorflow.org/lite) via `flutter_litert`
- **Generative AI**: [Google Generative AI (Gemini)](https://ai.google.dev/)
- **Camera**: `camerawesome`
- **Data Visualization**: `fl_chart`
- **UI Components**: `liquid_glass_renderer`, `tab_container`, `timeline_tile`

## 📦 Getting Started

### Prerequisites

- Flutter SDK: `^3.11.5`
- A Google Gemini API Key (for AI recommendations)

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/agrivysor_ryzen.git
    cd agrivysor_ryzen
    ```

2.  **Environment Setup**:
    Create a `.env` file in the root directory and add your Gemini API key:
    ```env
    GEMINI_API_KEY=your_api_key_here
    ```

3.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

4.  **Run the app**:
    ```bash
    flutter run
    ```

## 📖 Usage

1.  Open the app and grant camera permissions.
2.  Point the camera at a plant leaf or fruit, or upload an image from the gallery.
3.  The app will display the detected condition and confidence level.
4.  Tap on the result to generate a detailed AI analysis and treatment recommendation.

---

## 👥 The Team

This project was brought to life by a dedicated team aiming to innovate local agriculture:

- **Kristina Pearl Makalwa** – Project Adviser
- **Marc Joseph Mian** – Researcher
- **Robert Stephen Labuan** – Researcher
- **Skye Adrielle Lapot** – Researcher
- **Klent Czarwen Tangaro** – UI/UX Designer & Lead Developer

## ❤️ Acknowledgements

Made with love for the farmers. AgriVysor 2026.
