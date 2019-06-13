class SpecialEnemy2 extends Enemy1 {
  SpecialEnemy2(float x, float y ){
    super(x,y);
    scoreValue = 5;
    health = 255;
  }
  
  void display(){
    pushStyle();
    tint(255,health,health);
    super.display();
    popStyle();
  }
}
