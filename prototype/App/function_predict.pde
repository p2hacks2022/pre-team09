Calendar predict(Calendar inputPlanDate, Calendar inputDeadlineDate, float degreeOfConfidence){
  //推測日時を保持するCalendarを取得
  Calendar predictDate;
  predictDate = Calendar.getInstance();
  predictDate.set(Calendar.DATE, inputPlanDate.get(Calendar.DATE));
  
  int diffMinute = diffDateMinute(inputDeadlineDate, inputPlanDate);
  /*
  推測時間(日)を計算
  */
  int predictMinute = int(inputPlanDate.get(Calendar.MINUTE) + diffMinute*(1-degreeOfConfidence));
  predictDate.set(Calendar.MINUTE, predictMinute); //足す
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


//A-Bなので、AはBより大きい（より未来）
int diffDateMinute(Calendar A, Calendar B){

  int diffDay;
  //println(A.get(Calendar.DAY_OF_YEAR));
  int aYear = A.get(Calendar.YEAR);
  int bYear = B.get(Calendar.YEAR);
  
  //一年のうち何日目か
  int aDayOfYear = A.get(Calendar.DAY_OF_YEAR);
  int bDayOfYear = B.get(Calendar.DAY_OF_YEAR);
  
  int bLenOfDate = getLengthYear(B);
  
  //その日の何分目か
  int aMinute = A.get(Calendar.HOUR_OF_DAY)*60 + A.get(Calendar.MINUTE);
  int bMinute = B.get(Calendar.HOUR_OF_DAY)*60 + B.get(Calendar.MINUTE);
  
  //日数差
  if(aYear == bYear){//予定の年と締切の年が同じとき
    diffDay = aDayOfYear - bDayOfYear;
  }else{//予定の年と締切の年が異なるとき(今回は、一年後の予定のみ考慮する。)
    diffDay = (aDayOfYear + bLenOfDate) - bDayOfYear;
  }
  
  //分差
  int diffDateMinute = (diffDay*24*60 - bMinute) + aMinute;
  return diffDateMinute;
} //<>//

//DateAが前で、DateBが後ならtrueを返す
boolean isPreDate(Calendar DateA, Calendar DateB){
  boolean isPreDate = false;
  println(DateA.get(Calendar.DATE) , DateB.get(Calendar.DATE));
  //予定日と完了日を比較
  if(DateA.get(Calendar.YEAR) < DateB.get(Calendar.YEAR)){//年を比較
    isPreDate = true;
  }else if(DateA.get(Calendar.MONTH) < DateB.get(Calendar.MONTH)){
    isPreDate = true;
  }else if(DateA.get(Calendar.DATE) < DateB.get(Calendar.DATE)){//if(DateA.get(Calendar.DAY_OF_MONTH) < DateB.get(Calendar.DAY_OF_MONTH)){
    isPreDate = true;
  }else if (DateA.get(Calendar.HOUR_OF_DAY) < DateB.get(Calendar.HOUR_OF_DAY)){
    isPreDate = true;
  }else if(DateA.get(Calendar.MINUTE) < DateB.get(Calendar.MINUTE)){
    isPreDate = true;
  }
  
  return isPreDate;
}
