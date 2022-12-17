int data_total;
int dataCount;
int data_genre;

void input_process() {
  
  data_total = import_csv.getRowCount(); //行数（データの総数）
  dataCount = import_csv.getRowCount();
  data_genre = import_csv.getColumnCount();//列数
  
  isDone = new boolean[data_total];//データの総数を受けてisDone配列を確保
  
  
  //taskTitleArrayにcsvの一列、isDoneにcsvの21列目を入れる。
  for (int i = 0; i < data_total; i++) {
    taskTitleArray.add(import_csv.getString(i, 0));
    
    //dataBaseにcsvの２列目から２０列目までを挿入
    ArrayList base = new ArrayList<String>();
    for (int j = 1; j < data_genre-1; j++) {
      base.add(import_csv.getString(i, j));
    }
    dataBase.add(base);//追加
    
    //２１列目（完了か否か）をisDone(boolean配列)に入れる。
    if(dataBase.get(i).get(19) == "0"){
      isDone[i] = false;
    }else if(dataBase.get(i).get(19) =="1"){
      isDone[i] = true;
    }
  }
  for (int i=0; i<data_total; i++) {
    dataBase_to_Array(dataBase, planDateArray, i, 0);
    dataBase_to_Array(dataBase, deadlineDateArray, i, 5);
    dataBase_to_Array(dataBase, predictDateArray, i, 10);
    dataBase_to_Array(dataBase, finishDateArray, i, 5);
  }
}


void dataBase_to_Array(ArrayList <ArrayList <String>> dataBase, ArrayList<Calendar> DateArray, int dataIndex, int startIndex){
    Calendar instanceDate;
    instanceDate = Calendar.getInstance();
    DateArray.add(instanceDate);
    DateArray.get(dataIndex).set(Calendar.YEAR,           int(dataBase.get(dataIndex).get(startIndex+0)));
    DateArray.get(dataIndex).set(Calendar.MONTH,          int(dataBase.get(dataIndex).get(startIndex+1)));
    DateArray.get(dataIndex).set(Calendar.DATE,           int(dataBase.get(dataIndex).get(startIndex+2)));
    DateArray.get(dataIndex).set(Calendar.HOUR_OF_DAY,    int(dataBase.get(dataIndex).get(startIndex+3)));
    DateArray.get(dataIndex).set(Calendar.MINUTE,         int(dataBase.get(dataIndex).get(startIndex+4)));
}

/*

Calendar instance;
    
    //plan...0から
    instance = Calendar.getInstance();
    planDateArray.add(instance);
    planDateArray.get(i).set(Calendar.YEAR,           int(dataBase.get(i).get(0)));
    planDateArray.get(i).set(Calendar.MONTH,          int(dataBase.get(i).get(1)));
    planDateArray.get(i).set(Calendar.DATE,           int(dataBase.get(i).get(2)));
    planDateArray.get(i).set(Calendar.HOUR_OF_DAY,    int(dataBase.get(i).get(3)));
    planDateArray.get(i).set(Calendar.MINUTE,         int(dataBase.get(i).get(4)));
    //println(int(dataBase.get(i).get(0)));
    
    //deadline...5から
    instance = Calendar.getInstance();
    deadlineDateArray.add(instance);
    deadlineDateArray.get(i).set(Calendar.YEAR,       int(dataBase.get(i).get(5)));
    deadlineDateArray.get(i).set(Calendar.MONTH,      int(dataBase.get(i).get(6)));
    deadlineDateArray.get(i).set(Calendar.DATE,       int(dataBase.get(i).get(7)));
    deadlineDateArray.get(i).set(Calendar.HOUR_OF_DAY,int(dataBase.get(i).get(8)));
    deadlineDateArray.get(i).set(Calendar.MINUTE,     int(dataBase.get(i).get(9)));
    
    //pre...10から
    instance = Calendar.getInstance();
    predictDateArray.add(instance);
    predictDateArray.get(i).set(Calendar.YEAR,        int(dataBase.get(i).get(10)));
    predictDateArray.get(i).set(Calendar.MONTH,       int(dataBase.get(i).get(11)));
    predictDateArray.get(i).set(Calendar.DATE,        int(dataBase.get(i).get(12)));
    predictDateArray.get(i).set(Calendar.HOUR_OF_DAY, int(dataBase.get(i).get(13)));
    predictDateArray.get(i).set(Calendar.MINUTE,      int(dataBase.get(i).get(14)));
    
    
    //fin...15から
    instance = Calendar.getInstance();
    finishDateArray.add(instance);
    finishDateArray.get(i).set(Calendar.YEAR,         int(dataBase.get(i).get(15)));
    finishDateArray.get(i).set(Calendar.MONTH,        int(dataBase.get(i).get(16)));
    finishDateArray.get(i).set(Calendar.DATE,         int(dataBase.get(i).get(17)));
    finishDateArray.get(i).set(Calendar.HOUR_OF_DAY,  int(dataBase.get(i).get(18)));
    finishDateArray.get(i).set(Calendar.MINUTE,       int(dataBase.get(i).get(19)));
*/
