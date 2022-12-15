PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;
color color_main=#40b0a0, color_sub=#a0f0d0, color_attention=#c03050, color_white=#ffffff, color_black=#303030, color_gray=#d0d0d0;


void setup() {
  size(540, 960);
  open_sans_regular  = createFont("OpenSans-Regular.ttf", 40);//数字
  mgenplus_regular = createFont("mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("mgenplus-1c-heavy.ttf", 40);//にほんご
  textAlign(LEFT, TOP);
}

void draw() {
  frameRate(1);//処理重くて開けないからその対策
  noStroke();
  fill(color_white);
  rect(0, 0, 540, 960);//背景白
  fill(color_black);
  textFont(mgenplus_heavy);
  text("入力", 30, 25);//入力文字列
  header_rect(color_sub,100);//タイトル頭
  under_line(140);//タイトル下線
  fill(color_black);
  mgenplus_regular = createFont("mgenplus-1c-regular.ttf", 30);
  textFont(mgenplus_regular);
  text("内容",40,100);//タイトル指示
  header_rect(color_sub,200);//ジャンル頭
  under_line(240);//ジャンル下線
  fill(color_black);
  textFont(mgenplus_regular);
  text("ジャンル",40,200);//ジャンル
  noStroke();
  fill(color_gray);
  rect(475,205,30,30);//選択の箱
  fill(color_black);
  triangle(480,210,500,210,490,230);//選択の矢印
  header_rect(color_black,360);//予定頭
  text("予定",40,360);//予定
  text("年",280,360);
  text("月",380,360);
  text("日",480,360);
  under_line(400);//予定下線
  header_rect(color_attention,460);//締め切り頭
  fill(color_black);
  text("締め切り",40,460);//締め切り
  text("年",280,460);
  text("月",380,460);
  text("日",480,460);
  under_line(500);//締め切り下線
  
  noStroke();
  fill(color_main);
  rect(50,880,180,50);
  fill(color_white);
  text("完了",115,880);
  
  fill(color_sub);
  rect(250,880,180,50);
  fill(color_black);
  text("決定",305,880);
  
  fill(color_sub);
  rect(450,870,70,70); 
  stroke(color_black);
  line(465,885,505,925);
  line(465,925,505,885);
}

void header_rect(color headerColor,int headerIchi){
  noStroke();
  fill(headerColor);
  rect(30, headerIchi, 10, 40);//タイトル頭
}

void under_line(int underLine){
  stroke(color_black);
  strokeWeight(3);
  line(30,underLine,510,underLine);
}
