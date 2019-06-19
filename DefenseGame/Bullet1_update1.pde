class Bullet1_update1 extends Bullet1{

Bullet1_update1(float x, float y, float targetAngle){
super(x,y,targetAngle);
img =  bullet1Img;

}
void display() {
 image(img, -5, 0);
 image(img, 5, 0);
}

}
