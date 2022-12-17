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
    Calendar instance;
    instance = Calendar.getInstance();
    planDateArray.add(instance);
    planDateArray.get(i).set(Calendar.YEAR,           int(dataBase.get(i).get(0)));
    planDateArray.get(i).set(Calendar.MONTH,          int(dataBase.get(i).get(1)));
    planDateArray.get(i).set(Calendar.DATE,           int(dataBase.get(i).get(2)));
    planDateArray.get(i).set(Calendar.HOUR_OF_DAY,    int(dataBase.get(i).get(3)));
    planDateArray.get(i).set(Calendar.MINUTE,         int(dataBase.get(i).get(4)));
    //println(int(dataBase.get(i).get(0)));
    /*
    planDateArray.get(i).set(Calendar.YEAR,           int(dataBase.get(i).get(0)));
    planDateArray.get(i).set(Calendar.MONTH,          int(dataBase.get(i).get(1)));
    planDateArray.get(i).set(Calendar.DATE,           int(dataBase.get(i).get(2)));
    planDateArray.get(i).set(Calendar.HOUR_OF_DAY,    int(dataBase.get(i).get(3)));
    planDateArray.get(i).set(Calendar.MINUTE,         int(dataBase.get(i).get(4)));
    */
    
    instance = Calendar.getInstance();
    deadlineDateArray.add(instance);
    deadlineDateArray.get(i).set(Calendar.YEAR,       int(dataBase.get(i).get(5)));
    deadlineDateArray.get(i).set(Calendar.MONTH,      int(dataBase.get(i).get(6)));
    deadlineDateArray.get(i).set(Calendar.DATE,       int(dataBase.get(i).get(7)));
    deadlineDateArray.get(i).set(Calendar.HOUR_OF_DAY,int(dataBase.get(i).get(8)));
    deadlineDateArray.get(i).set(Calendar.MINUTE,     int(dataBase.get(i).get(9)));
    
    instance = Calendar.getInstance();
    predictDateArray.add(instance);
    predictDateArray.get(i).set(Calendar.YEAR,        int(dataBase.get(i).get(10)));
    predictDateArray.get(i).set(Calendar.MONTH,       int(dataBase.get(i).get(11)));
    predictDateArray.get(i).set(Calendar.DATE,        int(dataBase.get(i).get(12)));
    predictDateArray.get(i).set(Calendar.HOUR_OF_DAY, int(dataBase.get(i).get(13)));
    predictDateArray.get(i).set(Calendar.MINUTE,      int(dataBase.get(i).get(14)));
    
    instance = Calendar.getInstance();
    finishDateArray.add(instance);
    finishDateArray.get(i).set(Calendar.YEAR,         int(dataBase.get(i).get(15)));
    finishDateArray.get(i).set(Calendar.MONTH,        int(dataBase.get(i).get(16)));
    finishDateArray.get(i).set(Calendar.DATE,         int(dataBase.get(i).get(17)));
    finishDateArray.get(i).set(Calendar.HOUR_OF_DAY,  int(dataBase.get(i).get(18)));
    finishDateArray.get(i).set(Calendar.MINUTE,       int(dataBase.get(i).get(19)));
  }
}
