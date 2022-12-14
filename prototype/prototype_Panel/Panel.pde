abstract class UI {
 float x, y, w, h; 
}

class Panel extends UI{//もしかするとextends Taskになる可能性あり？
  Timestamp  dateTime;
  
  Panel(float x, float y, float w, float h, Timestamp dateTime){
    //インスタンス：座標大きさ(x,y,w,h), 年月日日(dateTime)
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.dateTime = dateTime;
  }
  Panel(float y, float h, int width, float screen_ratio,  Timestamp dateTime){
    //インスタンス：座標(y), 高さ<(h)>, 幅<画面幅(width), パネルの画面幅比(scree_ratio)>,  年月日日(dateTime)
    this.x = width*(1 - screen_ratio)/2;
    this.y = y;
    this.w = width*screen_ratio;
    this.h = h;
    this.dateTime = dateTime;
  }
  
  int getCount;
  
  void mouseWheel(MouseEvent event){
    getCount = event.getCount();
    this.y += getCount * 5;//スクロールの動きを滑らかにする
    println(getCount);
  }
  
  void draw(){
    
    fill(255);
    for(int i = 0; i<14;i++){
        line(this.x, this.y + h + 15 + i*60, this.x + w, this.y + h + 15 + i*60);
        //rect(this.x,this.y,this.w,this.h);
    }
    fill(0);
    
    
    /*textボックスのクラスが必要！！*/
    //日付表示
    for(int k = 0; k<14; k++){
      textSize(40);
      text(this.dateTime.getDate() + k, this.x, this.y + k*60);
    }
    
    //タスク表示
      //ラベル（タスクの属性...予定or締切or予測)
      //時刻
      
     //println(this.dateTime);
      /*stroke(colorBlack);
      strokeWeight(2);
      if (i != 11) {
        line(20, 185 + i * 60, width - 20, 185 + i * 60);  //区切り線
      }
      noStroke();*/
    }
  }
}


//タスク管理
class Task {
  String taskTitle;
  Timestamp yearDateTime;
  
  
}
