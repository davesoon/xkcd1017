int daysInMonth(int month, int year){
  if(isLeap(year) && month == 2){
    return 29;
  }
  switch(month){
    case 1:
      return 31;
    case 2:
      return 28;
    case 3:
      return 31;
    case 4:
      return 30;
    case 5:
      return 31;
    case 6:
      return 30;
    case 7:
      return 31;
    case 8:
      return 31;
    case 9:
      return 30;
    case 10:
      return 31;
    case 11:
      return 30;
    case 12:
      return 31;
      
    default:
      return 1;
  }
}

String yearPercent(float p, int year){
  while(p > 1){
    p -= 1.0;
  }
  
  int day;
  if(isLeap(year))
    day = round(p * 366.0);
  else
    day = round(p * 365.0);
    
  int month = 1;
  
  while(day > daysInMonth(month, year)){
    day -= daysInMonth(month, year);
    month ++;
  }
  
  return year + " - " + month + " - " + day;
}

String yearMonth(float p, int year){
  while(p > 1){
    p -= 1.0;
  }
  
  int day;
  if(isLeap(year))
    day = round(p * 366.0);
  else
    day = round(p * 365.0);
    
  int month = 1;
  
  while(day > daysInMonth(month, year)){
    day -= daysInMonth(month, year);
    month ++;
  }
  
  return year + " " + monthName(month);
}

boolean isLeap(int year){
  if(year % 4 == 0){
    if(year % 100 == 0){
      if(year % 400 == 0){
        return true;
      }
      return false;
    }
    return true;
  }
  return false;
}

float percentYear(int year, int month, int day){
  for(int i = 1; i < month; i ++){
    day += daysInMonth(i, i);
  }
  
  if(isLeap(year))
    return year + day / 366.0;
  else
    return year + day / 365.0;
}

String monthName(int month){
  switch(month){
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
      
    default:
      return "up kek";
  }
}
