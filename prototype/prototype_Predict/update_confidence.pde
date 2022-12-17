/*
メソッド：信用度を変更する
引数：信用度(float), 予定日時ArrayList、締切ArrayList、推測ArrayList,終了ArrayList, 完了ラベル配列(int...0 or 1)
パラメータ：
alpha_prePlan(予定前に完了したときのパラメータ)
alpha_postPlan (予定後・推測前に完了したときのパラメータ)
beta_preDeadline(推測後・締切前に完了したときのパラメータ)
beta_postDeadline (締切を超過したときのパラメータ)
*/

void setupConfidence(float degreeOfConfidence, ArrayList<Calendar>  planDateArray ,ArrayList<Calendar> deadlineDateArray, ArrayList<Calendar> predictDateArray, ArrayList<Calendar> finishDateArray,boolean isDone[]){
  float alpha_prePlan = 0.3;
  float alpha_postPlan = 0.1;
  float beta_preDeadline = 0.1;
  float beta_postDeadline = 0.4;
  
  for(int i=0; i < planDateArray.size(); i++){
    //float incliment;
    float alpha = 0, beta = 0;
    if(isDone[i] == true){
      //changeParam();
    }
    
    //締切超過していたら、信用度をだいぶ下げる。（使用パラメータ：beta_postDeadline)
    if(isPreDate(finishDate, deadlineDate) == false){
      beta = beta_postDeadline;
    }
    
    float r = degreeOfConfidence;
    degreeOfConfidence = r + (1 - r)*alpha - r*beta;
  }
}

void updateConfidence(ArrayList<Calendar>  planDateArray ,ArrayList<Calendar> deadlineDateArray, ArrayList<Calendar> predictDateArray, ArrayList<Calendar> finishDateArray){
  if(isDone[i] == true){
      //changeParam();
    }
    
    float r = degreeOfConfidence;
    degreeOfConfidence = r + (1 - r)*alpha - r*beta;
  }
}


void changeParam(float alpha, float beta, Calendar planDate, Calendar deadlineDate, Calendar predictDate, Calendar fianishDate){
  if(isPreDate(finishDate, planDate) == true){
    //予定前に完了していたら、信用度を普通に上げる。（使用パラメータ：alpha_prePlan）
    alpha = alpha_prePlan;
  }else if(isPreDate(finishDate, predictDate) == true){
    //予定後・推測前に完了していたら、信用度を少し上げる。（使用パラメータ：alpha_postPlan）
    alpha = alpha_postPlan;
  }else if(isPreDate(finishDate, deadlineDate) == true){
    //推測後・締切前に完了していたら、信用度を少し下げる。（使用パラメータ：beta_preDeadline）
    beta = beta_preDeadline;
  }
}
