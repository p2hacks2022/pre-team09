class UI{
  float x,y,w,h;
  float size;
}


class Button extends UI{
  color c;
  //コンストラクタ:座標大きさ(_x,_y,_w,_h), 色(_c)
  Button(float _x, float _y, float _w, float _h, color _c){
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
    this.c = _c;
  }
  
  //マウスがボタンの上にある時に枠線を表示
  void mouseOverStroke(String strokeType){
    if(isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)){
      if(strokeType == "box"){
        strokeWeight(10);
        stroke(100,20);
        noFill();
        rect(this.x, this.y, this.w, this.h);
      }else if(strokeType == "circle"){
        strokeWeight(5);
        stroke(100,20);
        noFill();
        float r_hypotenuse = calcHypotenuse(w/2, h/2);
        ellipse(this.x + this.w/2, this.y + this.h/2, 2*r_hypotenuse, 2*r_hypotenuse);
      }
    }
  }
  
  //マウスが押されたら反応
  void mousePressed(){
    if(isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)){
      println("Button!");
    }
  }
}


class BoxButton extends Button{
  BoxButton(float _x, float _y, float _w, float _h, color _c){
    super(_x, _y, _w, _h, _c);//Buttonクラスのコンストラクタを継承
  }
  void draw(){
    
    super.mouseOverStroke("box");//ButtonクラスのmouseOverStroke()を継承
    fill(this.c);
    rect(this.x, this.y, this.w, this.h);
  }
  
  void mousePressed(){
   super.mousePressed();//ButtonクラスのmousePressed()を継承
  }
  
}



class PlusButton extends BoxButton{
  float line_weight = 0.1;
  PlusButton(float _x, float _y, float _size,  color _c){
    super(_x, _y, _size, _size, _c);
    this.size = _size;
  }
  
  void draw(){
    super.mouseOverStroke("box");
    
    noStroke();
    fill(this.c);
    rect(this.x + this.w*(1-line_weight)/2, this.y, this.w*line_weight, this.h);
    rect(this.x,this.y + this.h*(1-line_weight)/2 ,  this.w, this.h*line_weight);
  }
  
  void mousePressed(){
    super.mousePressed();
  }
}

class BatuButton extends BoxButton{
  float line_weight = 0.1;
  BatuButton(float _x, float _y, float _size,  color _c){
    super(_x, _y, _size, _size, _c);
    this.size = _size;
  }
  
  void draw(){
    super.mouseOverStroke("circle");
    
    fill(this.c);
    stroke(0);
    strokeWeight(this.w*line_weight);
    line(this.x, this.y, this.x + this.w, this.y + this.h);
    line(this.x, this.y + this.h ,  this.x + this.w, this.y);
  }
  
  void mousePressed(){
    super.mousePressed();
  }
}
