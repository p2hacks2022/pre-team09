void doneTask(){
  Calendar nowDate;
  nowDate = Calendar.getInstance();
  
  //完了日時を入れて、isDoneにラベルを付ける。
  finishDateArray.set(targetIndex, nowDate);
  isDone.set(targetIndex, 1);
  println("isDone:",isDone.get(targetIndex));
  
  //信用度を更新
  updateConfidence(degreeOfConfidence, planDateArray.get(targetIndex) ,deadlineDateArray.get(targetIndex), predictDateArray.get(targetIndex),nowDate);
}
