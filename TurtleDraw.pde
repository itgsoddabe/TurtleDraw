Turtle t;
color bgColor = #000000;
int width = 800;
int height = 800;
 
void setup() {
    size(width, height);
    frameRate(60);
    noStroke();
    smooth();
    background(bgColor);
    t = new Turtle(width / 2, height / 2);
    drawing();
}

void drawing() {
   //drawPlus(100);
   //snowFlake(800,5);
   //draw_square_spiral(3);
   draw_star_spiral(20);
   //draw_star(300);
   //draw_itg();
   
 }

void draw() {
  for(int i = 0; i < 20; i++) {
    t.draw();
  }
}

void draw_star_spiral(int size) {
  t.right(30);
  for (int outer = 1; outer < 300; outer++){
    for(int i = 0; i < 6; i++) {
      t.forward(outer * 10);
      t.right(120);
      t.forward(outer * 10);
      t.left(60);
    }
    t.pencolor(60);
    t.left(60);
    t.forward(size / 2);
    t.right(60);
    t.pencolor(color(int(random(255)), int(random(255)), int(random(255))));
    t.pendown();
  }
  
}

void draw_itg() {
  for (int i = 0; i < 2; i++ ) {
    t.forward(100);
    t.right(90);
    t.forward(10);
    t.right(90);
  }
  t.penup();
  t.right(90);
  t.forward(60);
  t.left(90);
  t.pendown();
  t.forward(90);
  t.left(90);
  t.forward(40);
  t.right(90);
  t.forward(10);
  t.right(90);
  t.forward(90);
  t.right(90);
  t.forward(10);
  t.right(90);
  t.forward(40);
  t.left(90);
  t.forward(90);
  t.right(90);
  t.forward(10);

  t.right(180);
  t.penup();
  t.forward(110);
  t.pendown();
  t.right(180);
  for (int i = 0; i < 17; i++) {
    t.forward(9);
    t.right(10);
  }
  t.right(10);
  t.forward(20);
  t.right(90);
  t.forward(10);
  t.right(90);
  for (int i = 0; i < 16; i++) {
    t.forward(9);
    t.left(12);
  }
  t.left(78);
  t.forward(40);
  t.left(90);
  t.forward(10);
  t.right(90);
  t.forward(10);
  t.right(90);
  t.forward(20);
  t.right(90);
  t.forward(56);
  t.right(90);
  t.forward(20);
  

}


void draw_star(int size){
  for(int i = 0; i < 1000; i++) {
    t.pencolor(color(int(random(255)), int(random(255)), int(random(255))));
    t.forward(size);
    t.right(173); 
  }
}

void draw_square_spiral(int distance) {
  for (int outer = 1; outer < 1000; outer++) {
    for(int inner = 0; inner < 2; inner++) {
      t.forward(outer * distance);
      t.right(90);
    }
  }
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
