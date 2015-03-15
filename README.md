# xkcd1017
This is an implementation of [xkcd \#1017](http://xkcd.com/1017).
 
----
The timer exponetiallly rolls back time as progress increases. At 0% complete, the program displays today's date.
As progress increases, the time moves back faster and faster. At 100% complete, the program displays 13.7 billion
years ago, the time of the Big Bang.
 
Events will appear onscreen as the program passes certain dates. These dates are customizable with the XML file
`\data\events.xml`.
A default but incomplete list is included.

----
Currently, the timer is hardcoded to a length most convenient for whatever I'm debugging. I do plan to move the
time length to the xml file as well.
 
(I don't have the time or energy to make a gui for that)
 
See the wiki for how to input customized dates into the xml file.
