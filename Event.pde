class Event {
  String description;
  float time;
  boolean shown;

  int lines;

  Event() {
    shown = false;
    time = 2015.0;
    description = "you dun goofed";
  }

  Event(float time, String message) {
    this.time = time;
    this.description = message;

    //println("Test test test! Testity test test! This is a multi-line test !".length());
  }
  
}

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
    /*
    fill(240);
    rect(15, 55, 270, 80);
    fill(0);
    textSize(15);
    text("A234567890123456789012345678", 15, 55, 270, 19);
    text("A234567890123456789012345678", 15, 75, 270, 19);
    */
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
    
    if(isAdding){
      buffer += 5;
    }
    
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
  
  void queueEvent(Event event){
    isAdding = true;
  }

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
}

class EventNode {
  EventNode head;
  Event main;
  EventNode tail;

  int previous;
  int linenum;
  ArrayList<String> texts;

  EventNode() {
    println("wut");
    texts = new ArrayList();
    doTheLineThingIGuess();
    previous = millis();
  }

  EventNode(Event main) {
    head = null;
    this.main = main;
    tail = null;
    texts = new ArrayList();
    doTheLineThingIGuess();
    previous = millis();
  }

  EventNode(EventNode head, Event main, EventNode tail) {
    this.head = head;
    this.main = main;
    this.tail = tail;
    texts = new ArrayList();
    previous = millis();
    doTheLineThingIGuess();
  }
  
  
  void doTheLineThingIGuess(){
    int linenum = 1;
    String l = main.description;
    char[] letters = l.toCharArray();
    
    textSize(15);
    int lastspace = 0;
    
    String temp = new String();
    for(int i = 0; i < letters.length; i ++){
      if(textWidth(temp) >= 260){
        texts.add(temp.substring(0, lastspace));
        //println(temp);
        temp = temp.substring(lastspace + 1, temp.length());
        linenum ++;
      }
      temp = temp + letters[i];
      if(letters[i] == ' ')
        lastspace = i;
    }
    texts.add(temp);
    
    this.linenum = linenum;
  }
  
  void update(){
    //delta = millis() - previous;
  }
  
  void render(int y){
    for(int i = 0; i < texts.size(); i ++){
      text(texts.get(i), 15, y + 20 * i, 270, 20 + 20 * i);
    }
  }

  EventNode getHead() {
    return head;
  }

  EventNode getTail() {
    return tail;
  }

  Event getMain() {
    return main;
  }

  void addTail(EventNode tail) {
    this.tail = tail;
  }
}

class EventLoader {

  EventLoader() {
    XML history = loadXML("events.xml");
    ;
    XML[] events = history.getChildren("event");
    XML[] eventList = history.getChildren("event");


    for (int i = 0; i < eventList.length; i ++) {
      int era = eventList[i].getInt("era");
      float time = eventList[i].getFloat("time");
      String message = eventList[i].getContent();
      timer.eras[era].events.add(new Event(time, message));
    }
  }
}

