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
    textSize(15);
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

