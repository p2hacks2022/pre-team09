float x, y, w, h;
float r = 0.8;//ここは(算出した信頼度の値)/(100)を入れる

void setup(){
  size(540, 960);
}

void draw(){
  barDegreeOfConfidence(20,60,500,20,r);
}

void barDegreeOfConfidence(float x,float y,float w,float h,float r){//信頼度のバーを表示する
  noStroke();
  background(255);
  fill(200);
  rect(x,y,w,h);//元のバー
  fill(0,200,150);
  rect(x,y,w*r,h);//信頼度のバー
  /*バーの色はあとで変更する*/
}
