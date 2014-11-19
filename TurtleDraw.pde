Turtle t;
color bgColor = #000000;
 
void setup() {
    size(260,260);
    frameRate(60);
    noStroke();
    smooth();
    background(bgColor);
    t = new Turtle(width / 2, height);
    drawing();
}

void drawing() {
   //drawPlus(10);
   snowFlake(300,4);
 }

void snowFlake(int length, int depth) {
  if (depth == 0) {
    t.forward(length);
  }
  else {
    snowFlake(length/3, depth -1);
    t.right(60);
    snowFlake(length/3, depth -1);
    t.left(120);
    snowFlake(length/3, depth -1);
    t.right(60);
    snowFlake(length/3, depth -1);
  }
} 

void drawPlus(int size) {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 3; j++) {
      t.forward(size);
      t.right(90);
    }
    t.left(180);  
  }
}

void draw() {
    t.draw();
}

 
 
class Turtle {
    float x,y;
    float oldx,oldy;
    float heading;
    color fillColor;
    ArrayList<Point> points = new ArrayList<Point>();
    Boolean penDown;
    
    //Default Constructor
    Turtle() {
      //Call other constructor
      this(width/2, height/2);
    }
    
    //Constructor taking x and y coords
    Turtle(int _x, int _y) {
        x = _x;
        y = _y;
        fillColor = #FFFFFF;
        heading = 90;
        fill(fillColor);
        penDown = true;
    }
    
  
     
    void draw() {
      if (!points.isEmpty()) { 
        Point p = points.get(0);
        fill(p.fillColor);
        if (p.penDown) {
          rect(p.x, p.y, 1, 1);
        }
        points.remove(0);
      }
      else {
        noLoop();
      }
    }
    
    void forward(int step) {
        for (int i = 0; i < step; i++) {
          x -= 1 * cos(radians(heading));
          y -= 1 * sin(radians(heading));
          points.add(new Point(this));
        }
    }
 
    void back(int step) {
        for (int i = 0; i < step; i++) {
          x += 1 * cos(radians(heading));
          y += 1 * sin(radians(heading));
          points.add(new Point(this));
        }
    }
 
    void home() {
        x = int(width/2);
        y = int(height/2);
        heading = 0.0;
    }
 
    void setx(int step) {
        x += step;
    }
 
    void sety(int step) {
        y += step;
    }
 
    void setxy(int stepx, int stepy) {
        x += stepx;
        y += stepy;
    }
     
    void left (int degrees) {
        heading -= degrees;
    }
 
    void right (int degrees) {
        heading += degrees;
    }
 
    void setheading (int angle) {
        heading = angle;
    }
     
    void pencolor (color newColor) {
        fillColor = newColor;
    }
     
    void penup() {
        penDown = false;  
    }
 
    void pendown() {
        penDown = true;  
    }
 
    void penerase() {
        fillColor = bgColor;
    }
}

class Point {
  float x, y;
  Boolean penDown;
  color fillColor;
  
  Point(Turtle turtle) {
    x = turtle.x;
    y = turtle.y;
    penDown = turtle.penDown;
    fillColor = turtle.fillColor;
  } 
}
