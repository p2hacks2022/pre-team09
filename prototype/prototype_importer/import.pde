/*class importer {
  String textName;
  int cx;
  int cy;
  int cw;
  int ch;


  importer(String title, int x, int y, int w, int h) {
    textName = title;
    cx = x;
    cy = y;
    cw = w;
    ch = h;
  }
  void setup() {
    Canvas canvas = (Canvas) surface.getNative();
    pane = (JLayeredPane) canvas.getParent().getParent();

    field = new JTextField();
    field.setBounds(cx, cy, cw, ch);
    pane.add(field);
    field.setText(textName);
  }
  void mouseClicked() {
    if (mouseX>500 && mouseX<540&&mouseY>900&&mouseY<940) {
      taskData = field.getText();
      field.setText("");
    }
  }
}*/
