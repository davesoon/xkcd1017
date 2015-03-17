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

    this.lines = ceil((float)description.length() / 28.0);
    //println("Test test test! Testity test test! This is a multi-line test !".length());
  }
  
}

class EventQueue {
  EventNode top;
  int length;

  EventQueue() {
    top = null;
    length = 0;
  }

  EventQueue(EventNode node) {
    top = node;
    length = 1;
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
      current.render(55 + lines * 20);
      //text(current.main.description, 15, 55, 270, 40);
      lines += current.main.lines;
      current = current.getTail();
    }
    
    text(lines, 280, 150);
  }

  void update() {
    int lines = 0;
    EventNode current = top;
    
    if(current == null)
      return;
    
    while(current.getTail () != null) {
      lines += current.main.lines;
      current.update();

      current = current.getTail();
    }

    if (lines > 3) {
      removeNode();
    }
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
  ArrayList<String> texts;

  EventNode() {
    println("wut");
    texts = new ArrayList();
    doTheLineThingIGuess();
  }

  EventNode(Event main) {
    head = null;
    this.main = main;
    tail = null;
    texts = new ArrayList();
    doTheLineThingIGuess();
  }

  EventNode(EventNode head, Event main, EventNode tail) {
    this.head = head;
    this.main = main;
    this.tail = tail;
    texts = new ArrayList();
    doTheLineThingIGuess();
  }
  
  
  void doTheLineThingIGuess(){
    int linenum = 1;
    String l = main.description;
    char[] letters = l.toCharArray();
    
    textSize(15);
    
    String temp = new String();
    for(int i = 0; i < letters.length; i ++){
      temp = temp + letters[i];
      if(textWidth(temp) >= 270){
        texts.add(temp);
        println(temp);
        temp = new String();
        linenum ++;
      }
    }
    texts.add(temp);
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

