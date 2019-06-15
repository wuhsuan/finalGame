class Player2 extends Player1{
   int playerRadius = 180;
   boolean isTwo = true;
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
        bullet2s[i] = new Bullet2(width / 2 +x, height / 2 +y, playerCurrentAngle);
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
  


}
