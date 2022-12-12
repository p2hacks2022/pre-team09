class UI{
  float x,y,w,h;
}


class Button extends UI{
  color c;
  Button(float _x, float _y, float _w, float _h, color _c){
    //コンストラクタ:座標大きさ(_x,_y,_w,_h), 色(_c)
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
    this.c = _c;
  }
  
}

class BoxButton extends Button{
  BoxButton(float _x, float _y, float _w, float _h, color _c){
    super(_x, _y, _w, _h, _c);//Buttonクラスのコンストラクタを継承
    
  }
  
  void draw(){
    fill(this.c);
    rect(this.x, this.y, this.w, this.h);
  }
  
  void mouseClicked(){
    println("PUSH");
    if(isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)){
      println("Button!");
    }
  }
}

class MarkButton extends Button{
  MarkButton(float _x, float _y, float _w, float _h, color _c){
    super(_x, _y, _w, _h, _c);
  }
  
  void draw(){
    fill(this.c);
    rect(this.x, this.y, this.w, this.h);
  }
}
