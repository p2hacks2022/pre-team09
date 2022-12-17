

void page01_Panel_setup(){
  setupPanel();//パネルを初期化
  for(int i=0; i<panelArray.size(); i++){
    panelArray.get(i).getTaskDate(taskTitleArray, planDateArray, deadlineDateArray, predictDateArray, isDone);
  }
}

void page01_Panel_draw(){
  
  for(TaskPanel panel_this : panelArray){
    panel_this.getTaskDate(taskTitleArray, planDateArray, deadlineDateArray, predictDateArray, isDone);
    panel_this.draw();
  }
  fill(colorWhite);
  rect(0,0, width, 100);
  rect(0,height - 100, width, 100);
  plusButton.draw();
  
}

void page01_Panel_mouseClicked(){
  plusButton.mousePressed();
  for(int i=0; i<panelArray.size(); i++){
    targetIndex = panelArray.get(i).taskIndex;
    panelArray.get(i).mousePressed();//ページ遷移
  }
}
