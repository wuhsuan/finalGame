class Player2 extends Player1{
   int playerRadius =80;
   boolean isTwo = true;
   float playerCurrentAngle = PI;
   int currentBulletType =BULLET2_LEVEL1;
  Bullet2 [] bullet2s;
  Player2(){
    super();

   bullet2s = new Bullet2[maxBulletCount];
  
}
  void update(){
  for(int i = 0; i < bullet2s.length; i++){
      if(bullet2s[i] != null && bullet2s[i].isAlive){
        bullet2s[i].update();
      }
    }
    if(clockWise2){
      playerCurrentAngle += 0.05;
    }else if (cClockWise2){
      playerCurrentAngle -= 0.05;
    }
    shootCD ++;
    if (shoot2 && shootCD > shootMaxCD){
      player2.fire();
      shootCD = 0;
    }
  
  
  
  }

    void fire(){
    for(int i = 0; i < bullet2s.length; i++){
      if(bullet2s[i] == null || !bullet2s[i].isAlive){
        float x=playerRadius*cos(playerCurrentAngle);
        float y=playerRadius*sin(playerCurrentAngle);
        if(currentBulletType==BULLET2_LEVEL1) { bullet2s[i] = new Bullet2(width / 2 +x, height / 2 +y, playerCurrentAngle); break;}
         if(currentBulletType==BULLET2_LEVEL2) {bullet2s[i] = new Bullet2update1(width / 2 +x, height / 2 +y, playerCurrentAngle); break;}
        
        towerTopXOffset = towerTopXMaxOffset;
        break;
      }
    }
  }
  
  void display(){
    pushStyle();
    imageMode(CENTER);
    
    for(int i = 0; i < bullet2s.length; i++){
      if(bullet2s[i] != null && bullet2s[i].isAlive){
        bullet2s[i].display();
      }
    }
    
    pushMatrix();
    translate(width / 2, height / 2);
    //rotate(atan2(mouseY - height / 2, mouseX - width / 2));
    rotate(playerCurrentAngle);
    towerTopXOffset = lerp(towerTopXOffset, 0, 0.2);
    image(player2Img, playerRadius-towerTopXOffset, 0);
    popMatrix();
    popStyle();
  }
  boolean isHit(Item item){
    
    return item != null && item.isAlive && dist(width/2+(playerRadius-towerTopXOffset)*cos(playerCurrentAngle), height / 2+(playerRadius-towerTopXOffset)*sin(playerCurrentAngle), item.x, item.y) <= hitRadius + item.getRadius();
    
  }
void setBulletType(int type){
    currentBulletType = type;
  }
}
