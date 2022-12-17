import javax.swing.*;
import java.awt.*;
import java.util.Calendar;
import javax.swing.JTextField;
import javax.swing.JComponent;
Calendar dateTime;
JLayeredPane pane;
JTextField[] field;

BoxButton Button_kanryo, Button_kettei;

void page02_Input_setup(){
  namuru_input_setup();
}

void page02_Input_draw(){
  namuru_input_draw();
  batuButton.draw();
}

void page02_Input_mouseClicked(){
  Button_kanryo.mousePressed();
  Button_kettei.mousePressed();
  batuButton.mousePressed();
}

void namuru_input_setup(){
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


void namuru_input_draw(){
  background(colorWhite);
  textFont(mgenplus_heavy);//テキストボタンは、.draw前にフォントを指定する。
  Button_kanryo.draw();
  Button_kettei.draw();

  String title = "入力";  //画面のタイトル
  textFont(mgenplus_heavy, 40);
  textAlign(LEFT, TOP);
  fill(colorBlack);
  text(title, 20, 10);  //タイトルを表示

  int formbox_y;
  formbox_y = 200;

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

  formbox_y += 100;

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
  
  formbox_y += 150;

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

/*class TextBoxButton extends BoxButton{
  String text;//文字
  color textColor;//文字色
  int textSize;//文字のサイズ
  TextBoxButton(String _text, color _textColor, int _textSize, float _x, float _y, float _w, float _h, color _c){
    //コンストラクタ：文字(text), 文字色(textColor), 文字のサイズ(textSize), 座標大きさ(x,y,w,h), ボックスの色(c);
    super(_x, _y, _w, _h, _c);//Buttonクラスのコンストラクタを継承
    this.text = _text;
    this.textColor = _textColor;
    this.textSize = _textSize;
  }
  
  void draw(){
    //マウス上の時の枠線表示
    //ボックスの表示
    super.draw();//BoxButtonクラスのdraw()を継承
    
    //テキストを表示
    textBox(text, textColor, textSize, this.x, this.y, this. w, this.h);
  }
  void mousePressed(){
    super.mousePressed();
   String instance;
    for (int i = 0; i < field.length; i++) {
      instance = field[i].getText();
      int usage = i%5 ;
      if (instance == null) {//入力に空欄があればfalse
        success = false;
        break;
      } else if (usage == 1) {//年の判定
        //4桁以下または数値以外ならfalseを返す
        if (int(instance) < 1000 || int(instance)==0) {
          success = false;
          break;
        }
      } else if (usage > 1) {//年以外の判定
        //2桁では無かったらfalseを返す
        if (int(instance)>100) {
          success = false;
          break;
        }
      } else if (usage == 2) {//月の判定
        //月と認識できなければfalseを返す
        if (int(instance)<13 || int(instance) == 0) {
          success = false;
          break;
        }
      } else if (usage == 3) {//日の判定
        //日と認識できなければfalseを返す
        if (int(instance) > 31 || int(instance)==0) {
          success = false;
          break;
        }
      } else if (usage == 4) {//時の判定
        //時と認識できなければfalseを返す。
        if (int(instance) > 25) {
          success = false;
          break;
        }
      } else if (usage == 5) {//分の判定
        //分と認識できなければfalseを返す。
        if (int(instance) >60) {
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
      dateTime.set(Calendar.MONTH, int(textName[2]));
      dateTime.set(Calendar.DATE, int(textName[3]));
      dateTime.set(Calendar.HOUR, int(textName[4]));
      dateTime.set(Calendar.MINUTE, int(textName[5]));
    } else {
      print("it's not over");
    } 
  }
}*/
