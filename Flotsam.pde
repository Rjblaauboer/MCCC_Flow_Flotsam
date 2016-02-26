class Flotsam {
  PVector center;
  float freq; 
  float phase; 
  float r;
  PVector pos; 
  float value; 
  color col; 


  Flotsam(PVector _center, float _r, float _freq, float _phase) {
    center = _center.copy();
    freq = _freq; 
    phase = _phase; 
    r = _r;
    pos = getPosition();
    col = c[ floor(random(0, 4)) ];
  }


  PVector getPosition() {
    value = (frameCount/24.0 * freq) * (2*PI) + phase;
    PVector position = new PVector( sin(value) * r, cos(value) * r ); 
    return position;
  }


  void update() {
    pos = getPosition();
  }


  void display() {

    stroke(80);
    noFill();
    //ellipse(center.x, center.y, r*2, r*2);   
    noStroke();
    fill(col, 100*cos(value)+100);
    shapeMode(CENTER);

    ellipse(center.x + pos.x, center.y + pos.y, r*0.5, r*0.5);
  }
}