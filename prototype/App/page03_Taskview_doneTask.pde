void doneTask(){
  Calendar nowDate;
  nowDate = Calendar.getInstance();
  
  //完了日時を入れて、isDoneにラベルを付ける。
  finishDateArray.set(targetIndex, nowDate);
  isDone.set(targetIndex, 1);
  
  //信用度を更新
  
}

/*
//inputTitle(String)
//inputPlanDate...入力された予定日時、inputDeadlineDate..入力された締切日時
void addArrayList(){
  //推測日時を算出
  Calendar predictDate = predict(inputPlanDate, inputDeadlineDate, degreeOfConfidence);
  
  //finishDateに仮置きする日付
  Calendar prefinishDate;
  prefinishDate = Calendar.getInstance();
  prefinishDate.set(Calendar.YEAR, 1000);
  
  
  
  //タスクタイトルを追加
  taskTitleArray.add(inputTitle);
  
  //それぞれの日時をカレンダーArrayListに追加
  planDateArray.add(inputPlanDate);
  deadlineDateArray.add(inputDeadlineDate);
  predictDateArray.add(predictDate);
  finishDateArray.add(prefinishDate);
  
  //未完了を追加
  isDone.add(0);
}
*/
