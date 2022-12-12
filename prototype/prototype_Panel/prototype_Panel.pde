import java.sql.Timestamp;

Timestamp dateTime;
Panel panel;


float screen_ratio = 0.9;
void setup(){
  size(540, 960);
  dateTime = new Timestamp(System.currentTimeMillis());
  panel = new Panel(20, 30, width, screen_ratio, dateTime);
}

void draw(){
  background(255);
  panel.draw();
  
}
