class Bullet2update1 extends Bullet2{

Bullet2update1(float x, float y, float targetAngle){
super(x,y,targetAngle);
img =  bullet4Img;
speed = 5;
damage = 50;
}
void display() {
  super.display();
 image(img,0,0);
}

}
