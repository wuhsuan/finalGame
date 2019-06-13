class Item {
  boolean isAlive=true;
  float x, y;
  float speed;
  
  PImage img;
  float targetAngle;
  //time spawn
//constructor
Item(float x, float y){
    
   speed = 0.5;
   this.x = x;
    this.y = y;
    img=itemImg;
   targetAngle = atan2(height / 2 - y, width / 2 - x);
  }
  
    //player get Item

  void update(){
  move();
 }
  
  
   void move() {
           x += cos(targetAngle) * speed;
      y += sin(targetAngle) * speed;
  
  }
   void display() {
      pushMatrix();
      pushStyle();
      translate(x, y);
      rotate(targetAngle);
      imageMode(CENTER);
      image(img, 0, 0);
      popStyle();
      popMatrix();
  }
   
  
  
  float getRadius(){
    return img.width / 2;
  }
}
