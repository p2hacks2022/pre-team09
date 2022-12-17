//ボタンのクラス
class Button extends UI {
  color c;

  Button(float _x, float _y, float _w, float _h, color _c) {
    //コンストラクタ:座標大きさ(_x,_y,_w,_h), 色(_c)
    super(_x, _y, _w, _h);
    this.c = _c;
  }

  void mouseOverStroke(String strokeType, color frameColor, float strokeWeight) {
    //マウスがボタンの上にある時に枠線を表示する関数
    //引数：strokeType...ボックスタイプの枠線("box")を、円タイプの枠線("circle")を入れる。
    if (isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)) {//マウスがボタン上にある判定
      if (strokeType == "box") {
        //ボックスタイプが"box"の時
        strokeWeight(strokeWeight);
        stroke(frameColor, 100);
        noFill();
        rect(this.x, this.y, this.w, this.h);//枠線表示
      } else if (strokeType == "circle") {
        //ボックスタイプが"circle"の時
        strokeWeight(strokeWeight);
        stroke(frameColor, 100);
        noFill();
        float r_hypotenuse = calcHypotenuse(w/2, h/2);
        ellipse(this.x + this.w/2, this.y + this.h/2, 2*r_hypotenuse, 2*r_hypotenuse);//枠線表示
      }
    }
  }

  void mousePressed() {
    //マウスが押された時に反応
    if (isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)) {
      println("Button!");
    }
  }
}


//ボックス(四角い)ボタンのクラス
class BoxButton extends Button {

  BoxButton(float _x, float _y, float _w, float _h, color _c) {
    super(_x, _y, _w, _h, _c);//Buttonクラスのコンストラクタを継承
  }

  void draw() {
    //マウス上の時の枠線表示
    super.mouseOverStroke("box", colorSub, 20);//Buttonクラスから継承

    //ボックスを表示
    fill(this.c);
    stroke(0);
    strokeWeight(1);
    rect(this.x, this.y, this.w, this.h);
  }
  void mousePressed() {
    super.mousePressed();//ButtonクラスのmousePressed()を継承
  }
}


//テキスト付きのボックス(四角い)ボタンのクラス（完了ボタン、決定ボタン）
class TextBoxButton extends BoxButton {
  String text;//文字
  color textColor;//文字色
  int textSize;//文字のサイズ
  TextBoxButton(String _text, color _textColor, int _textSize, float _x, float _y, float _w, float _h, color _c) {
    //コンストラクタ：文字(text), 文字色(textColor), 文字のサイズ(textSize), 座標大きさ(x,y,w,h), ボックスの色(c);
    super(_x, _y, _w, _h, _c);//Buttonクラスのコンストラクタを継承
    this.text = _text;
    this.textColor = _textColor;
    this.textSize = _textSize;
  }

  void draw() {
    //マウス上の時の枠線表示
    //ボックスの表示
    super.draw();//BoxButtonクラスのdraw()を継承

    //テキストを表示
    textBox(text, textColor, textSize, this.x, this.y, this. w, this.h);
  }
  
  void mouseClicked(){
    if(isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)){
      if(page_num == 2){//入力ページの入力「決定」ボタン
        decisionInput();
      }else if(page_num == 3){//タスクビューのタスク「完了」ボタン
        doneTask();
      }
    }
  }
}


//プラス記号のボタンのクラス
class PlusButton extends BoxButton {
  float size;
  float line_weight = 0.1;  
  PlusButton(float _x, float _y, float _size, color _c) {
    //コンストラクタ:座標大きさ(_x,_y,_size), 色(_c)
    super(_x, _y, _size, _size, _c);
    this.size = _size;
  }

  void draw() {
    //マウス上の時の枠線表示
    super.mouseOverStroke("box", colorSub, 20);//Buttonクラスから継承

    //プラスの図形表示
    noStroke();
    fill(this.c);
    rect(this.x + this.w*(1-line_weight)/2, this.y, this.w*line_weight, this.h);
    rect(this.x, this.y + this.h*(1-line_weight)/2, this.w, this.h*line_weight);
  }

  void mousePressed() {
    super.mousePressed();//ButtonクラスのmousePressed()を継承;
    if(isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)){
      page_num = 2;//プラスボタンでは必ずページ２に遷移される。
    }
  }
}


//X(バツ)ボタンのクラス
class BatuButton extends BoxButton {
  float line_weight = 0.1;
  float size;
  BatuButton(float _x, float _y, float _size, color _c) {
    //コンストラクタ:座標大きさ(_x,_y,_size), 色(_c)
    super(_x, _y, _size, _size, _c);
    this.size = _size;
  }

  void draw() {
    //マウス上の時の枠線表示
    super.mouseOverStroke("circle", colorAttention, 8);//Buttonクラスから継承

    //X(バツ)の図形を表示
    fill(this.c);
    stroke(this.c);
    strokeWeight(this.w*line_weight);
    line(this.x, this.y, this.x + this.w, this.y + this.h);
    line(this.x, this.y + this.h, this.x + this.w, this.y);
  }

  void mousePressed() {
    super.mousePressed();//ButtonクラスのmousePressed()を継承;
    if(isOverMouse(mouseX, mouseY, this.x, this.y, this.w, this.h)){
      page_num = 1;//バツボタンでは必ずページ１に戻る。
    }
  }
}
