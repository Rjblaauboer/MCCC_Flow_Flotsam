color[] c = {#331940, #5E366A, #0CCA98, #00FFCC};

Flotsam[][] flotsam = new Flotsam[30][30];

void setup() {
  size(500, 500);
  int size = 10; 
  float bumpiness = 1.5/flotsam.length;
  
  for (int i = 0; i<flotsam.length; i++) {
    for (int j = 0; j<flotsam[i].length; j++) {
      float x = width*0.1 + width*0.8/flotsam.length*i;
      float y = height*0.1 + height*0.8/flotsam[i].length*j; 
      float r = size*random(0.1, 1.2);
      float freq = 0.4;
      float phase = 2*PI*noise(i*bumpiness, j*bumpiness);

      Flotsam fl = new Flotsam( new PVector(x, y), r, freq, phase);
      flotsam[i][j] = fl;
    }
  }
  
  frameRate(24);
}

void draw() {
  background(c[3]);

  for (Flotsam[] flot : flotsam) {
    beginShape();
    for (Flotsam fl : flot) {
      fl.update();
      fl.display(); 
      //curveVertex(fl.center.x + fl.pos.x, fl.center.y + fl.pos.y);
    }
    noFill();
    stroke(80);
    endShape();
  }  

//  saveFrame("f###.gif");
//  if(frameCount >= 60){
//  exit(); 
//  }
}