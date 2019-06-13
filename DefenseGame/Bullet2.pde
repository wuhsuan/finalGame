class Bullet2 {
  boolean isAlive = true;
  float damage;
  float x, y;
  float speed;
  float targetAngle;
  PImage img;
  boolean isOne;
  
  Bullet2(float x, float y, float targetAngle){
    this.x = x;
    this.y = y;
    speed = 5;
    damage = 10;
    img =  bullet2Img;
    this.targetAngle = targetAngle;
    isOne = true;
  }
  
  void update() {
    move();
    
    if(isOutOfScreen()){
      isAlive = false;
    }else{
      for(int j = 0; j < enemy2s.length; j++){
        if(isHit(enemy2s[j])){
          onHit(enemy2s[j]);
          break;
        }
      }
    }
  }
  
  void onHit(Enemy2 enemy){
    enemy.hurt(damage);
    isAlive = false;
  }
  
  void move(){
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
  
  boolean isHit(Enemy2 enemy){
    return enemy != null && enemy.isAlive && dist(x, y, enemy.x, enemy.y) <= getRadius() + enemy.getRadius();
  }
  
  boolean isOutOfScreen(){
    return x < -100 || x > width + 100 || y < -100 || y > height + 100;
  }
}
