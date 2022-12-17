/*
//color
color color_main = #40B0A0;
color color_sub = #A0F0D0;
color color_attemtion = #C03050;
color colour_white = #FFFFFF;
color colour_black = #303030;
color colour_gray = #D0D0D0;

import javax.swing.*;
import java.awt.*;
import java.util.Calendar;

String Title;
String textName[] = {"tttt", "yyyy", "MM", "dd", "hh", "mm"};
boolean success;

Calendar dateTime;
JLayeredPane pane;
JTextField[] field;



void setup() {
  size(540, 960);
  rect(500, 900, 40, 40);
  dateTime = Calendar.getInstance();
  

  // SmoothCanvasの親の親にあたるJLayeredPaneを取得
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  // 1行のみのテキストボックスを作成
  field = new JTextField[6];
  field[0] = new JTextField("", 30);
  field[0].setBounds(50, 50, 300, 50);
  pane.add(field[0]);
  field[0].setText("");
  for (int i = 1; i < field.length; i++) {
    field[i] = new JTextField("", 30);
    field[i].setBounds(50*i, 150, 50, 50);
    pane.add(field[i]);
    field[i].setText("");
  }
}

void draw() {

  for (int i= 0; i<6; i++) {
    //println(textName[i]);
  }
}

void mouseClicked() {
  if (mouseX>500 && mouseX<540&&mouseY>900&&mouseY<940) {
    String instance;
    for (int i = 0; i < field.length; i++) {
      instance = field[i].getText();
      if (instance == null) {//入力に空欄があればfalse
        success = false;
        break;
      } else if (i == 1) {//年の判定
        //4桁以下または数値以外ならfalseを返す
        if (int(instance) < 1000 || int(instance)==0) {
          success = false;
          break;
        }
      } else if (i > 1) {//年以外の判定
        //2桁では無かったらfalseを返す
        if (int(instance)>100) {
          success = false;
          break;
        }
      } else if (i == 2) {//月の判定
        //月と認識できなければfalseを返す
        if (int(instance)<13 || int(instance) == 0){
          success = false;
          break;
        }
      }else if(i == 3){//日の判定
        //日と認識できなければfalseを返す
        if(int(instance) > 31 || int(instance)==0){
          success = false;
          break;
        }
      }else if(i == 4){//時の判定
        //時と認識できなければfalseを返す。
        if(int(instance) > 25){
          success = false;
          break;
        }
      }else if(i == 5){//分の判定
         //分と認識できなければfalseを返す。
        if(int(instance) >60){
          success = false;
          break;
        }
      } else {
        success = true;
      }
    }
    if (success) {
      for (int i = 0; i<6; i++) {
        textName[i] = field[i].getText();
        println(textName[i]);
      }
       dateTime.set(Calendar.YEAR, int(textName[1]));
       dateTime.set(Calendar.MONTH,int(textName[2]));
       dateTime.set(Calendar.DATE,int(textName[3]));
       dateTime.set(Calendar.HOUR,int(textName[4]));
       dateTime.set(Calendar.MINUTE,int(textName[5]));
       
       println("Y:"+dateTime.get(Calendar.YEAR));
       println("M:"+dateTime.get(Calendar.MONTH));
       println("D:"+dateTime.get(Calendar.DATE));
       println("H:"+dateTime.get(Calendar.HOUR));
       println("m:"+dateTime.get(Calendar.MINUTE));
    }else{
      print("it's not over");
    }
  }
}*/
