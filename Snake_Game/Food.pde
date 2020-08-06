class Food {
  float x;
  float y;
  
  void pickLocation() {
    float cols = floor(width/scl);
    float rows = floor(height/scl);
    x = floor(random(cols)) * scl;
    y = floor(random(rows)) * scl;   
  }
  
  void show() {
    fill(255,0,255);
    rect(x,y,scl,scl);
  }
}
