import java.sql.Timestamp;
import java.util.Calendar;
import java.util.ArrayList;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;  
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;  //色

//Timestamp dateTime;
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
<<<<<<< HEAD
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
=======
  planDate = new ArrayList<Calendar>();
  deadlineDate = new ArrayList<Calendar>();
  predictDate = new ArrayList<Calendar>();
>>>>>>> 12076e07bd13217ffe04eb40cd54511fa7f6fee5
  
  for(int i=0; i< 1; i++){
    Calendar day = Calendar.getInstance();
    //println("MONTH", day.get(Calendar));
    //12/14
    planDate.add(day);
    println("day:",day.get(Calendar.DATE));
    println("planDate DATE:", planDate.get(i).get(Calendar.DATE));
    
    //12/5
    day = Calendar.getInstance();
    day.set(Calendar.DATE, 5);
    deadlineDate.add(day);
    
    //12/4
    day = Calendar.getInstance();
    day.set(Calendar.DATE, 4);
    predictDate.add(day);
    
    println("planDate DATE:", planDate.get(i).get(Calendar.DATE));
    
  }
  
<<<<<<< HEAD
=======
  //フォント読み込み
  open_sans_regular  = createFont("fonts/OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("fonts/mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("fonts/mgenplus-1c-heavy.ttf", 40);
  
  
  dateTime = Calendar.getInstance();//仮で現在の日時を取得
  println("dateTime DATE:",dateTime.get(Calendar.DATE));
  println("planDate DATE:",planDate.get(0).get(Calendar.DATE));
  
  panel = new TaskPanel(500, 50, width, screen_ratio, dateTime);
  panel.getTaskDate("数学",deadlineDate, deadlineDate, predictDate);

>>>>>>> 12076e07bd13217ffe04eb40cd54511fa7f6fee5
}

void draw(){
  title = "リマインド";  //画面のタイトル
  //textFont(fontJP40);
  textAlign(LEFT, TOP);
  fill(colorBlack);
  text(title, 20, 10);  //タイトルを表示
  
  background(255);
<<<<<<< HEAD
  panel.draw();//パネルを表示
=======
  //panel.getTaskDate("数学", planDate, deadlineDate, predictDate);
  panel.draw();
  //println("planDate,MONTH:", planDate.get(0).get(Calendar.DATE));
  
  
  
>>>>>>> 12076e07bd13217ffe04eb40cd54511fa7f6fee5
}

void mouseWheel(MouseEvent event){
  panel.mouseWheel(event);//マウスホイールによるパネルのスクロールを
}
