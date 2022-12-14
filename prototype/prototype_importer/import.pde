/*import javax.swing.*;
import java.awt.*;
import java.util.Calendar;

Calendar dateTime;
JLayeredPane pane;
JTextField[] field;

String Title;
Calendar dataTime;
importer title;
importer year;

void setup() {
  size(540, 960);
  dateTime = Calendar.getInstance();
  field = new JTextField[6];
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();
  title = new importer(0, 50, 50, 300, 50);
  year =new importer(1,50,150,50,50);
  title.set();
  year.set();
}
void draw() {
}
void mouseClicked(){
  if(title.flag()){
    Title = title.getTitle();
  }
  if(year.flag()){
    dateTime.set(Calendar.YEAR,year.getData());
  }
  print(Title);
  println(dateTime.get(Calendar.YEAR));
}


class importer {
  int usage;//[タイトル、年、月、日、時、分]
  int cx;
  int cy;
  int cw;
  int ch;
  

  importer(int u, int x, int y, int w, int h) {
    
    usage = u;
    cx = x;
    cy = y;
    cw = w;
    ch = h;
  }
  
  void set() { 
    field[usage] = new JTextField("",40);
    field[usage].setBounds(cx, cy, cw, ch);
    pane.add(field[usage]);
    field[usage].setText("");
  }
  
  boolean flag() { 
    String instance;
    instance = field[usage].getText();
    if (instance == null) {//入力に空欄があればfalse
      return false;
    } else if (usage == 1 && (int(instance) < 1000 || int(instance)==0)) {
      //年の判定
      //4桁以下または数値以外ならfalseを返す
      return false;
    } else if (usage > 1 && int(instance)>100) {
      //年以外の判定
      //2桁では無かったらfalseを返す
      return false;
    } else if (usage == 2 && (int(instance)<13 || int(instance) == 0)) {
      //月の判定
      //月と認識できなければfalseを返す
      return false;
    } else if (usage == 3 && (int(instance) > 31 || int(instance)==0)) {
      //日の判定
      //日と認識できなければfalseを返す
      return false;
    } else if (usage == 4 && int(instance) > 25) {
      //時の判定
      //時と認識できなければfalseを返す。
      return false;
    } else if (usage == 5 && int(instance) >60) {
      //分の判定
      //分と認識できなければfalseを返す。
      return false;
    } else {
      return true;
    }
  }
  
  String getTitle() {
    String instance;
    instance = field[usage].getText();
    return instance;
  }
  
  int getData() {
    String instance;
    instance = field[usage].getText();
    int data;
    data = int(instance);
    return data;
  }
}*/
