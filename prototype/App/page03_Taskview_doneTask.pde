void doneTask(){
  Calendar nowDate;
  nowDate = Calendar.getInstance();
  
  //完了日時を入れて、isDoneにラベルを付ける。
  finishDateArray.set(targetIndex, nowDate);
  println(targetIndex);
  isDone.set(targetIndex, 1);
  println("isDone:",isDone.get(targetIndex));
  
  //信用度を更新
  degreeOfConfidence = updateConfidence(degreeOfConfidence, planDateArray.get(targetIndex) ,deadlineDateArray.get(targetIndex), predictDateArray.get(targetIndex),nowDate);
  println(degreeOfConfidence);
}
