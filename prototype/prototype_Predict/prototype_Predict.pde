import java.util.Calendar;
import java.util.ArrayList;

Calendar inputPlanDate, inputDeadlineDate;

float degreeOfConfidence = 0.5;
void setup(){
  inputPlanDate = Calendar.getInstance();
  inputDeadlineDate = Calendar.getInstance();
  
  //予定...12/10 19:00までに
  inputPlanDate.set(2022, 11, 10, 12, 0);
  
  //締切...12/30 12:00
  inputDeadlineDate.set(2022, 11, 30, 12, 0);
  println(inputDeadlineDate);
  
  //推測
  Calendar predictDate = predict(inputPlanDate, inputDeadlineDate, degreeOfConfidence);
  
  println("予定時間:",  inputPlanDate.get(Calendar.HOUR_OF_DAY) + ":"+inputPlanDate.get(Calendar.MINUTE));
  println("予定:",        inputPlanDate.get(Calendar.MONTH)+1 + "/" +inputPlanDate.get(Calendar.DAY_OF_MONTH));
  println("締切:",    inputDeadlineDate.get(Calendar.MONTH)+1 + "/" +inputDeadlineDate.get(Calendar.DAY_OF_MONTH));
  println("予測:",          predictDate.get(Calendar.MONTH)+1 + "/" +predictDate.get(Calendar.DAY_OF_MONTH));
  println("予測時間:",predictDate.get(Calendar.HOUR_OF_DAY) + ":"+predictDate.get(Calendar.MINUTE));
  println(predictDate.get(Calendar.MONTH));
  println(inputPlanDate.get(Calendar.MONTH));
}

void draw(){
}
