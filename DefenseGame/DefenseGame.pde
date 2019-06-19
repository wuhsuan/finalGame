
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;

int gameState = GAME_RUN;

PImage bg, modelImg, modelUpgrateImg;
PImage player1Img,bullet1Img;
PImage player2Img,bullet2Img;
PImage enemy1Img,enemy2Img;
PImage itemImg,item1Img;

PFont font;

int score = 0;

Model model;
Player1 player1;
Enemy1 enemy1s[];
Enemy2 enemy2s[];
Item[] items;
Player2 player2;
int maxEnemyCount = 16;
//float specialEnemySpawnChance = 0.05;
int maxItemCount = 8;
int spawnInterval = 15;
int spawnItemInterval=30;
int spawnTimer = 0;
int spawnItemTimer=0;

boolean clockWise1,clockWise2;
boolean cClockWise1,cClockWise2;
boolean shoot1,shoot2;

float scoreTextMinSize = 72;
float scoreTextMaxSize = 96;
float scoreTextSize = scoreTextMinSize;

//spawn chances

void setup(){
  size(800, 800);
  bg = loadImage("img/bg.jpg");
  modelImg = loadImage("img/model.png");
  modelUpgrateImg = loadImage("img/modelupgrate.png");
  enemy1Img = loadImage("img/enemy1.png");
  enemy2Img = loadImage("img/enemy2.png");
  player1Img = loadImage("img/player1.png");
  player2Img = loadImage("img/player2.png");
  bullet1Img = loadImage("img/bullet1.png");
  bullet2Img = loadImage("img/bullet2.png");
  itemImg = loadImage("img/item.png");
  item1Img=loadImage("img/item1.png");
  font = createFont("ObelixPro.ttf", 96, true);
  textFont(font);
  
  model = new Model();
  enemy1s = new Enemy1[maxEnemyCount];
  enemy2s = new Enemy2[maxEnemyCount];
  player1 = new Player1();
  items= new Item[maxItemCount];
  player2 = new Player2();
  
}
//initiallize item position
void spawnItem(){
  for(int i = 0; i < items.length; i++){
    if(items[i] == null || !items[i].isAlive){
      float angle = random(TWO_PI);
      float distance = random(400, 600);
      float x = width / 2 + cos(angle) * distance;
      float y = height / 2 + sin(angle) * distance;
      items[i] = new Item(x, y);
      
      //chance of different object to pop
  
      //enemy1s[i] = (random(1) > specialEnemySpawnChance) ? new Enemy(x, y) : new specialEnemy(x, y);
      break;
    }
  }
}


void spawnEnemy(){
  for(int i = 0; i < enemy1s.length; i++){
    if(enemy1s[i] == null || !enemy1s[i].isAlive){
      float angle = random(TWO_PI);
      float distance = random(400, 600);
      float x = width / 2 + cos(angle) * distance;
      float y = height / 2 + sin(angle) * distance;
      enemy1s[i] = new Enemy1(x, y);
      //enemy1s[i] = (random(1) > specialEnemySpawnChance) ? new Enemy(x, y) : new specialEnemy(x, y);
      break;
    }
  }
  
   for(int i = 0; i < enemy2s.length; i++){
    if(enemy2s[i] == null || !enemy2s[i].isAlive){
      float angle = random(TWO_PI);
      float distance = random(400,600);
      float x= width / 2 + cos(angle) * distance;
      float y= height / 2 + sin(angle) * distance;
      enemy2s[i] = new Enemy2(x,y);
       //enemy2s[i] = (random(1) > specialEnemySpawnChance) ? new Enemy2(x, y) : new specialEnemy2(x, y);
      break;
    }
  }
  
}

void draw(){
  
  switch(gameState){
    case GAME_RUN:  
    // draw background
   
       image(bg,width/2,height/2);
    
    drawScore();
    
    model.display();
    player1.update();
    player1.display();
    player2.update();
    player2.display();
    
    
    spawnTimer++;
    if(spawnTimer >= spawnInterval){
      spawnTimer = 0;
      spawnEnemy();
    }
    
    //Item spawn timer
     spawnItemTimer++;
    if(spawnItemTimer >= spawnItemInterval){
      spawnItemTimer = 0;
      spawnItem();
    }
    
    for(int i = 0; i < enemy1s.length; i++){
      if(enemy1s[i] != null && enemy1s[i].isAlive){
        enemy1s[i].update();
        enemy1s[i].display();
        if(model.isHit(enemy1s[i])){
         model.hurt(5);
       }
      }
    }
    
     for(int i = 0; i < enemy2s.length; i++){
      if(enemy2s[i] != null && enemy2s[i].isAlive){
        enemy2s[i].update();
        enemy2s[i].display();
        if(model.isHit(enemy2s[i])){
          
          model.hurt(5);
        }
      }
    }
    
    for(int i = 0; i < items.length; i++){
      if(items[i] != null && items[i].isAlive){
        items[i].update();
        items[i].display();        
      }
    }
    
    if(gameState == GAME_OVER){
      drawGameOverText();
    }
    break;
    
    case GAME_OVER:
        enemy1s = new Enemy1[maxEnemyCount];
            enemy2s = new Enemy2[maxEnemyCount];
            player1 = new Player1();
            player2 = new Player2();
            score = 0;
            model = new Model();
            items= new Item[maxItemCount];
    break;
  }
}

void keyPressed(){
  switch(gameState){
    case GAME_RUN:
      if(key==CODED){
        switch(keyCode){
          case LEFT:
          clockWise1 = true;
          break;
          case RIGHT:
          cClockWise1 = true;
          break;
          case UP:
          shoot1 = true;
          break;
          
        }
        }else if (key=='d'){
          clockWise2 = true;
          break;
        }else if(key=='a'){
          cClockWise2 = true;
        }
        else if(key=='w'){
          shoot2 = true;
          break;
        }
      
      
    break;
    
    case GAME_OVER:
      if(key=='r'){
        
            gameState = GAME_RUN;
          break;
        }
      
    break;
  }
}


void keyReleased(){
  switch(gameState){
    case GAME_RUN:
      if(key==CODED){
        switch(keyCode){
          case LEFT:
            clockWise1 = false;
          break;
          case RIGHT:
            cClockWise1 = false;
          break;
          case UP:
            shoot1 = false;
          break;
          
        }
      }
      else if (key=='d'){
          clockWise2 = false;
          break;
        }else if(key=='a'){
          cClockWise2 = false;
        }
        else if(key=='w'){
          shoot2 = false;
          break;
        }
    break;
  }
}

/*void mouseReleased(){
  switch(gameState){
    case GAME_RUN:
    player1.fire();
    break;
  }
}*/


void spawnItem_1(){
  for(int i = 0; i < items.length; i++){
    if(items[i] == null || !items[i].isAlive){
      float angle = random(TWO_PI);
      float distance = random(400, 600);
      float x = width / 2 + cos(angle) * distance;
      float y = height / 2 + sin(angle) * distance;
      items[i] = new Item(x, y);
      break;
    }
  }
}

void addScore(int value){
  score += value;
  scoreTextSize = scoreTextMaxSize;
}

float getRadiansDifference(float a, float b){
  float result = b - a;
  if(result > PI) result -= TWO_PI;
  else if(result < - PI) result += TWO_PI;
  return abs(result);
}

void drawScore(){
  scoreTextSize = lerp(scoreTextSize, scoreTextMinSize, 0.12);
  textAlign(CENTER, CENTER);
  textSize(scoreTextSize);
  fill(#ffffff, 100);
  text(score, width / 2, height / 2 + 100);
}

void drawGameOverText(){
  textAlign(CENTER, CENTER);
  textSize(64);
  fill(0, 120);
  text("GAME OVER", width / 2 + 3, height / 2 - 120 + 3);
  fill(#ff0000);
  text("GAME OVER", width / 2, height / 2 - 120);
  
  textSize(32);
  fill(0, 120);
  text("SCORE: " + score, width / 2 + 3, height / 2 + 3);
  text("click R to restart", width / 2 + 3, height / 2 + 200 + 3);
  fill(#ffffff);
  text("SCORE: " + score, width / 2, height / 2);
  text("click R to restart", width / 2, height / 2 + 200);
}
