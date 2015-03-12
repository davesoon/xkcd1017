class Era{
  ArrayList<Event> events;
  
  Era(){
    events = new ArrayList();
  }
  
  String printDate(float p){
    return "charm kek";
  }
  
  void switchEra(){
    timer.currentEra ++;
  }
}

class Recent extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    if(time < 2000){
      switchEra();
    }
    
    return yearPercent(time, floor(time));
  }
}

class Modern extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    if(time < 1900){
      switchEra();
    }
    
    return yearMonth(time, floor(time));
  }
}

class Historic extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    if(time < 1){
      switchEra();
    }
    
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

class Ancient extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    
    time = abs(floor(time) - 1.0);
    
    if(time > 7000){
      switchEra();
    }
    
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
}

class Prehistoric extends Era{
  String printDate(float p){
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    time = floor(abs(time / 1000));
    
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
    else if(time < 2000 ){
      output = Float.toString(time).charAt(0) + "," + Float.toString(time).substring(1,4);
    }
    else if(time >= 2000){
      switchEra();
    }
    
    return output + ",000 Years Ago";
    
    //return "strange kek";
  }
}

class Geologic extends Era{
  String printDate(float p){
    
    float time =  today - (exp(20.3444 * pow(p, 3) + 3) - exp(3));
    time = abs(time) / 1000000;
    
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

class Cosmic extends Era{
  String printDate(float p){
    if(p == 1.0){
      return "13.7 bya";
    }
    
    float time =  abs(today - (exp(20.3444 * pow(p, 3) + 3) - exp(3))) / 1000000000;
    
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
