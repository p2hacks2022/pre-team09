Calendar predict(Calendar inputPlanDate, Calendar inputDeadlineDate, float degreeOfConfidence){
  //推測日時を保持するCalendarを取得
  Calendar predictDate;
  predictDate = Calendar.getInstance();
  predictDate.set(Calendar.DATE, inputPlanDate.get(Calendar.DATE));
  
  //一年のうち何日目か
  int planDay = inputPlanDate.get(Calendar.DAY_OF_YEAR);
  int deadlineDay = inputDeadlineDate.get(Calendar.DAY_OF_YEAR);
  
  //その日の何分目か
  int planMinute = inputPlanDate.get(Calendar.HOUR_OF_DAY)*60 + inputPlanDate.get(Calendar.MINUTE);
  int deadlineMinute = inputDeadlineDate.get(Calendar.HOUR_OF_DAY)*60 + inputDeadlineDate.get(Calendar.MINUTE);
  
  /*
  日数差を計算
  */
  int diffDay;
  //うるう年を考慮して、一年何日あるか。
  int planLengthYear = getLengthYear(inputPlanDate);
  //西暦何年か
  int planYear = inputPlanDate.get(Calendar.YEAR);
  int deadlineYear = inputDeadlineDate.get(Calendar.YEAR);
  if(planYear == deadlineYear){//予定の年と締切の年が同じとき
    diffDay = deadlineDay - planDay;
  }else{//予定の年と締切の年が異なるとき(今回は、一年後の予定のみ考慮する。)
    diffDay = (deadlineDay + planLengthYear) - planDay;
  }
  
  /*
  日数差を時間差に変換
  */
  int diffMinute = (diffDay*24*60 - planMinute) + deadlineMinute;
  
  /*
  推測時間(日)を計算
  */
  int predictMinute = int(inputPlanDate.get(Calendar.MINUTE) + diffMinute*(1-degreeOfConfidence));
  predictDate.set(Calendar.MINUTE, predictMinute);//足す
  return predictDate;
}

//うるう年を前提にして一年の長さを返す
int getLengthYear(Calendar Date){
  int year = 365;
  if(Date.get(Calendar.YEAR)%4 == 0){
    year = 366;
  }
  return year;
}
