
//color
color color_main = #40B0A0;
color color_sub = #A0F0D0;
color color_attemtion = #C03050;
color colour_white = #FFFFFF;
color colour_black = #303030;
color colour_gray = #D0D0D0;
String Title;

import javax.swing.*;
import java.awt.*;

JLayeredPane pane;
JTextField field;

void setup() {
  size(540, 960);
  rect(500,900,40,40);

  // SmoothCanvasの親の親にあたるJLayeredPaneを取得
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  // 1行のみのテキストボックスを作成
  field = new JTextField();
  field.setBounds(80, 100, 100, 100);
  pane.add(field);

  /* 複数行のテキストボックスを作成
  area = new JTextArea();
  area.setLineWrap(true);
  area.setWrapStyleWord(true);
  JScrollPane scrollPane = new JScrollPane(area);
  scrollPane.setBounds(10, 50, 150, 100);
  pane.add(scrollPane);
  */
}

void draw() {
  println( Title +","/*+ area.getText() */);
}

void keyPressed() {
  if (keyCode==ENTER) {
    field.setText("");
  }
}
void mouseClicked(){
  if(mouseX>500 && mouseX<540&&mouseY>900&&mouseY<940){
    Title = field.getText();
  }
}
