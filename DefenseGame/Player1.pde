class Player1 {
  int maxBulletCount = 16;
  int shootCD = 0;
  int shootMaxCD = 10;
  float towerTopXOffset = 0;
  float towerTopXMaxOffset = 16;
  int playerRadius = 80;
  float playerCurrentAngle = 0;
  boolean isOne = true;
  
  
  Bullet1 [] bullet1s;
  
  Player1(){
    bullet1s = new Bullet1[maxBulletCount];
  }
  
  void update(){
    for(int i = 0; i < bullet1s.length; i++){
      if(bullet1s[i] != null && bullet1s[i].isAlive){
        bullet1s[i].update();
      }
    }
    if(clockWise1){
      playerCurrentAngle += 0.05;
    }else if (cClockWise1){
      playerCurrentAngle -= 0.05;
    }
    shootCD ++;
    if (shoot1 && shootCD > shootMaxCD){
      player1.fire();
      shootCD = 0;
    }
  }

  void fire(){
    for(int i = 0; i < bullet1s.length; i++){
      if(bullet1s[i] == null || !bullet1s[i].isAlive){
        float x=playerRadius*cos(playerCurrentAngle);
        float y=playerRadius*sin(playerCurrentAngle);
        bullet1s[i] = new Bullet1(width / 2 +x, height / 2 +y, playerCurrentAngle);
        towerTopXOffset = towerTopXMaxOffset;
        break;
      }
    }
  }
  
  void display(){
    pushStyle();
    imageMode(CENTER);
    
    for(int i = 0; i < bullet1s.length; i++){
      if(bullet1s[i] != null && bullet1s[i].isAlive){
        bullet1s[i].display();
      }
    }
    
    pushMatrix();
    translate(width / 2, height / 2);
    //rotate(atan2(mouseY - height / 2, mouseX - width / 2));
    rotate(playerCurrentAngle);
    towerTopXOffset = lerp(towerTopXOffset, 0, 0.2);
    image(player1Img, playerRadius-towerTopXOffset, 0);
    popMatrix();
    popStyle();
  }
  //item detaction
 /*  boolean isHit(Item enemy){
    
    return enemy != null && enemy.isAlive && dist(width / 2, height / 2, enemy.x, enemy.y) <= hitRadius + enemy.getRadius();
    
  }
  
*/  
}


//x=player1Radius*cos(atan2(mouseY - height / 2, mouseX - width / 2))
//y=player1Radius*sin(atan2(mouseY - height / 2, mouseX - width / 2))
