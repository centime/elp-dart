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

Organisation d'un projet :

   * myApp (sources)
        ├── pubspec.yaml
        ├── README.md
        ├── myServer.dart
        └── web
            ├── myApp.css
            ├── myApp.dart
            └── myApp.html

             
      myApp (en fonctionnement)
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

C'est ce petit outil 'pub' qui va s'occuper de nous créer et remplir les répertoires build et package:
    * package
        Rassemble toutes les dépendances.
        Pour que pub puisse le créer, il faut lui fournir un fichier pubspec.yaml qui liste toutes ces dépendances.
    * build
        Dartium possède une implémentation de la VM dart, mais c'est aujourd'hui le seul. Tout le code .dart qui doit s'executer chez le client est alors compilé vers du .js .





 _________________________________________________________

II. Client-side

 _________________________________________________________

III. Server-side

 _________________________________________________________

IV. Full app