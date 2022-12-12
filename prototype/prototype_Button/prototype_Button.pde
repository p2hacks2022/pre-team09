
BoxButton b;

void setup(){
  size(540, 960); 
  b = new BoxButton( 10 ,100 ,400, 100, color(#40B0A0));
}

int s;
void draw(){
  background(255);
  b.draw();
}

void mousePressed(){
  b.mouseClicked();
}
