class Item {
  boolean isAlive=true;
  float x, y;
  float speed;
  boolean isItem=true;
  PImage img;
  float targetAngle;
  //time spawn
//constructor
Item(float x, float y){
    
   speed = 2;
   this.x = x;
    this.y = y;
    img=item3Img;
   targetAngle = atan2(height / 2 - y, width / 2 - x);
  }
  
    //player get Item

  void update(){
  move();
 }
  
  boolean eat(){
  
 
  
  
  return isAlive=false;
 
  
  
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
   void onHit(Player1 player1){
     
    
    isAlive = false;
  }
   boolean isHit(Enemy1 enemy){
    return enemy != null && enemy.isAlive && dist(x, y, enemy.x, enemy.y) <= getRadius() + enemy.getRadius();
  }

}
