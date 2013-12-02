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

    query("#load").onClick.listen( (e){
            todosCollection.load() ;
    });
    
    query("#save").onClick.listen( (e){
            todosCollection.save() ;
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

    void save(){
        var toSave = [];
        todos.forEach((t){
            toSave.add(t.task);
        });

        new HttpRequest()
            ..open('POST', '/save/')
            ..send(json.stringify(toSave));
    }

    void load(){
        HttpRequest.getString('/load/')
            .then((String fileContents){
              update(json.parse(fileContents));
            });
    }

    void update(List<String> newTodos){
        todos.forEach( (t){
            t.container.remove();
        });
        todos.clear();
        newTodos.forEach( (nt){
            add( nt );
        });
    }
}

class Todo {
    Element container ;
    String task ;

    Todo(this.task, List<Todo> todos){
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