import java.sql.Timestamp;
import java.util.Calendar;
import java.util.ArrayList;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;  

Timestamp dateTime_stamp;
TaskPanel panel;


/*
Timestamp planDate[]; //予測日時を保持する配列
Timestamp deadlineDate[]; //締切日時を保持する配列
Timestamp predictDate[]; //推測日時を保持する配列
*/
Calendar dateTime;


ArrayList<Calendar> planDate;
ArrayList<Calendar> deadlineDate;
ArrayList<Calendar> predictDate;

String title;  //画面のタイトル
int disp; //switch用の画面の番号
float achive_all; //達成率
PFont fontEN40, fontEN35, fontEN25, fontJP40, fontJP30, fontJP25, fontJP20;  //フォント
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;  //色
float screen_ratio = 0.9;

void setup(){
  size(540, 960);
  planDate     = new ArrayList<Calendar>();
  deadlineDate = new ArrayList<Calendar>();
  predictDate  = new ArrayList<Calendar>();
  
  
    Calendar day = Calendar.getInstance();
    planDate.add(day);
    
    day = Calendar.getInstance();
    day.set(Calendar.DATE, 15);
    //deadlineDate.add(day);
    
    day = Calendar.getInstance();
    day.set(Calendar.DATE, 14);
    predictDate.add(day);
    
    
  
  //フォント読み込み
  open_sans_regular  = createFont("fonts/OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("fonts/mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("fonts/mgenplus-1c-heavy.ttf", 40);
  
  
  dateTime = Calendar.getInstance();//仮で現在の日時を取得
  println("dateTime DATE:",dateTime.get(Calendar.DATE));
  println("planDate DATE:",planDate.get(0).get(Calendar.DATE));
  
  panel = new TaskPanel(500, 50, width, screen_ratio, dateTime);
  panel.getTaskDate("数学",planDate, deadlineDate, predictDate);
}

void draw(){
  background(255);
  //panel.getTaskDate("数学", planDate, deadlineDate, predictDate);
  panel.draw();
  //println("planD
}

void mouseWheel(MouseEvent event){
  panel.mouseWheel(event);//マウスホイールによるパネルのスクロールを
}
