class Enemy1 {
  boolean isAlive = true;
  float health;
  int scoreValue;
  float x, y;
  float speed;
  float targetAngle;
  PImage img;
  boolean isOne;
  
  Enemy1(float x, float y){
    this.x = x;
    this.y = y;
    health = 10;
    speed = 0.5;
    scoreValue = 1;
    img = enemy1Img;
    targetAngle = atan2(height / 2 - y, width / 2 - x);
    isOne = true;
  }
  
  void update() {
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
  
  void hurt(float damage){
    health -= damage;
    if(health <= 0 && isAlive){
      isAlive = false;
      addScore(scoreValue);
    }
  }
  
  float getRadius(){
    return img.width / 2;
  }
}
