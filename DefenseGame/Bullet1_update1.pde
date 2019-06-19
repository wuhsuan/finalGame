class Bullet1_update1 extends Bullet1{

Bullet1_update1(float x, float y, float targetAngle){
super(x,y,targetAngle);
img =  bullet4Img;
speed = 5;
damage = 50;
}
void display() {
  super.display();
 image(img,0,0);
}
void timer(){
  


}
}
