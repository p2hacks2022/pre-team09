Table import_csv;
ArrayList<String> taskTitleArray;
boolean Finished[];
ArrayList <ArrayList <String>> dataBase = new ArrayList<ArrayList<String>>();

int dataCount;
int data_total, data_genre;

ArrayList<Calendar> planDateArray;
ArrayList<Calendar> deadlineDateArray;
ArrayList<Calendar> predictDateArray;
ArrayList<Calendar> finishDateArray;

//行先


void input_setup() {
  planDateArray     = new ArrayList<Calendar>();
  deadlineDateArray = new ArrayList<Calendar>();
  predictDateArray  = new ArrayList<Calendar>();
  finishDateArray   = new ArrayList<Calendar>();
  taskTitleArray    = new ArrayList<String>();
  
  import_csv = loadTable("task.csv");
}
void input_process() {

  data_total = import_csv.getRowCount();
  dataCount = import_csv.getRowCount();
  data_genre = import_csv.getColumnCount();
  for (int i = 0; i < data_total; i++) {
    taskTitleArray.add(import_csv.getString(i, 0));
    ArrayList base = new ArrayList<String>();
    for (int j = 0; j < data_genre; j++) {
      base.add(import_csv.getString(i, j));
    }
    
    dataBase.add(base);
    println(dataBase.get(0).get(20));
    if(dataBase.get(i).get(20) == "0"){
      Finished[i] = false;
    }else if(dataBase.get(i).get(20) =="1"){
      Finished[i] = true;
    }
  }

  for (int i=1; i<data_total; i++) {
    planDateArray.get(i).set(Calendar.YEAR,           int(dataBase.get(i).get(0)));
    planDateArray.get(i).set(Calendar.MONTH,          int(dataBase.get(i).get(1)));
    planDateArray.get(i).set(Calendar.DATE,           int(dataBase.get(i).get(2)));
    planDateArray.get(i).set(Calendar.HOUR_OF_DAY,    int(dataBase.get(i).get(3)));
    planDateArray.get(i).set(Calendar.MINUTE,         int(dataBase.get(i).get(4)));
    
    deadlineDateArray.get(i).set(Calendar.YEAR,       int(dataBase.get(i).get(5)));
    deadlineDateArray.get(i).set(Calendar.MONTH,      int(dataBase.get(i).get(6)));
    deadlineDateArray.get(i).set(Calendar.DATE,       int(dataBase.get(i).get(7)));
    deadlineDateArray.get(i).set(Calendar.HOUR_OF_DAY,int(dataBase.get(i).get(8)));
    deadlineDateArray.get(i).set(Calendar.MINUTE,     int(dataBase.get(i).get(9)));
    
    predictDateArray.get(i).set(Calendar.YEAR,        int(dataBase.get(i).get(10)));
    predictDateArray.get(i).set(Calendar.MONTH,       int(dataBase.get(i).get(11)));
    predictDateArray.get(i).set(Calendar.DATE,        int(dataBase.get(i).get(12)));
    predictDateArray.get(i).set(Calendar.HOUR_OF_DAY, int(dataBase.get(i).get(13)));
    predictDateArray.get(i).set(Calendar.MINUTE,      int(dataBase.get(i).get(14)));
    
    finishDateArray.get(i).set(Calendar.YEAR,         int(dataBase.get(i).get(15)));
    finishDateArray.get(i).set(Calendar.MONTH,        int(dataBase.get(i).get(16)));
    finishDateArray.get(i).set(Calendar.DATE,         int(dataBase.get(i).get(17)));
    finishDateArray.get(i).set(Calendar.HOUR_OF_DAY,  int(dataBase.get(i).get(18)));
    finishDateArray.get(i).set(Calendar.MINUTE,       int(dataBase.get(i).get(19)));
  }
}
