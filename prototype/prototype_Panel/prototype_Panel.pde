import java.sql.Timestamp;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

Timestamp dateTime;
Panel panel;

String title;  //画面のタイトル
int disp; //switch用の画面の番号
float achive_all; //達成率
PFont fontEN40, fontEN35, fontEN25, fontJP40, fontJP30, fontJP25, fontJP20;  //フォント
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;  //色
float screen_ratio = 0.9;

void setup(){
  size(540, 960);
  background(colorWhite);
  //noStroke();
  noFill();
  
  fontEN40 = createFont("OpenSans-Regular.ttf", 40);
  fontEN35 = createFont("OpenSans-Regular.ttf", 35);
  fontEN25 = createFont("OpenSans-Regular.ttf", 25);
  fontJP40 = createFont("mgenplus-1c-heavy.ttf", 40);
  fontJP30 = createFont("mgenplus-1c-regular.ttf", 30);
  fontJP25 = createFont("mgenplus-1c-regular.ttf", 25);
  fontJP20 = createFont("mgenplus-1c-heavy.ttf", 20);
  
  disp = 1;//画面番号は１
  achive_all = 80;//達成率を80とする
  
  dateTime = new Timestamp(System.currentTimeMillis());
  panel = new Panel(20, 30, width, screen_ratio, dateTime);
  
}

void draw(){
  title = "リマインド";  //画面のタイトル
  //textFont(fontJP40);
  textAlign(LEFT, TOP);
  fill(colorBlack);
  text(title, 20, 10);  //タイトルを表示
  
  background(255);
  panel.draw();//パネルを表示
}

void mouseWheel(MouseEvent event){
  panel.mouseWheel(event);//マウスホイールによるパネルのスクロールを
}
