
BoxButton boxButton ,plusButton, batuButton;

void setup(){
  size(540, 960); 
  boxButton = new BoxButton( 70 ,100 ,400, 100, color(#40B0A0));
  plusButton = new PlusButton( 70 ,300 ,100, color(0));
  batuButton = new BatuButton( 70 ,500 ,30, color(255));
}

int s;
void draw(){
  background(255);
  boxButton.draw();
  plusButton.draw();
  batuButton.draw();
}

void mousePressed(){
  boxButton.mousePressed();
  boxButton.mousePressed();
  batuButton.mousePressed();
}
