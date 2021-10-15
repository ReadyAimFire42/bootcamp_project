float X;
float Y; 
PImage img;
int Score =0;
boolean b ;

static int x, y;     
static int w, h;     
static int ww, hh;   
static int gw, gh;
boolean ball;

final static byte  SPX  = 15, SPY = 10; 
final static byte  BOLD = 4;               

// General constants:
final static byte  FPS = 60;      
  
static boolean north, south, west, east;
static final void initVars(int wdt, int hgt) {
  x = wdt>>1;   
  y = hgt>>1;

  w = wdt/10;    
  h = hgt/10;

  ww = w>>1;     
  hh = h>>1;

  gw = wdt - ww; 
  gh = hgt - hh;
}
void setup()
{
  size(800,500);
 
  rectMode(CENTER);    
  ellipseMode(CENTER);

      
  stroke(0);           
  strokeWeight(BOLD);
  initVars(width, height);
  X = 200;
  Y = 100;
}
void draw(){
img =loadImage("football.jpg");
  image(img,0,0);
  fill(255);
rect(15,250,40,120);
rect(780,250,40,120);
get(x,y*width+x);

moveObject();
confineToEdges();
displayObject();
textSize(25);
fill(0,0,255);
text("Score: " + Score, 10, 30);
if(mouseX<40 && mouseY>200 && mouseY<310 && Score<1)
Score =Score +1;
else if(mouseX>760 && mouseY>200 && mouseY<310 && Score<1)
Score = Score+1;

}
void keyPressed() {
  final int k = keyCode;

  if (k == ' ' | k == ENTER | k == RETURN)
    ball = !ball;

  else setDirection(k, true);
}

void keyReleased() {
  setDirection(keyCode, false);
}
static final void setDirection(int k, boolean decision) {
  if      (k == UP    | k == 'W')   north = decision;
  else if (k == DOWN  | k == 'S')   south = decision;
  else if (k == LEFT  | k == 'A')   west  = decision;
  else if (k == RIGHT | k == 'D')   east  = decision;
}

static final void moveObject() {
  x += (east?  SPX : 0) - (west?  SPX : 0);
  y += (south? SPY : 0) - (north? SPY : 0);
}

static final void confineToEdges() {
  x = constrain(x, ww, gw);
  y = constrain(y, hh, gh);
}

void displayObject() {
   fill(255);
  rect(mouseX,mouseY,w-20,h);
  get(400,250);
  if (b =true);
  fill(0);
  circle(x, y, h-20); 
}
   
