class Model{
  float hitRadius = 26;
  float modelHealth=100;
  boolean isAlive = true;

  
   void hurt(float damage){
    modelHealth -= damage;
    
    if(modelHealth <= 0 && isAlive){
      isAlive = false;
      gameState = GAME_OVER;
    }
  }
  
  
  boolean isHit(Enemy1 enemy){
    
    return enemy != null && enemy.isAlive && dist(width / 2, height / 2, enemy.x, enemy.y) <= hitRadius + enemy.getRadius();
    
  }
  
   boolean isHit(Enemy2 enemy){
    return enemy != null && enemy.isAlive && dist(width / 2, height / 2, enemy.x, enemy.y) <= hitRadius + enemy.getRadius();
  }
  
  void display(){
    pushStyle();
    imageMode(CENTER);
    image(modelImg, width / 2, height / 2);
    color(#FFFFFF);
    rect(10,10,modelHealth,10);
  }
}
