/**

Simple sketch created to test minim possibilities
for playing multiple sounds triggered by events

Libraries:
    Minim:    audio playing library

Variables:
      minim:    initializes the minim library
au_player1, 
 au_player2:    initializes a player for both sounds

**/


import ddf.minim.* ;
Minim minim;
AudioPlayer au_player1, au_player2 ;
void setup()
{
 minim = new Minim(this) ;
 au_player1 = minim.loadFile("../rain.wav") ;
 au_player2 = minim.loadFile("../umbrella.wav") ;
}
void stop()
{
 minim.stop() ;
 super.stop() ;
}
void draw() 
{
}
void mousePressed()
{
 au_player1.play() ;
}
void keyReleased(){
 if (key == 't')
 {
 au_player2.play() ;
 }
}
