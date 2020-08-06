Snake snek = new Snake();
float scl = 20;
Food f = new Food();

void setup() {
  size(600,600);
  frameRate(10);
  f.pickLocation();
  
}

void draw() {
  background(51);
  Press();
  snek.ded();
  snek.update();
  snek.show();
  
  f.show();
  if(snek.eat(f)) {
    f.pickLocation();
  }
}

void Press() {

  if (keyCode == UP){
    snek.dir(0,-1);
  } else   if (keyCode == DOWN){
    snek.dir(0,1);
  } else  if (keyCode == LEFT){
    snek.dir(-1,0);
  } else  if (keyCode == RIGHT){
    snek.dir(1,0);
  }
  if (keyPressed){
    if (key == ' '){
      println(snek.prevy);
      println("Current Total:" + snek.total);
    }
  }
}
