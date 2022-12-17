import java.util.Calendar;
import java.util.ArrayList;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;




void setup() {
  size(540, 960);
  setupFont(); //フォントを読み込み
  
  setupTaskDate(); //カレンダー配列をインスタンス
  setupCsv(); //csvファイルを読み込み
  setupButton();//ボタンクラスのインスタンス
  
  //各ページのセットアップ
  page01_Panel_setup();
  page02_Input_setup();
  page03_Taskview_setup();
}


void draw() {
  background(colorWhite);
  
  switch(page_num) {
  case 1:
    page01_Panel_draw();
    break;
  case 2:
    page02_Input_draw();
    break;
  case 3:
    page03_Taskview_draw();
    break;
  }
  
  if(mouseClicked){
    println("Clicked");
  }
}

boolean mouseClicked = false;

void mouseClicked(){
  switch(page_num) {
  case 1:
    page01_Panel_mouseClicked();
    break;
  case 2:
    page02_Input_mouseClicked();
    break;
  case 3:
    page03_Taskview_mouseClicked();
    break;
  }
}

void mouseWheel(MouseEvent event){
  for(TaskPanel panel_this : panelArray){
    panel_this.mouseWheel(event);
  }
}

abstract class UI {
  float x, y, w, h; 
  UI(float _x, float _y, float _w, float _h) {
    //インスタンス：座標大きさ(x,y,w,h)
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
  }
}
