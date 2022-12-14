PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;  //色
BoxButton boxButton ,textBoxButton ,plusButton, batuButton ;

void setup(){
  size(540, 960); 
  
  open_sans_regular  = createFont("fonts/OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("fonts/mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("fonts/mgenplus-1c-heavy.ttf", 40);

  boxButton = new BoxButton( 70 ,100 ,400, 100, colorMain);
  textBoxButton = new TextBoxButton("完了",colorBlack, 40, 70 ,300 ,400, 100, colorMain);
  plusButton = new PlusButton( 70 ,500 ,50, color(0));
  batuButton = new BatuButton( 70 ,700 ,30, color(255));
}

int s;
void draw(){
  background(255);
  plusButton.draw();
  textFont(mgenplus_heavy);
  textSize(40);
  textBoxButton.draw();
  boxButton.draw();
  
  
  
  batuButton.draw();
  
}

void mousePressed(){
  boxButton.mousePressed();
  textBoxButton.mousePressed();
  batuButton.mousePressed();
}
