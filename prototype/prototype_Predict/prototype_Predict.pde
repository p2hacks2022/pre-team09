import java.util.Calendar;
import java.util.ArrayList;

Calendar DateA, DateB;

float degreeOfConfidence = 0.5;

void setup(){
  DateA = Calendar.getInstance();
  DateB = Calendar.getInstance();
  
  //予定...12/10 19:00までに
  DateA.set(2022, 11, 10, 12, 0);
  
  //締切...12/30 12:00
  DateB.set(2022, 11, 30, 12, 0);
  
  //推測
  Calendar predictDate = predict(DateA, DateB, degreeOfConfidence);
  
  println("timeA",  DateA.get(Calendar.HOUR_OF_DAY) + ":"+DateA.get(Calendar.MINUTE));
  println("dateA:",DateA.get(Calendar.MONTH)+1 + "/" + DateA.get(Calendar.DAY_OF_MONTH));
  println("dateB:",    DateB.get(Calendar.MONTH)+1 + "/" + DateB.get(Calendar.DAY_OF_MONTH));
  println("予測",     predictDate.get(Calendar.MONTH)+1 + "/" +predictDate.get(Calendar.DAY_OF_MONTH));
  println("予測時間:",predictDate.get(Calendar.HOUR_OF_DAY) + ":"+predictDate.get(Calendar.MINUTE));
/*
 if(DateB > DateA){
   println("GOOD");
 }*/
}

void draw(){
}
