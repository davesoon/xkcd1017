class Era{
  ArrayList<Event> events;
  int eventnum;
  
  Era(){
    events = new ArrayList();
    eventnum = 0;
  }
  
  String printDate(float p){
    return "charm kek";
  }
  
  void switchEra(){
    timer.currentEra ++;
  }
  
  void addEvent(Event event){
    events.add(event);
  }
  
  void checkEvent(float time){
    if(events == null || events.size() == 0 || eventnum >= events.size()){
      return;
    }
    
    if(time <= events.get(eventnum).time && !events.get(eventnum).shown){
      events.get(eventnum).shown = true;
      timer.newEvent(events.get(eventnum));
      eventnum ++;
    }
  }
}

class Recent extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    if(time < 2000){
      switchEra();
    }
    
    checkEvent(time);
    
    return yearPercent(time, floor(time));
  }
}

class Modern extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    if(time < 1900){
      switchEra();
    }
    checkEvent(time);
    return yearMonth(time, floor(time));
  }
}

class Historic extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    if(time < 1){
      switchEra();
    }
    
    checkEvent(time);
    
    if(time < 10){
      return Float.toString(floor(time)).substring(0,1);
    }
    else if(time < 100){
      return Float.toString(floor(time)).substring(0,2);
    }
    else if(time < 1000){
      return Float.toString(floor(time)).substring(0,3);
    }
    else{
      return Float.toString(floor(time)).substring(0,4);
    }
  }
}

////////////////////////////////////////////////
//NEGATIVE DATES
////////////////////////////////////////////////

class Ancient extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    time = abs(floor(time) - 1.0);
    
    if(time > 7000){
      switchEra();
    }
    
    checkEvent(time);
    
    if(time < 10){
      return Float.toString(time).substring(0,1) + " BC";
    }
    else if(time < 100){
      return Float.toString(time).substring(0,2) + " BC";
    }
    else if(time < 1000){
      return Float.toString(time).substring(0,3) + " BC";
    }
    
    return Float.toString(time).substring(0,4) + " BC";
    
    //println(Float.toString(yearPercent(time, floor(time))));
  }
  
  void checkEvent(float time){
    if(events == null || events.size() == 0 || eventnum >= events.size()){
      return;
    }
    
    if(time >= events.get(eventnum).time && !events.get(eventnum).shown){
      events.get(eventnum).shown = true;
      timer.newEvent(events.get(eventnum));
      eventnum ++;
    }
  }
}

class Prehistoric extends Ancient{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    time = floor(abs(time / 1000));
    
    checkEvent(time);
    
    String output = "";
    
    if(time < 10){
      output = Float.toString(time).substring(0,1);
    }
    else if(time < 100){
      output = Float.toString(time).substring(0,2);
    }
    else if(time < 1000){
      output = Float.toString(time).substring(0,3);
    }
    else if(time >= 1000){
      switchEra();
    }
    
    return output + ",000 Years Ago";
    
    //return "strange kek";
  }
}

class Geologic extends Ancient{
  String printDate(float p){
    
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    time = abs(time) / 1000000;
    
    checkEvent(time);
    
    String output = "";
    
    if(time < 10){
      output = Float.toString(time).substring(0,3);
    }
    else if(time < 100){
      output = Float.toString(time).substring(0,4);
    }
    else if(time < 1000){
      output = Float.toString(time).substring(0,5);
    }
    else if(time >= 1000){
      switchEra();
    }
    
    return output + " mya";
  }
}

class Cosmic extends Ancient{
  String printDate(float p){
    if(p == 1.0 && events.size() == 0){
      return "13.7 bya";
    }
    
    float time =  abs(today - (exp(20.3444 * pow(p, 3) + 3) - exp(3))) / 1000000000;
    checkEvent(time);
    
    String output = "";
    
    if(time < 10){
      output = Float.toString(time).substring(0,3);
    }
    else if(time < 100){
      output = Float.toString(time).substring(0,4);
    }
    
    return output + " bya";
  }
}
