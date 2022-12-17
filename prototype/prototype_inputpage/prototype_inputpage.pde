
//color
color colorMain = #40B0A0;
color colorSub = #A0F0D0;
color colorAttention = #C03050;
color colorWhite = #FFFFFF;
color colorBlack = #303030;
color colorGray = #D0D0D0;

PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;

import javax.swing.*;
import java.awt.*;
import java.util.Calendar;
import javax.swing.JTextField;
import javax.swing.JComponent;

String Title;
String textName[] = {"tttt", "yyyy", "MM", "dd", "hh", "mm"};
boolean success;
BoxButton Button_kanryo, Button_kettei;

int s;

Calendar dateTime;
JLayeredPane pane;
JTextField[] field;



void setup() {
  size(540, 960);
  rect(500, 900, 40, 40);
  dateTime = Calendar.getInstance();

  open_sans_regular  = createFont("fonts/OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("fonts/mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("fonts/mgenplus-1c-heavy.ttf", 40);

  // SmoothCanvasの親の親にあたるJLayeredPaneを取得
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  Button_kanryo = new TextBoxButton("完了", colorWhite, 25, 20, height - 70, 200, 50, colorMain);
  Button_kettei = new TextBoxButton("決定", colorBlack, 25, 230, height - 70, 200, 50, colorSub);

  // 1行のみのテキストボックスを作成
  field = new JTextField[11];
  for (int i = 0; i < 11; i++) {
    field[i] = new JTextField("", 30);
    field[i].setPreferredSize(new Dimension(100, 200));
    pane.add(field[i]);
  }
}

void draw() {
  background(colorWhite);
  for (int i= 0; i<6; i++) {
    //println(textName[i]);
  }

  textFont(mgenplus_heavy);//テキストボタンは、.draw前にフォントを指定する。
  Button_kanryo.draw();
  Button_kettei.draw();

  String title = "入力";  //画面のタイトル
  textFont(mgenplus_heavy, 40);
  textAlign(LEFT, TOP);
  fill(colorBlack);
  text(title, 20, 10);  //タイトルを表示

  int formbox_y;
  formbox_y = 80;

  fill(colorSub);
  rect(20, formbox_y, 15, 50);
  stroke(colorBlack);
  strokeWeight(2);
  line(20, formbox_y + 50, width - 20, formbox_y + 50);  //区切り線
  line(width - 20, formbox_y, width - 20, formbox_y + 50);  //区切り線
  textFont(mgenplus_regular, 30);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("タイトル", 40, formbox_y + 45);  //タイトルを表示
  noStroke();
  field[0].setBounds(180, formbox_y, 300, 45);

  formbox_y += 200;

  fill(colorBlack);
  rect(20, formbox_y, 15, 100);
  stroke(colorBlack);
  strokeWeight(2);
  line(20, formbox_y + 100, width - 20, formbox_y + 100);  //区切り線
  line(width - 20, formbox_y, width - 20, formbox_y + 100);  //区切り線
  textFont(mgenplus_regular, 30);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("予定", 40, formbox_y + 45);
  noStroke();
  textFont(mgenplus_regular, 20);
  field[1].setBounds(180, formbox_y, 80, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("年", 260, formbox_y + 45);  //タイトルを表示
  field[2].setBounds(310, formbox_y, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("月", 360, formbox_y + 45);  //タイトルを表示
  field[3].setBounds(410, formbox_y, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("日", 460, formbox_y + 45);  //タイトルを表示
  field[4].setBounds(310, formbox_y + 50, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("時", 360, formbox_y + 95);  //タイトルを表示
  field[5].setBounds(410, formbox_y + 50, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("分", 460, formbox_y + 95);  //タイトルを表示
  
  formbox_y += 200;

  fill(colorAttention);
  rect(20, formbox_y, 15, 100);
  stroke(colorBlack);
  strokeWeight(2);
  line(20, formbox_y + 100, width - 20, formbox_y + 100);  //区切り線
  line(width - 20, formbox_y, width - 20, formbox_y + 100);  //区切り線
  textFont(mgenplus_regular, 30);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("締切", 40, formbox_y + 45);
  noStroke();
  textFont(mgenplus_regular, 20);
  field[6].setBounds(180, formbox_y, 80, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("年", 260, formbox_y + 45);  //タイトルを表示
  field[7].setBounds(310, formbox_y, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("月", 360, formbox_y + 45);  //タイトルを表示
  field[8].setBounds(410, formbox_y, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("日", 460, formbox_y + 45);  //タイトルを表示
  field[9].setBounds(310, formbox_y + 50, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("時", 360, formbox_y + 95);  //タイトルを表示
  field[10].setBounds(410, formbox_y + 50, 50, 45);
  fill(colorBlack);
  textAlign(LEFT, BOTTOM);
  text("分", 460, formbox_y + 95);  //タイトルを表示
}

//仮の入力完了
void mouseClicked() {
  if (mouseX>500 && mouseX<540&&mouseY>900&&mouseY<940) {
    
  }
}

void mousePressed() {
  Button_kanryo.mousePressed();
  Button_kettei.mousePressed();
}
