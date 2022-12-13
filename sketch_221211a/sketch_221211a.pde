String title;  //画面のタイトル
int disp; //switch用の画面の番号
float achive_all; //達成率
PFont fontEN40, fontEN25, fontJP40, fontJP25;  //フォント
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;  //色

void setup() {  
  size(540, 960);
  background(colorWhite);
  noStroke();
  noFill();

  fontEN40 = createFont("OpenSans-Regular.ttf", 40);
  fontEN25 = createFont("OpenSans-Regular.ttf", 25);
  fontJP40 = createFont("mgenplus-1c-heavy.ttf", 40);
  fontJP25 = createFont("mgenplus-1c-regular.ttf", 25);
  
  disp = 1;
  achive_all = 80;
}

void draw() {
  switch(disp) {
  case 1:
    title = "リマインド";
    textFont(fontJP40);
    textAlign(LEFT, TOP);
    fill(colorBlack);
    text(title, 20, 10);

    textFont(fontJP25);
    textAlign(RIGHT, BOTTOM);
    text("達成率", width - 145, 60);
    textFont(fontEN40);
    text(nf(achive_all, 0, 1), width - 42, 65);
    textFont(fontEN25);
    text("%", width - 20, 60);
    fill(colorGray);
    rect(20, 60, width - 20 * 2, 20);
    fill(colorMain);
    rect(20, 60, (width - 20 * 2) / 100 * achive_all, 20);
    
    fill(colorGray);
    rect(20, 100, width - 20 * 2, 20);
    fill(colorWhite);
    triangle(width / 2, 105, width / 2 - 5, 115, width / 2 + 5, 115);
    
    int day = 1; //仮の初日
    for(int i = 0; i < 12; i++){
      textFont(fontEN40);
      textAlign(CENTER, TOP);
      fill(colorBlack);
      text(day, 50, 130 + i * 60);
      day += 1;
      stroke(colorBlack);
      strokeWeight(2);
      if(i != 11){
        line(20, 185 + i * 60, width - 20, 185 + i * 60);
      }
    }
    noStroke();
    
    fill(colorSub);
    rect(20, height - 100, width - 20 * 2, 20);
    fill(colorBlack);
    triangle(width / 2, height - 85, width / 2 - 5, height - 95, width / 2 + 5, height - 95);
  }
}
