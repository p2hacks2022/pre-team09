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


//マウス判定の関数：マウス座標(mouseX, mouseY), 対象物(x,y,w,h)
boolean isOverMouse(float mouseX, float mouseY, 
float x, float y, float w, float h){
  boolean isOverMouse = false;
  if(x <= mouseX && mouseX <= x+w && y <= mouseY && mouseY <= y+h){
   isOverMouse = true; 
  }
  return isOverMouse;
}


//三平方の定理...直角三角形の斜辺を求める
float calcHypotenuse(float side1, float side2){
  return sqrt(sq(side1) + sq(side2));
}
