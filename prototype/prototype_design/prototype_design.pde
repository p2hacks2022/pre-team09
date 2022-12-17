String title;  //画面のタイトル
int disp; //switch用の画面の番号
float achive_all; //達成率
PFont fontEN40, fontEN35, fontEN25, fontJP40, fontJP30, fontJP25, fontJP20;  //フォント
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;  //色

void setup() {  
  size(540, 960);
  background(colorWhite);
  noStroke();
  noFill();

  fontEN40 = createFont("OpenSans-Regular.ttf", 40);
  fontEN35 = createFont("OpenSans-Regular.ttf", 35);
  fontEN25 = createFont("OpenSans-Regular.ttf", 25);
  fontJP40 = createFont("mgenplus-1c-heavy.ttf", 40);
  fontJP30 = createFont("mgenplus-1c-regular.ttf", 30);
  fontJP25 = createFont("mgenplus-1c-regular.ttf", 25);
  fontJP20 = createFont("mgenplus-1c-heavy.ttf", 20);

  disp = 1;
  achive_all = 80;
}

void draw() {
  switch(disp) {
  case 1:
    title = "リマインド";  //画面のタイトル
    textFont(fontJP40);
    textAlign(LEFT, TOP);
    fill(colorBlack);
    text(title, 20, 10);  //タイトルを表示

    textFont(fontJP25);
    textAlign(RIGHT, BOTTOM);
    text("信用度", width - 145, 60);  //信用度テキスト
    textFont(fontEN40);
    text(nf(achive_all, 0, 1), width - 42, 65);  //信用度の数字
    textFont(fontEN25);
    text("%", width - 20, 60);  //「%」を表示
    fill(colorGray);
    rect(20, 60, width - 20 * 2, 20);  //ゲージの灰色部分
    fill(colorMain);
    rect(20, 60, (width - 20 * 2) / 100 * achive_all, 20);  //ゲージの緑色部分

    fill(colorGray);
    rect(20, 100, width - 20 * 2, 20);  //ボタン(上)
    fill(colorWhite);
    triangle(width / 2, 105, width / 2 - 5, 115, width / 2 + 5, 115);  //上を表す三角形

    int kari_day = 1; //仮の初日 後で消えます
    int kari_hour = 0, kari_minute = 0;  //仮の時刻 後で消えます
    int kari_shubetsu = 0;
    String string_kari_shubetsu = "";

    for (int i = 0; i < 12; i++) {  //12日分を表示
      textFont(fontEN40);
      textAlign(CENTER, CENTER);
      fill(colorBlack);
      text(kari_day, 50, 150 + i * 60);  //日付を表示

      textFont(fontJP30);
      textAlign(LEFT, CENTER);
      fill(colorBlack);
      text("数学", 90, 150 + i * 60);  //項目名を表示

      if (kari_shubetsu == 0) {
        string_kari_shubetsu = "予定";
        fill(colorBlack);
      } else if (kari_shubetsu == 1) {
        string_kari_shubetsu = "推測";
        fill(colorMain);
      } else if (kari_shubetsu == 2) {
        string_kari_shubetsu = "締切";
        fill(colorAttention);
      }
      rect(width - 190, 140 + i * 60, 60, 30);  //種別の背景になる四角形を表示
      textFont(fontJP20);
      textAlign(RIGHT, CENTER);
      fill(colorWhite);
      text(string_kari_shubetsu, width - 140, 150 + i * 60);  //種別を表示

      String string_kari_hour = nf(kari_hour, 2, 0), string_kari_minute = nf(kari_minute, 2, 0);  //時刻(数値)を"00"型の文字列に変換
      textFont(fontEN35);
      textAlign(RIGHT, CENTER);
      fill(colorBlack);
      text(string_kari_hour + ":" + string_kari_minute, width - 30, 150 + i * 60);  //時刻を表示

      kari_day += 1;  //これは完成時消えます、見本用なので
      kari_hour += 7;  //これも完成時消えます
      kari_hour %= 24;  //これも完成時消えます
      kari_minute += 10;  //これも完成時消えます
      kari_minute %= 60;  //これも完成時消えます
      kari_shubetsu += 1;  //これも完成時消えます
      kari_shubetsu %= 3;  //これも完成時消えます

      stroke(colorBlack);
      strokeWeight(2);
      if (i != 11) {
        line(20, 185 + i * 60, width - 20, 185 + i * 60);  //区切り線
      }
      noStroke();
    }

    fill(colorSub);
    rect(20, height - 100, width - 20 * 2, 20);  //ボタン(下)
    fill(colorBlack);
    triangle(width / 2, height - 85, width / 2 - 5, height - 95, width / 2 + 5, height - 95);  //下を表す三角形
    
    fill(colorSub);
    rect(width - 70, height - 70, 50, 50);  //ボタン(追加)
    fill(colorBlack);
    rect(width - 47, height - 65, 3, 40);  //ボタン(プラスマーク縦)
    rect(width - 65, height - 47, 40, 3);  //ボタン(プラスマーク横)
  }
}
