/*
Eras:

Recent Memory
2000-Now
Accurate to the Day

Modern History
1500 - 2000
to the day

Ancient History
0 - 1500
to the year

Early History
6000 BC - 0
to the year
http://en.wikipedia.org/wiki/Timeline_of_ancient_history

Prehistory
2.5 Ma - 3000 BC
(Wikipedia, Prehistory #Timeline)
Paleolithic - Neolithic / Chalcolithic

Geologic Time
4550 Ma - 2 Ma
(Wikipedia, Geologic Time Scale)

Cosmic Time (Long)
13.7 bya - 4550 Ma
(http://en.wikipedia.org/wiki/Graphical_timeline_of_the_universe)
*/
final float today = percentYear(year(), month(), day());

Timer timer = new Timer();
EventLoader loader;

void setup(){
  size(300, 150);
  frameRate(30);
  
  loader = new EventLoader();
  //test = loadXML("http://www.w3schools.com/xml/note.xml");
}

void draw(){
  background(240);
  timer.update();
  timer.render();
  //println(percentYear(1592, 3, 14));
}
