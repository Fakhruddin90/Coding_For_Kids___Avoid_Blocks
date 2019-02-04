PImage img;
int playerXCor = 600;
int playerYCor = 590;
int playerWidth = 55;
int playerHeight = 55;
int difficulty = 10;
float score = 0;
Baddie[] baddies = new Baddie[10];
boolean isCollided = false;

void initBaddies(){
 
  for(int i = 0; i < baddies.length; i++){
     int x = (int)random(-10, 1280);
     int y = (int)random(-50, 0);
     baddies[i] = new Baddie(x, y, 30, 15);
  }
}
// In a program that has the setup() function, the size()/fullscreen() function must be the first line of code inside setup(), and the setup() function must appear in the code tab with the same name as your sketch folder.
void setup(){
  //fullScreen();
  size(1280,720);
  //rameRate(60);
  img = loadImage("bg.png");
  initBaddies();
  
  
}

void draw(){
  
  image(img,0,0); // Using instead of background();
  drawPlayer();
  
  if(!isCollided){
    moveBaddies(); 
  }
 else{
   text("Score: "+(int)score,300, 100);
 }

  
}

void moveBaddies(){
      for(int i = 0; i < baddies.length; i++){
        if(baddies[i].yCor > height){
           baddies[i].yCor = -10;
        }
        baddies[i].display();
        baddies[i].drop(random(1, 15));
      
        boolean conditionXLeft = baddies[i].xCor + baddies[i].w >= playerXCor;
        boolean conditionXRight = baddies[i].xCor + baddies[i].w <= playerXCor + playerWidth + 4;
        boolean conditionUp =  baddies[i].yCor >= playerYCor;
        boolean conditionDown = baddies[i].yCor + baddies[i].h <= playerYCor + playerHeight;
      
        if(conditionXLeft && conditionXRight && conditionUp && conditionDown){
             isCollided = true;
        }
  
      }
     
 
    score += 0.1;

    fill(0, 102, 153);
    text("Score: "+(int)score, 10, 40);
    textSize(25);
}



void drawPlayer(){
  stroke(204, 132, 0);
  strokeWeight(4);
  fill(204, 102, 0);
  rect(playerXCor, playerYCor, playerWidth, playerHeight, 7);
}




void mouseDragged(){
  if(mouseX >= 0 && mouseX <= width - playerWidth + 1){
    playerXCor = mouseX;
  }
  if(mouseY >= 590 && mouseY <= height - playerHeight){
    playerYCor = mouseY;
  }
 
}





















  
// Drag (click and hold) your mouse across the 
// image to change the value of the rectangle

//int value = 0;
//int xCor = 100;
//int yCor = 100;
//void setup(){
//  size(500,400);
//}

//void draw() {
//  background(150);
//  drawPlayer();  
//}

//void drawPlayer(){
//  rect(xCor, yCor, 10, 10);
//}

//void mouseDragged() 
//{
//  xCor = mouseX;
//  yCor = mouseY;
//}



















//color c = color(0);
//float x = 0;
//float y = 100;
//float speed = 1;

//void setup() {
//  size(200,200);
//}

//void draw() {
//  background(255);
//  move();
//  display();
//}

//void move() {
//  x = x + speed;
//  if (x > width) {
//    x = 0;
//  }
//}

//void display() {
//  fill(c);
//  rect(x,y,30,10);
//}