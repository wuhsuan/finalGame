class Player2 extends Player1{
   int playerRadius = 180;
  Bullet1 [] bullet1s;
  Player2(){
    super();

   bullet1s = new Bullet1[maxBulletCount];
  
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
    image(player2Img, playerRadius-towerTopXOffset, 0);
    popMatrix();
    popStyle();
  }
  


}
