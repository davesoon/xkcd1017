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
      text(current.main.description, 15, 55 + 20 * lines, 270, 20 + 18 * current.main.lines);
      //text(current.main.description, 15, 55, 270, 40);
      lines += current.main.lines;
      current = current.getTail();
    }
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
    
    current = current.getHead();
    current.tail = null;
    
    length --;
  }
}

class EventNode {
  EventNode head;
  Event main;
  EventNode tail;

  int previous;
  float alpha;

  EventNode() {
    println("wut");
  }

  void update() {
  }

  EventNode(Event main) {
    head = null;
    this.main = main;
    tail = null;
  }

  EventNode(EventNode head, Event main, EventNode tail) {
    this.head = head;
    this.main = main;
    this.tail = tail;
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

