int targetIndex;//押された日付パネルに対応するデータのインデックス
/*
planDateArray.get(targetIndex);//ArrayListからCalenderDateを取得
deadlineDateArray.get(targetIndex);
predictDateArray.get(targetIndex);
*/

Calendar planDate;
Calendar deadlineDate;
Calendar predictDate;

int planYear, planMonth, planDay, planHour, planMinute;//予定int
int deadlineYear, deadlineMonth, deadlineDay, deadlineHour, deadlineMinute;//締め切り
int predictYear, predictMonth, predictDay, predictHour, predictMinute;//推測
int frombox_y;

TextBoxButton doneButton;

void page03_Taskview_setup(){
  doneButton = new TextBoxButton("タスク完了！", colorWhite,30, width/2 - 120 ,height - 150, 240 ,100, colorMain);
}

void page03_Taskview_draw(){
  dateDraw();
  batuButton.draw();
  
  textFont(mgenplus_heavy);
  doneButton.draw();
}

void page03_Taskview_mouseClicked(){
  batuButton.mousePressed();
  doneButton.mousePressed();
}


void dateDraw(){
  textAlign(LEFT, CENTER);
  noStroke();
  fill(colorWhite);
  rect(0, 0, 540, 960);//背景白
  fill(colorBlack);
  textFont(mgenplus_heavy);
  text("入力", 20, 30);//入力文字列
  
  frombox_y=80;
  drawRect(colorSub,frombox_y);//タイトル頭
  drawLine(frombox_y);//タイトル下線
  drawText("内容",frombox_y+45);//タイトル指示
  textSize(40);
  textAlign(LEFT, BOTTOM);
  text(taskTitleArray.get(targetIndex), 130, frombox_y + 45);
  
  frombox_y+=170;
  textCalendar(planDateArray.get(targetIndex),frombox_y,"予定",colorBlack);
  frombox_y+=150;
  textCalendar(deadlineDateArray.get(targetIndex), frombox_y,"推測",colorMain);
  frombox_y+=150;
  textCalendar(predictDateArray.get(targetIndex), frombox_y,"締切",colorAttention);
}

void textCalendar(Calendar Date, int drawHigh, String Label, color Color){
  drawRect(Color,drawHigh);
  drawRect(Color,drawHigh+50);
  drawLine(drawHigh+50);
  drawText(Label,drawHigh+45);
  drawYMDHM(drawHigh);
  
  int Year=Date.get(Calendar.YEAR);
  int Month=Date.get(Calendar.MONTH);
  Month+=1;
  int Day=Date.get(Calendar.DATE);
  int Hour=Date.get(Calendar.HOUR_OF_DAY);
  int Minute=Date.get(Calendar.MINUTE);
  drawHigh+=45;
  textFont(open_sans_regular);
  textSize(30);
  textAlign(RIGHT, BOTTOM);
  text(Year,250,drawHigh);
  text(Month,350,drawHigh);
  text(Day,450,drawHigh);
  drawHigh+=50;
  text(Hour,350,drawHigh);
  text(addZeroMinute(Minute),450,drawHigh);//分
  textAlign(LEFT, TOP);
}

//左の先頭図形
void drawRect(color drawColor,int drawIchi){
  noStroke();
  fill(drawColor);
  rect(20, drawIchi, 15, 50);//タイトル頭
}

//下線
void drawLine(int drawLine){
  stroke(colorBlack);
  strokeWeight(2);
  line(20,drawLine+50,width-20,drawLine+50);
}

//タイトル表示
void drawText(String drawTitle,int drawHigh){
  fill(colorBlack);
  textFont(mgenplus_regular);
  textSize(30);
  textAlign(LEFT, BOTTOM);
  text(drawTitle,40,drawHigh);
  textAlign(LEFT, TOP);
}

//年・月・日・時・分表示
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

String addZeroMinute(int time){
  String time_string = "";
  if(time < 10){//分が一桁の時にゼロ埋め
    time_string += "0";
  }
  time_string += str(time);
  return time_string;
}


 
