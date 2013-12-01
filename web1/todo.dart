/*

  v1 : jQuery style

*/

library todo;

import 'dart:html';

UlElement todosList ;
InputElement newInput ;

void main() {
  
  todosList = query("#list") ;
  
  newInput = query("#new") ;
  newInput.onChange.listen(add) ;

}

void add(Event e){
  
  LIElement newTodo = new LIElement() ;
  ButtonElement removeButton = new ButtonElement() ;

  removeButton
    ..text = 'remove'
    ..onClick.listen( (Event e)=>newTodo.remove() ) ;

  newTodo
    ..text = newInput.value
    ..children.add( removeButton ) ;

  newInput.value = '' ;
  todosList.children.add( newTodo ) ;
}
