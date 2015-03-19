class EventQueue {
  EventNode top;
  int length;
  int buffer;
  boolean isAdding;
  
  EventQueue() {
    top = null;
    length = 0;
    buffer = 0;
    
    isAdding = false;
  }

  EventQueue(EventNode node) {
    top = node;
    length = 1;
    buffer = 0;
    
    isAdding = false;
  }

  void render() {
    int lines = 0;
    EventNode current = top;
    
    if(current == null){
      return;
    }
        
    textSize(15);
    while(current.getTail () != null) {
      current.render(55 + lines * 20 + buffer);
      //text(current.main.description, 15, 55, 270, 40);
      lines += current.linenum;
      current = current.getTail();
    }
    
    text(lines, 280, 150);
  }

  void update() {
    int lines = 0;
    EventNode current = top;
    /*
    if(isAdding){
      buffer += 5;
      println(buffer);
      if(buffer >= toAdd.peekNode().linenum * 20){
        println("test");
        addNode(toAdd.popNode());
        buffer = 0;
      }
      
    }
    */
    if(current == null)
      return;
    
    while(current.getTail () != null) {
      lines += current.linenum;
      current.update();

      current = current.getTail();
    }

    if (lines > 3){
      removeNode();
    }
  }
  /*
  void queueEvent(Event event){
    if(!isAdding){
      isAdding = true;
      toAdd.addEvent(event);
    }
    else{
      buffer += 10;
      toAdd.addEvent(event);
    }
  }
  */
  void addEvent(Event event) {
    EventNode current = top;
    if(top == null){
      top = new EventNode(current, event, null);
      return;
    }
    
    EventNode e = new EventNode(null, event, top);
    top.head = e;
    top = e;
    
    length ++;
    /*
    while(current.getTail() != null) {
      current = current.getTail();
    }
    
    current.addTail(new EventNode(current, event, null));
    */
  }
  
  void addNode(EventNode node){
    length ++;
    
    if(top == null){
      node = top;
      return;
    }
    
    node.tail = top;
    top.head = node;
    node = top;
  }
  
  EventNode popNode(){
    EventNode current = top;
    
    if(current == null){
      length = 0;
      return null;
    }
    
    if(length == 1){
      return top;
    }
    
    while(current.getTail() != null) {
      current = current.getTail();
    }
    
    EventNode temp = current;
    return temp;
  }
  
  void removeNode() {    
    EventNode current = top;
    
    if(current == null){
      length = 0;
      return;
    }
    
    if(length == 1){
      top = null;
      length = 0;
      return;
    }
    
    while(current.getTail() != null) {
      current = current.getTail();
    }
    
    length --;
    
    current = current.getHead();
    current.tail = null;
    
  }
  
  EventNode peekNode(){
    EventNode current = top;
    
    if(current == null){
      length = 0;
      return null;
    }
    
    if(length == 1){
      return top;
    }
    
    while(current.getTail() != null) {
      current = current.getTail();
    }
        
    return current;
  }
  
}
