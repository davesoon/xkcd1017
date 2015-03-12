class Timer{
  float progress;
  int totalTime;
  int startTime;
  
  Era[] eras;
  int currentEra;
  
  Timer(){
    //.61001
    progress = 0;
    startTime = 0;
    totalTime = 1000 * 60 * 5;
    
    eras = new Era[7];
    eras[0] = new Recent();
    eras[1] = new Modern();
    eras[2] = new Historic();
    eras[3] = new Ancient();
    eras[4] = new Prehistoric();
    eras[5] = new Geologic();
    eras[6] = new Cosmic();
    currentEra = 0;
  }
  
  void update(){
    if(millis() - startTime < totalTime)
      progress = (float)(millis() - startTime) / totalTime;
    else
      progress = 1;
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
      if(eras[currentEra] instanceof Prehistoric){
        textSize(15);
      }
      text(eras[currentEra].printDate(progress), 120, 40);
    }
  }
}

