import java.sql.Timestamp;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;  
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;  //色

Timestamp dateTime;
Panel panel;

Panel array[];

float screen_ratio = 0.9;
void setup(){
  size(540, 960);
  
  //フォント読み込み
  open_sans_regular  = createFont("fonts/OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("fonts/mgenplus-1c-regular.ttf", 4);
  mgenplus_heavy = createFont("fonts/mgenplus-1c-heavy.ttf", 40);
  
  
  dateTime = new Timestamp(System.currentTimeMillis());//仮で現在の日時を取得
  panel = new Panel(500, 50, width, screen_ratio, dateTime);
  

}

void draw(){
  background(255);
  panel.draw();
  
  
  
}

void mouseWheel(MouseEvent event){
  panel.mouseWheel(event);
}
