class QuickEnemy1 extends Enemy1 {
  QuickEnemy1(float x, float y ){
    super(x,y);
    health = 100;
    speed = random(1,2);
  }
  
  void display(){
    pushStyle();
    tint(255,random(255),health);
    super.display();
    image(img, 0, 0,size,size);
    popStyle();
  }
}
  
  
  
  
  
