int page_num = 1; //ページ数

//フォント
PFont open_sans_regular, mgenplus_regular, mgenplus_heavy;

//色
color colorMain = #40b0a0, colorSub = #a0f0d0, colorAttention = #c03050, colorWhite = #ffffff, colorGray = #d0d0d0, colorBlack = #303030;

void setupFont() {
  open_sans_regular  = createFont("fonts/OpenSans-Regular.ttf", 40);
  mgenplus_regular = createFont("fonts/mgenplus-1c-regular.ttf", 40);
  mgenplus_heavy = createFont("fonts/mgenplus-1c-heavy.ttf", 40);
}


/*
タスクデータ関係
 */
 
//csv
Table import_csv;
ArrayList <ArrayList <String>> dataBase = new ArrayList<ArrayList<String>>();//csvの読み書きで一旦保持するための配列
void setupCsv(){
  import_csv = loadTable("taskData.csv");
  input_process();
}

//タスクタイトルを格納するArray
ArrayList<String> taskTitleArray;

//カレンダー型を格納するArray
ArrayList<Calendar> planDateArray; //予定日時のArray
ArrayList<Calendar> deadlineDateArray; //締切日時のArray
ArrayList<Calendar> predictDateArray; //推測日時のArray
ArrayList<Calendar> finishDateArray; //終了日時のArray

//完了したかどうかの配列
boolean isDone[];

void setupTaskDate() {
  taskTitleArray = new ArrayList<String>();

  planDateArray     = new ArrayList<Calendar>();
  deadlineDateArray = new ArrayList<Calendar>();
  predictDateArray  = new ArrayList<Calendar>();
  finishDateArray   = new ArrayList<Calendar>();
}

/*
パネル関係
 */
int panel_number = 20;
ArrayList<TaskPanel> panelArray;

void setupPanel() {
  panelArray = new ArrayList<TaskPanel>();
  Calendar today = Calendar.getInstance();//今日の時刻を取得
  for (int i=-panel_number; i< panel_number; i++) {//パネル配列を格納する
    Calendar inputDate = Calendar.getInstance();
    inputDate.set(Calendar.DATE, today.get(Calendar.DATE) + i);
    panelArray.add(new TaskPanel(50 + 55*i, 50, width, screen_ratio, inputDate));
  }
}
