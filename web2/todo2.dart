library todo;

import 'dart:html';
import 'package:json/json.dart' as json ;


void main() {

    var todosCollection = new Todos( query("#list") ) ;

    var newInput = query("#new") ;
    newInput.onChange.listen( (e){
            todosCollection.add(newInput.value) ;
            newInput.value = '' ;
        });    

    var loadButton = query("#load") ;
    loadButton.onClick.listen( (e){
            todosCollection.load() ;
        });
}

class Todos {
    Element container ;
    List<Todo> todos = [];

    Todos(Element this.container){

    }

    void add( String task ){
        var todo = new Todo(task, this.todos) ;
        todos.add(todo) ;
        container.children.add(todo.render()) ;
    }

    bool save(){
        // XHR
        return false;
    }

    bool load(){
        var path = '/api/';
        HttpRequest.getString(path)
            .then((String fileContents) {
              //todos.clear();
              print(json.parse(fileContents)[0]);
              return true ;
            })
            .catchError((Error error) {
              print(error.toString());
              return false;
            });
    }

}

class Todo {
    Element container ;
    String task ;

    Todo(String task, List<Todo> todos){
        container = new LIElement() ;
        var removeButton = new ButtonElement();
        removeButton
            ..text = 'remove'
            ..onClick.listen( (e){ 
                    todos.remove(this) ;
                    container.remove() ;
                }) ;
        container
            ..text = task 
            ..children.add(removeButton);
        
    }

    Element render(){
        return container ;
    }

}