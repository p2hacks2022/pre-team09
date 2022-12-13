
BoxButton b1 ,b2, b3;

void setup(){
  size(540, 960); 
  b1 = new BoxButton( 70 ,100 ,400, 100, color(#40B0A0));
  b2 = new PlusButton( 70 ,300 ,100, color(0));
  b3 = new BatuButton( 70 ,500 ,30, color(255));
}

int s;
void draw(){
  background(255);
  b1.draw();
  b2.draw();
  b3.draw();
}

void mousePressed(){
  b1.mousePressed();
}
