Dart
====

I. Presentation

Dart is an open-source Web programming language developed by Google. It was unveiled at the GOTO conference in Aarhus, 2011 October 10–12.[3] The goal of Dart is "ultimately to replace JavaScript as the lingua franca of web development on the open web platform" wikipedia

Sur le language :

    The Dart VM reads and executes source code, which means there is no compile step between edit and run.
    
    Dart is optionally typed
    Type annotations are great for the “surface area” of the code (such as method and function signatures), and the tools are getting good enough for you to consider using var inside methods and functions.
    
    imports in the global namespace by default : better use 'import "dart:html" as html'
    
    "library ballgame;
    
        part 'ball.dart';
        part 'util.dart';
    
        // ...Code might go here...
    
        The second file, ball.dart implements part of the ballgame library:
    
        part of ballgame;
        "
    
    Dart supports collection literals
    
    futures/promises & streams
    
    Dart is purely object oriented. Even calling + on two numbers is modeled as a method call. Numbers, booleans, and even null are all objects.
    Not dogmatic : Dart supports top-level functions and variables
    Dart lets you put any number of public classes into a file
    
    All Dart programs start at the main() function.
    
    anonymous functions : (int y) => x + y;
    functions can be passed as parameters or returned
    
    Dart has operator overriding ex :  Point operator +(Point other) => new Point(x+other.x, y+other.y);
    
    Dart has string interpolation : '$x' calls x.toString()


Exemples de librairies :

    *dart:io
        File, socket, HTTP, and other I/O support for server applications.

    *dart:html
        HTML elements and other resources for web-based applications that need to interact with the browser and the DOM (Document Object Model).
        ~ jQuery
    Et plein d'autres...

    ___________________________________________________________________

II. Environnement

Le sdk dart comprend :

* Une VM dart :

        dart --help

* Un compilateur dart -> js :

        dart2js --help

* Un gestionnaire de packages

        pub --help

Sont également mis à disposition :

* Un IDE

        dart-editor

* Un navigateur web avec la VM dart integrée

        dartium (basé sur chromium)

Et bien sûr :

        https://api.dartlang.org/docs/channels/stable/latest/index.html

/!\ Dart est encore un projet jeune, et à ce titre évolue beaucoup. De nombreux exemples sur le net (y compris sur d'autres pages du site dartlang !) peuvent ne pas être à jour et ne plus fonctionner. En cas de doutes, reportez vous toujours à cette documentation.


Organisation d'un projet :

    Sources :
       *  myApp
            ├── pubspec.yaml
            ├── README.md
            ├── myServer.dart
            └── web
                ├── myApp.css
                ├── myApp.dart
                └── myApp.html
    
    En fonctionnement :
       *  myApp
            ├── build
            │   ├── packages
            │   │   └── browser
            │   │       ├── dart.js
            │   │       └── interop.js
            │   ├── myApp.css
            │   ├── myApp.dart.js
            │   └── myApp.html
            ├── packages
            │   └── browser -> /home/centime/.pub-cache/hosted/pub.dartlang.org/browser-0.9.0/lib
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
        Dartium intègre la VM dart, mais c'est aujourd'hui le seul. Tout le code .dart qui doit s'executer chez le client est alors compilé vers du .js .

 _________________________________________________________

III. Client-side

 _________________________________________________________

IV. Server-side

 _________________________________________________________

V. Full 

VI.Concl :

"But how will Dart win? I can talk all day about the language and its pros and cons, but this is probably how it'll play out. Once Chrome is the dominant browser (already is in many parts of the world), Dart is available in stable Chrome (soon) and important apps like Gmail, etc. use it and demonstrate major performance improvements (especially on mobile devices), many others will jump on board. Plus with a quiet achiever like Lars Bak (who brought the world the Java Hotspot VM and V8), I think their chances are very good indeed over the next few years."
https://gist.github.com/khoomeister/4976475

VII. Refs :
http://programming.oreilly.com/2013/05/dart-is-not-the-language-you-think-it-is.html
https://gist.github.com/khoomeister/4976475