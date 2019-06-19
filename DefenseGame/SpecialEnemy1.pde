class SpecialEnemy1 extends Enemy1 {
  SpecialEnemy1(float x, float y ){
    super(x,y);
    scoreValue = 5;
    health = 100;
    size=60;
     speed = 0.25;
  }
  
  void display(){
    pushStyle();
    tint(255,health,health);
    super.display();
    image(img, 0, 0,size,size);
    popStyle();
  }
}
