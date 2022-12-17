/*
メソッド：信用度を変更する
引数：信用度(float), 予定日時ArrayList、締切ArrayList、推測ArrayList,終了ArrayList, 完了ラベル配列(int...0 or 1)
パラメータ：
alpha_prePlan(予定前に完了したときのパラメータ)
alpha_postPlan (予定後・推測前に完了したときのパラメータ)
beta_preDeadline(推測後・締切前に完了したときのパラメータ)
beta_postDeadline (締切を超過したときのパラメータ)
*/

void setupConfidence(float degreeOfConfidence, ArrayList<Calendar>  planDateArray ,ArrayList<Calendar> deadlineDateArray, ArrayList<Calendar> predictDateArray, ArrayList<Calendar> finishDateArray,int isDone[]){
  Calendar Now;
  Now = Calendar.getInstance();
  for(int i=0; i < planDateArray.size(); i++){
    float incliment;
    
    //終了したかどうか
    if(){
      //予定前に完了していたら、信用度を普通に上げる。（使用パラメータ：alpha_prePlan）
      if(){
        
      }
      
      //予定後・推測前に完了していたら、信用度を少し上げる。（使用パラメータ：alpha_postPlan）
      if(){
        
      }
      
      //推測後・締切前に完了していたら、信用度を少し下げる。（使用パラメータ：beta_preDeadline）
      if(){
        
      }
    }
    
    //締切超過していたら、信用度をだいぶ下げる。（使用パラメータ：beta_postDeadline)
    if(){
    }
    
    
  }
}


void asappointment(degreeOfConfidence = degreeOfConfidence + incliment;){
  
}

void disappointment(){
  
}
