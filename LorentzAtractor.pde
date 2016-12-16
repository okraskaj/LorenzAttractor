import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0/3.0;

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam cam;

void setup(){
  size(800,600, P3D);
  cam = new PeasyCam(this, 100);
  colorMode(HSB);
  background(0);
}

void draw(){
  float dt = 0.01;
  float dx = (a * (y-x) ) * dt;  
  float dy = (x * (b-z) - y) * dt ; 
  float dz = (x * y - c * z) * dt; 
  x = x+ dx;
  y = y + dy;
  z = z + dz;
  points.add(new PVector(x,y,z));
  
  background(0);
 
  //scale(5);
  stroke(255);
  strokeWeight(4);
  noFill();
  
 float hu = 0;
  beginShape();
  for (PVector v : points){
    stroke(hu,255,255);
    vertex(v.x,v.y,v.z); 
    hu += 0.1;
    if(hu >255){
      hu = 0;
    }
  }
  endShape();
  
  println(x,y,z);
}