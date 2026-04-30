# my_domotic_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dossier	            Rôle
    pages	            Les écrans de l’application
    widgets	            Composants réutilisables
    models	            Modèles de données
    services	        Services IoT/API/auth
    database	        Gestion PostgreSQL
    theme	            Couleurs/thème
    navigation	        Barre de navigation

## Structure du projet
    lib/
    ├── main.dart
    ├── pages/
    ├── widgets/
    ├── models/
    ├── services/
    ├── database/
    ├── theme/
    └── navigation/

## Page	                Fonction
    Accueil	            Vue globale des appareils
    Appairage	        Ajouter un appareil
    Appareils	        Liste + gestion
    Profil	            Connexion / utilisateur

## BLoC
    UI	                Logique
    Widgets Flutter	    Gestion métier
    Boutons	            États
    Affichage	        Événements
    Navigation	        Données

### L’idée est : UI → Event → BLoC → State → UI

### Exemple : 
    Utilisateur clique sur ON
            ↓
    DeviceToggleEvent
            ↓
    DeviceBloc
            ↓
    Nouvel état des appareils
            ↓
    UI reconstruite automatiquement

### Evolution de l'arborescence avec BLoC 

    lib/                     
    ├── blocs/ 
    │   ├── device/
    │   │   ├── device_bloc.dart
    │   │   ├── device_event.dart
    │   │   └── device_state.dart
    │   ├── auth/
    │   └── pairing/
    ├── models/
    ├── pages/
    ├── repositories/
    ├── services/
    ├── widgets/
    ├── database/
    └── main.dart

## Package	        Rôle
flutter_bloc	    Intégration Flutter
bloc	            Moteur BLoC
equatable	        Comparaison propre des états

## Ce que fat=it BLoC 
LoadDevicesEvent -> création d'appareils simulés -> DeviceLoaded

### Lors d'un toggle 
ToggleDeviceEvent -> mise à jour d’un appareil -> nouvel état DeviceLoaded -> UI reconstruite automatiquement

