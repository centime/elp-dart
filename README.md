Dart
====

I. Environnement

Le sdk dart comprend :
* Un interpreteur dart 
    dart --help
* Un gestionnaire de packages
    pub --help

Sont également mis à disposition :
* Un IDE
    dart-editor
* Un navigateur web avec la VM dart integrée
    dartium (basé sur chromium)




Organisation d'un projet basique:

   *   myApp
        ├── build
        │   ├── packages
        │   │   └── browser
        │   │       ├── dart.js
        │   │       └── interop.js
        │   ├── myApp.css
        │   ├── myApp.dart.js
        │   └── myApp.html
        ├── packages
        │   └── browser -> /home/centime/.pub-cache/hosted/pub.dartlang.org/browser-0.9.0/lib
        ├── pubspec.yaml
        ├── README.md
        ├── myServer.dart
        └── web
            ├── packages -> ../packages
            ├── myApp.css
            ├── myApp.dart
            └── myApp.html

Le fichier pubspec.yaml recense l'ensemble des packages dont dépend notre projet. On pourra tous les installer en une seule commande à l'aide de pub.




 _________________________________________________________

II. Client-side

 _________________________________________________________

III. Server-side

 _________________________________________________________

IV. Full app