

void page01_Panel_setup(){
  setupPanel();//パネルを初期化
  taskInit();
}

void page01_Panel_draw(){
  
  for(TaskPanel panel_this : panelArray){
    //taskInit();
    panel_this.draw();
  }
  fill(colorWhite);
  rect(0,0, width, 120);
  rect(0,height - 100, width, 100);
  plusButton.draw();
  
  fill(colorBlack);
  textFont(open_sans_regular);
  textSize(50);
  textAlign(LEFT,CENTER);
  text("DesNe",  25, 10,300, 100);
  
  textFont(mgenplus_regular);
  textSize(20);
  textAlign(RIGHT,BOTTOM);
  text("あなたの信用度："+degreeOfConfidence*100+"%",  width-25, 3, -300, 100);
  barDegreeOfConfidence(width*(1 - screen_ratio)/2, 100, width*screen_ratio, 10,degreeOfConfidence);
}

void page01_Panel_mouseClicked(){
  plusButton.mousePressed();
  for(int i=0; i<panelArray.size(); i++){
    panelArray.get(i).mousePressed();//ページ遷移
  }
}

void taskInit(){
  for(int i=0; i<panelArray.size(); i++){
    panelArray.get(i).getTaskDate(taskTitleArray, planDateArray, deadlineDateArray, predictDateArray, isDone);
  }
}
