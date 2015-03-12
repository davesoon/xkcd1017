class Event{
  String description;
  float time;
  int era;
  
  boolean showed;
  
  Event(){
    
  }
  
  Event(int era){
    this.era = era;
  }
}

class EventLoader{
  XML history;
  
  EventLoader(){
    history = loadXML("events.xml");
    XML[] events = history.getChildren("event");
    
    for(int i = 0; i < events.length; i ++){
      
    }
  }
}
