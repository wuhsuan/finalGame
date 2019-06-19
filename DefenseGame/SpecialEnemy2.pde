class SpecialEnemy2 extends Enemy2 {
  SpecialEnemy2(float x, float y ){
    super(x,y);
    scoreValue = 5;
    health = 200;
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
