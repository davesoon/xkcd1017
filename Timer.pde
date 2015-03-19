class Timer{
  float progress;
  int totalTime;
  int startTime;
  
  Era[] eras;
  int currentEra;
  
  Event currentEvent;
  int previous;
  int delta;
  
  EventQueue queue;
  
  Timer(){
    //.61001
    progress = 0;
    startTime = 0;
    totalTime = 1000 * 60 * 2;
    
    eras = new Era[7];
    eras[0] = new Recent();//2000 to now
    eras[1] = new Modern();//1900 to 2000
    eras[2] = new Historic();//1 to 1900
    eras[3] = new Ancient();//7000 BC to 1 BC
    eras[4] = new Prehistoric();//2 mya to 7000 BC
    eras[5] = new Geologic();//1 bya to 2 mya
    eras[6] = new Cosmic();//13.7 bya to 1 bya
    currentEra = 0;
    
    queue = new EventQueue();
  }
  
  void update(){
    if(millis() - startTime < totalTime)
      progress = (float)(millis() - startTime) / totalTime;
    else
      progress = 1;
      
    queue.update();
  }
  
  void newEvent(Event event){
    //previous = millis();
    //currentEvent = event;
    
    queue.addEvent(event);
    //queue.queueEvent(event);
    queue.update();
  }
  
  String printProgress(){
    if(progress < .1){
      return "0" + Float.toString(progress * 100).substring(0, 3) + " %";
    }
    else if(progress >= .1 && progress < 1){
      return Float.toString(progress * 100).substring(0, 4) + " %";
    }
    else if(progress == 1){
      return "100.0 %";
    }
    
    return "bottom kek";
  }
  
  void render(){
    fill(255);
    rect(10, 10, 280, 130);
    
    rect(10, 10, 100, 40);
    
    rect(110, 10, 180, 40);
    
    fill(0);
    textSize(20);
    text(printProgress(), 20, 40);
    
    if(eras[currentEra] != null){
      text(eras[currentEra].printDate(progress), 120, 40);
      if(eras[currentEra] instanceof Prehistoric){
        textSize(15);
      }
      
      
    }
    
    //renderEvent();
    queue.render();
  }
  
  void renderEvent(){
    //if(currentEvent == null)
      //return;
    
    /*
    delta = millis() - previous;
    
    if((float)delta / 20.0 > 255){
      currentEvent = null;
      return;
    }
    */
    //fill((float)delta / 20.0);
    fill(0);
    textSize(15);
    //text(currentEvent.description, 15, 55, 270, 80);
    text("A234567890123456789012345678", 15, 55, 270, 80);//1 line = 28 char, total 3 lines
    
  }
}

