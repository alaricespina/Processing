class Snake {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;
  int total = 0;
  float[] prevx = new float[1];
  float[] prevy = new float[1];
  boolean changed = false;


  //math
  void update() {
    if (changed) {
      prevx = append(prevx, x);
      prevy = append(prevy, y);
      changed = false;
    } else {
      prevx[total] = x;
      prevy[total] = y;
    }

    for ( int i = 0; i < prevx.length-1; i++) {
      prevx[i] = prevx[i+1];
      prevy[i] = prevy[i+1];
    }
    x = x + xspeed*scl;
    y = y + yspeed*scl;

    x = constrain(x, 0, width-scl);
    y = constrain(y, 0, height-scl);
  }

  //Show the Rectangle
  void show() {
    fill(255);

    for (int a = 0; a < total; a++) {
      rect(prevx[a], prevy[a], scl, scl);
    }


    rect(x, y, scl, scl);
  }

  //Set snake direction
  void dir(float tempxs, float tempys) {
    xspeed = tempxs;
    yspeed = tempys;
  }

  //check if snake ate the food
  boolean eat(Food others) {
    float d = dist(x, y, others.x, others.y);
    if (d < 1) {
      total++;
      changed = true;
      return true;
    } else {
      return false;
    }
  }
  
  void ded(){
    for (int i = 0; i < total; i++){
      float d = dist(x,y,prevx[i],prevy[i]);
      if (d < 1){
        total = 0;
        float[] tempx = {0};
        float[] tempy = {0};
        prevx = tempx;
        prevy = tempy;        
        
        x = 0;
        y = 0;
      }
    }
  }
}
