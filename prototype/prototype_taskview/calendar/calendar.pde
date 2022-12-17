import java.util.Calendar;

Calendar planDate;
Calendar deadlineDate;
Calendar predictDate;

int planYear, planMonth, planDay, planHour, planMinute;//予定int
int deadlineYear, deadlineMonth, deadlineDay, deadlineHour, deadlineMinute;//締め切り
int predictYear, predictMonth, predictDay, predictHour, predictMinute;//推測

PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;
color color_main=#40b0a0, color_sub=#a0f0d0, color_attention=#c03050, color_white=#ffffff, color_black=#303030, color_gray=#d0d0d0;
int frombox_y;

void setup() {
  planDate = Calendar.getInstance();
  deadlineDate = Calendar.getInstance();
  predictDate= Calendar.getInstance();
  
  planDate.set(Calendar.MINUTE, 9);
  
  size(540,960);
  //フォント読み込み
  open_sans_regular  = createFont("OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("mgenplus-1c-heavy.ttf", 40);
  textAlign(LEFT, TOP);
}

void draw() {
  //getCalendar();
  //demoInt();
  noStroke();
  fill(color_white);
  rect(0, 0, 540, 960);//背景白
  fill(color_black);
  textFont(mgenplus_heavy);
  text("入力", 20, 10);//入力文字列
  
  frombox_y=80;
  drawRect(color_sub,frombox_y);//タイトル頭
  drawLine(frombox_y);//タイトル下線
  drawText("内容",frombox_y+45);//タイトル指示
  
  frombox_y+=170;
  textCalendar(planDate,frombox_y,"予定",color_black);
  frombox_y+=150;
  textCalendar(deadlineDate, frombox_y,"推測",color_main);
  frombox_y+=150;
  textCalendar(predictDate, frombox_y,"締切",color_attention);
  
  
  /*drawRect(color_black,frombox_y);
  drawRect(color_black,frombox_y+50);
  drawLine(frombox_y+50);
  drawText("予定",frombox_y+45);
  drawYMDHM(frombox_y);
  drawTextYMDHK(planYear, planMonth, planDay, planHour, planMinute,frombox_y);
  
  frombox_y+=150;
  drawRect(color_main,frombox_y);
  drawRect(color_main,frombox_y+50);
  drawLine(frombox_y+50);
  drawText("推測",frombox_y+45);
  drawYMDHM(frombox_y);
  drawTextYMDHK(deadlineYear, deadlineMonth, deadlineDay, deadlineHour, deadlineMinute,frombox_y);
  
  frombox_y+=150;
  drawRect(color_attention,frombox_y);
  drawRect(color_attention,frombox_y+50);
  drawLine(frombox_y+50);
  drawText("締切",frombox_y+45);
  drawYMDHM(frombox_y);
  drawTextYMDHK(predictYear, predictMonth, predictDay, predictHour, predictMinute,frombox_y);
  */
  
}


void drawRect(color drawColor,int drawIchi){
  noStroke();
  fill(drawColor);
  rect(20, drawIchi, 15, 50);//タイトル頭
}

void drawLine(int drawLine){
  stroke(color_black);
  strokeWeight(2);
  line(20,drawLine+50,width-20,drawLine+50);
}

void drawText(String drawTitle,int drawHigh){
  fill(color_black);
  textFont(mgenplus_regular);
  textSize(30);
  textAlign(LEFT, BOTTOM);
  text(drawTitle,40,drawHigh);
  textAlign(LEFT, TOP);
}

void drawYMDHM(int drawHigh){
  drawHigh+=45;
  textFont(mgenplus_regular);
  textSize(20);
  textAlign(LEFT, BOTTOM);
  text("年",260,drawHigh);
  text("月",360,drawHigh);
  text("日",460,drawHigh);
  drawHigh+=50;
  text("時",360,drawHigh);
  text("分",460,drawHigh);
  textSize(30);
  textAlign(LEFT, TOP);
}

/*void drawTextYMDHK(int drawYear,int drawMonth,int drawDay,int drawHour,int drawMinute,int drawHigh){
  drawHigh+=45;
  textFont(open_sans_regular);
  textSize(30);
  textAlign(RIGHT, BOTTOM);
  text(drawYear,250,drawHigh);
  text(drawMonth,350,drawHigh);
  text(drawDay,450,drawHigh);
  drawHigh+=50;
  text(drawHour,350,drawHigh);
  text(addZeroMinute(drawMinute),450,drawHigh);//分
  textAlign(LEFT, TOP);
}*/

/*void getCalendar() {
  
  予定。。。intに変換
  
  planYear=planDate.get(Calendar.YEAR);
  planMonth=planDate.get(Calendar.MONTH);
  planMonth+=1;
  planDay=planDate.get(Calendar.DATE);
  planHour=planDate.get(Calendar.HOUR_OF_DAY);
  planMinute=planDate.get(Calendar.MINUTE);
  
  deadlineYear=deadlineDate.get(Calendar.YEAR);
  deadlineMonth=deadlineDate.get(Calendar.MONTH);
  deadlineMonth+=1;
  deadlineDay=deadlineDate.get(Calendar.DATE);
  deadlineHour=deadlineDate.get(Calendar.HOUR_OF_DAY);
  deadlineMinute=deadlineDate.get(Calendar.MINUTE);

  predictYear=predictDate.get(Calendar.YEAR);
  predictMonth=predictDate.get(Calendar.MONTH);
  predictMonth+=1;
  predictDay=predictDate.get(Calendar.DATE);
  predictHour=predictDate.get(Calendar.HOUR_OF_DAY);
  predictMinute=predictDate.get(Calendar.MINUTE);
}*/

String calendarToString_HourMinute(Calendar time){
  String time_string = "";
  time_string += str(time.get(Calendar.HOUR_OF_DAY)) + ":";
  if(time.get(Calendar.MINUTE) < 10){//分が一桁の時にゼロ埋め
    time_string += "0";
  }
  time_string += str(time.get(Calendar.MINUTE));
  return time_string;
}

String addZeroMinute(int time){
  String time_string = "";
  if(time < 10){//分が一桁の時にゼロ埋め
    time_string += "0";
  }
  time_string += str(time);
  return time_string;
}



void textCalendar(Calendar planDate, int drawHigh, String Label, color Color){
  drawRect(Color,drawHigh);
  drawRect(Color,drawHigh+50);
  drawLine(drawHigh+50);
  drawText(Label,drawHigh+45);
  drawYMDHM(drawHigh);
  
  planYear=planDate.get(Calendar.YEAR);
  planMonth=planDate.get(Calendar.MONTH);
  planMonth+=1;
  planDay=planDate.get(Calendar.DATE);
  planHour=planDate.get(Calendar.HOUR_OF_DAY);
  planMinute=planDate.get(Calendar.MINUTE);
  drawHigh+=45;
  textFont(open_sans_regular);
  textSize(30);
  textAlign(RIGHT, BOTTOM);
  text(planYear,250,drawHigh);
  text(planMonth,350,drawHigh);
  text(planDay,450,drawHigh);
  drawHigh+=50;
  text(planHour,350,drawHigh);
  text(addZeroMinute(planMinute),450,drawHigh);//分
  textAlign(LEFT, TOP);
}
