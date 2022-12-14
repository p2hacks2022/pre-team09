//マウス判定の関数：マウス座標(mouseX, mouseY), 対象物(x,y,w,h)
boolean isOverMouse(float mouseX, float mouseY, 
float x, float y, float w, float h){
  boolean isOverMouse = false;
  if(x <= mouseX && mouseX <= x+w && y <= mouseY && mouseY <= y+h){
   isOverMouse = true; 
  }
  return isOverMouse;
}
