class Event{
  String description;
  float time;
  String date;
  boolean shown;
  
  Event(){
    shown = false;
    time = 2015.0;
    description = "you dun goofed";
  }
  
  Event(float time, String message){
    this.time = time;
    this.description = message;
  }
}

class EventQueue{
  
}  

class EventLoader{
  
  EventLoader(){
    XML history = loadXML("events.xml");;XML[] events = history.getChildren("event");
    XML[] eventList = history.getChildren("event");
    
    
    for(int i = 0; i < eventList.length; i ++){
      int era = eventList[i].getInt("era");
      float time = eventList[i].getFloat("time");
      String message = eventList[i].getContent();
      timer.eras[era].events.add(new Event(time, message));
    }
    
  }
}
