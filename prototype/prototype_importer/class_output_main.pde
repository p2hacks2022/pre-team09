void output_setup() {
  
  for (int i=0; i<dataCount; i++) {
    dataBase.get(i).set(0,str(planDateArray.get(i).get(Calendar.YEAR)));
    dataBase.get(i).set(1,str(planDateArray.get(i).get(Calendar.MONTH)));
    dataBase.get(i).set(2,str(planDateArray.get(i).get(Calendar.DATE)));
    dataBase.get(i).set(3,str(planDateArray.get(i).get(Calendar.HOUR_OF_DAY)));
    dataBase.get(i).set(4,str(planDateArray.get(i).get(Calendar.MINUTE)));

    dataBase.get(i).set(5,str(deadlineDateArray.get(i).get(Calendar.YEAR)));
    dataBase.get(i).set(6,str(deadlineDateArray.get(i).get(Calendar.MONTH)));
    dataBase.get(i).set(7,str(deadlineDateArray.get(i).get(Calendar.DATE)));
    dataBase.get(i).set(8,str(deadlineDateArray.get(i).get(Calendar.HOUR_OF_DAY)));
    dataBase.get(i).set(9,str(deadlineDateArray.get(i).get(Calendar.MINUTE)));

    dataBase.get(i).set(10,str(predictDateArray.get(i).get(Calendar.YEAR)));
    dataBase.get(i).set(11,str(predictDateArray.get(i).get(Calendar.MONTH)));
    dataBase.get(i).set(12,str(predictDateArray.get(i).get(Calendar.DATE)));
    dataBase.get(i).set(13,str(predictDateArray.get(i).get(Calendar.HOUR_OF_DAY)));
    dataBase.get(i).set(14,str(predictDateArray.get(i).get(Calendar.MINUTE)));

    dataBase.get(i).set(15,str(finishDateArray.get(i).get(Calendar.YEAR)));
    dataBase.get(i).set(16,str(finishDateArray.get(i).get(Calendar.MONTH)));
    dataBase.get(i).set(17,str(finishDateArray.get(i).get(Calendar.DATE)));
    dataBase.get(i).set(18,str(finishDateArray.get(i).get(Calendar.HOUR_OF_DAY)));
    dataBase.get(i).set(19,str(finishDateArray.get(i).get(Calendar.MINUTE)));
  }
  
}
void output_process(){
  PrintWriter output_csv = createWriter("task.csv");
  for (int i = 0; i < dataCount; i++) {
    output_csv.print(taskTitleArray.get(i) + ',');
    for (int j = 0; j < data_genre; j++) {
      output_csv.print(dataBase.get(i).get(j) + ',');
    }
    if(dataBase.get(i).get(20) == "0"){
      output_csv.println(0);
    }else if(dataBase.get(i).get(20) =="1"){
      output_csv.println(1);
    }
  }
  output_csv.flush();
  output_csv.close();
}
