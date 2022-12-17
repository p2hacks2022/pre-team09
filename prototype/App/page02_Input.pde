import javax.swing.*;
import java.awt.*;
import java.util.Calendar;
import javax.swing.JTextField;
import javax.swing.JComponent;
Calendar dateTime;
JLayeredPane pane;
JTextField[] field;

String[] textInput = new String[11];
String errorMessage = "";

BoxButton Button_kanryo, Button_kettei;

void page02_Input_setup() {
  namuru_input_setup();
  Button_kettei = new TextBoxButton("決定", colorBlack, 25, 20, height - 70, 200, 50, colorSub);
}

void page02_Input_draw() {
  namuru_input_draw();
  batuButton.draw();
}

void page02_Input_mouseClicked() {
  Button_kettei.mousePressed();
  batuButton.mousePressed();
}

void namuru_input_setup() {
  rect(500, 900, 40, 40);
  dateTime = Calendar.getInstance();

  open_sans_regular  = createFont("fonts/OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("fonts/mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("fonts/mgenplus-1c-heavy.ttf", 40);

  // SmoothCanvasの親の親にあたるJLayeredPaneを取得
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();



  // 1行のみのテキストボックスを作成
  field = new JTextField[11];
  for (int i = 0; i < 11; i++) {
    field[i] = new JTextField("", 30);
    field[i].setPreferredSize(new Dimension(100, 200));
    pane.add(field[i]);
  }
}


void namuru_input_draw() {
  background(colorWhite);
  textFont(mgenplus_heavy);//テキストボタンは、.draw前にフォントを指定する。
  Button_kettei.draw();

  String title = "入力";  //画面のタイトル
  textFont(mgenplus_heavy, 40);
  textAlign(LEFT, BOTTOM);
  fill(colorBlack);
  text(title, 20, 100);  //タイトルを表示

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

  textFont(mgenplus_regular, 15);//エラー文を表示
  fill(colorAttention);
  textAlign(LEFT, BOTTOM);
  text(errorMessage, 50, 580 );
}


void decisionInput() {
  String instance;
  boolean check = false;
  for (int i = 0; i < 11; i++) {
    instance = null;
    instance = field[i].getText();
    int usage = i%5 ;
    if (instance == null) {//入力に空欄があればfalse
      println("space in");
      check = false;
      break;
    } else if (usage == 1) {//年の判定
      //4桁以下または数値以外ならfalseを返す
      if (int(instance) < 1000 || int(instance)==0) {
        check = false;
        break;
      }
    } else if (usage > 1) {//年以外の判定
      //2桁では無かったらfalseを返す
      if (int(instance)>100) {
        check = false;
        break;
      }
    } else if (usage == 2) {//月の判定
      //月と認識できなければfalseを返す
      if (int(instance)<13 || int(instance) == 0) {
        check = false;
        break;
      }
    } else if (usage == 3) {//日の判定
      //日と認識できなければfalseを返す
      if (int(instance) > 31 || int(instance)==0) {
        check = false;
        break;
      }
    } else if (usage == 4) {//時の判定
      //時と認識できなければfalseを返す。
      if (int(instance) > 25) {
        check = false;
        break;
      }
    } else if (usage == 5) {//分の判定
      //分と認識できなければfalseを返す。
      if (int(instance) >60) {
        check = false;
        break;
      }
    } else {
      check = true;
    }
  }
  if (check) {
    println("sucess");
    for (int i = 0; i<11; i++) {
      textInput[i] = field[i].getText();
    }
    errorMessage ="";
    addArray();
    for (int i = 0; i < 11; i++) {
      field[i].setBounds(800, -100, 300, 45);
    }
  } else {
    errorMessage ="※未記入欄または不適切な入力があります。";
    println("it's not over");
  }
}


void addArray() {
  String inputTitle = textInput[0];

  //input用の日時をインスタンス
  Calendar inputPlanDate, inputDeadlineDate;
  inputPlanDate = Calendar.getInstance();
  inputDeadlineDate = Calendar.getInstance();

  inputPlanDate.set(int(textInput[1]), int(textInput[2])-1, int(textInput[3]), int(textInput[4]), int(textInput[5]));
  inputDeadlineDate.set(int(textInput[6]), int(textInput[7])-1, int(textInput[8]), int(textInput[9]), int(textInput[10]));

  println(inputPlanDate.get(Calendar.DATE));

  //inputPlanDate...入力された予定日時、inputDeadlineDate..入力された締切日時
  //推測日時を算出
  Calendar predictDate = predict(inputPlanDate, inputDeadlineDate, degreeOfConfidence);

  //finishDateに仮置きする日付
  Calendar prefinishDate;
  prefinishDate = Calendar.getInstance();
  prefinishDate.set(Calendar.YEAR, 1000);



  //タスクタイトルを追加
  taskTitleArray.add(textInput[0]);
  println(taskTitleArray.get(0));
    println(taskTitleArray.get(1));

  //それぞれの日時をカレンダーArrayListに追加
  planDateArray.add(inputPlanDate);
  deadlineDateArray.add(inputDeadlineDate);
  predictDateArray.add(predictDate);
  finishDateArray.add(prefinishDate);

  //未完了を追加
  isDone.add(0);
  
  
  //println(planDateArray.get(1).get(Calendar.DATE));
}
/*
float degreeOfConfidence = 0.5;
 //inputTitle(String)
 //inputPlanDate...入力された予定日時、inputDeadlineDate..入力された締切日時
 void addArrayList(){
 //推測日時を算出
 Calendar predictDate = predict(inputPlanDate, inputDeadlineDate, degreeOfConfidence);
 
 //finishDateに仮置きする日付
 Calendar prefinishDate;
 prefinishDate = Calendar.getInstance();
 prefinishDate.set(Calendar.YEAR, 1000);
 
 
 
 //タスクタイトルを追加
 taskTitleArray.add(inputTitle);
 
 //それぞれの日時をカレンダーArrayListに追加
 planDateArray.add(inputPlanDate);
 deadlineDateArray.add(inputDeadlineDate);
 predictDateArray.add(predictDate);
 finishDateArray.add(prefinishDate);
 
 //未完了を追加
 isDone.add(0);
 }*/
