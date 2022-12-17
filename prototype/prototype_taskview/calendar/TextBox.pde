/*class TextBox extends UI{
  String text;
  TextBox(String _text, float _x, float _y, float _w, float _h){
    super(_x, _y, _w, _h);
    this.text = _text;
  }
  void draw(){ 
  }
}*/

//テキストボックスを表示する関数
//引数：文字(text), 文字色(textColor), 文字サイズ(textSize), ボックスの座標大きさ(x,y,w,h) 
void textBox(String text, color textColor, int textSize, float x, float y, float w, float h){
  fill(textColor);
  //textAscentとtextDescentを取得
  textSize(textSize);
  textAlign(CENTER, CENTER);
  float a = textAscent();
  float b = textDescent();
  text(text, x + w/2 , y + h/2 - (5*b - a)/2);
}
