//CSVのインポート

import javax.swing.*;
import java.awt.*;
import java.util.Calendar;

Calendar dateTime;
JLayeredPane pane;
JTextField[] field;

String baseTitle;
//クラスの定義
importer title;
importer year;
importer month;
importer day;
importer hour;
importer minute;



void setup() {
  size(500, 500);
  input_setup();
  input_process();
  
  dateTime = Calendar.getInstance();//Calendar型の宣言
  println("ベースデータ"+dateTime);
  //テキスト入力のsetup
  field = new JTextField[6];
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  title = new importer(0, 50, 50, 300, 50);
  year =new importer(1, 50, 150, 50, 50);
  month  =new importer(2, 110, 150, 50, 50);
  day = new importer(3, 170, 150, 50, 50);
  hour = new importer(4, 230, 150, 50, 50);
  minute =new importer(5, 290, 150, 50, 50);

  year.set();
  title.set();
  month.set();
  day.set();
  hour.set();
  minute.set();
}

void draw() {
}

void mouseClicked() {
  dateTime = Calendar.getInstance();
  println("Click");

  if (title.flag()) {//タイトルのテキストが入力されていればtrue
    //テキスト入力のタイトルをString型で取得
    baseTitle = title.getTitle();
    println("sucess Title");
  } else {
    println("error");
    return;
  }
  if (year.flag()) { 
    //calendar型で年を返す
    println("sucess Year");
    dateTime.set(Calendar.YEAR, year.getData());
  } else {
    println("error");
    return;
  }
  if (month.flag()) {
    println("sucess MONTH");
    dateTime.set(Calendar.MONTH, month.getData());
  } else {
    println("error");
    return;
  }
  if (day.flag()) {
    println("sucess Day");
    dateTime.set(Calendar.DATE, day.getData());
  } else {
    println("error");
    return;
  }
  if (hour.flag()) {
    println("sucess HOUR");
    dateTime.set(Calendar.HOUR_OF_DAY, hour.getData());
  } else {
    println("error");
    return;
  }
  if (minute.flag()) {
    println("sucess MINUTE");
    dateTime.set(Calendar.MINUTE, minute.getData());
  } else {
    println("error");
    return;
  }
  
  //print(baseTitle);
  taskTitleArray.add(baseTitle);
  ArrayList base = new ArrayList<String>();
  print(dateTime.get(Calendar.YEAR)+"-");
  base.add(str(dateTime.get(Calendar.YEAR)));
  print(dateTime.get(Calendar.MONTH)+"-");
  base.add(str(dateTime.get(Calendar.MONTH)));
  print(dateTime.get(Calendar.DATE)+" ");
  base.add(str(dateTime.get(Calendar.DATE)));
  print(dateTime.get(Calendar.HOUR_OF_DAY)+":");
  base.add(str(dateTime.get(Calendar.HOUR)));
  println(dateTime.get(Calendar.MINUTE));
  base.add(str(dateTime.get(Calendar.MINUTE)));
  
  base.add(str(dateTime.get(Calendar.YEAR)));
  base.add(str(dateTime.get(Calendar.MONTH)));
  base.add(str(dateTime.get(Calendar.DATE)));
  base.add(str(dateTime.get(Calendar.HOUR)));
  base.add(str(dateTime.get(Calendar.MINUTE)));
  
  base.add(str(dateTime.get(Calendar.YEAR)));
  base.add(str(dateTime.get(Calendar.MONTH)));
  base.add(str(dateTime.get(Calendar.DATE)));
  base.add(str(dateTime.get(Calendar.HOUR)));
  base.add(str(dateTime.get(Calendar.MINUTE)));
  
  base.add(str(dateTime.get(Calendar.YEAR)));
  base.add(str(dateTime.get(Calendar.MONTH)));
  base.add(str(dateTime.get(Calendar.DATE)));
  base.add(str(dateTime.get(Calendar.HOUR)));
  base.add(str(dateTime.get(Calendar.MINUTE)));
  
  dataBase.add(base);
  dataCount++;
  output_setup();
  println("success");
}
