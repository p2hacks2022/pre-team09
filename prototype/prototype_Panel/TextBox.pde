class TextBox extends UI{
  String text;
  TextBox(String _text, float _x, float _y, float _w, float _h){
    super(_x, _y, _w, _h);
    this.text = _text;
  }
  
  void draw(){
    
  }
}


void textBox(String text, color textColor, int textSize, float x, float y, float w, float h){
  textAlign(CENTER, CENTER);
  textSize(textSize);
  fill(textColor);
  float scalar = 0.04*textSize;
  float a = textAscent()*scalar;
  float b = textDescent()*scalar;
  text(text, x + w/2 , y +(a+b)/2);
}
