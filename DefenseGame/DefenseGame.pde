 
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;

int gameState = GAME_RUN;

PImage bg, modelImg, modelUpgrateImg;
PImage player1Img,bullet1Img;
PImage player2Img,bullet2Img;
PImage enemy1Img,enemy2Img;
PImage itemImg;

PFont font;

int score = 0;

Model model;
Player1 player1;
Enemy1 enemy1s[];
Enemy2 enemy2s[];
int maxEnemyCount = 16;
//float specialEnemySpawnChance = 0.05;
int spawnInterval = 15;
int spawnTimer = 0;

boolean clockWise1;
boolean cClockWise1;
boolean shoot1;

float scoreTextMinSize = 72;
float scoreTextMaxSize = 96;
float scoreTextSize = scoreTextMinSize;

void setup(){
  pixelDensity(2);
  size(512, 512, P2D);
  bg = loadImage("img/bg.png");
  modelImg = loadImage("img/model.png");
  modelUpgrateImg = loadImage("img/modelupgrate.png");
  enemy1Img = loadImage("img/enemy1.png");
  enemy2Img = loadImage("img/enemy2.png");
  player1Img = loadImage("img/player1.png");
  player2Img = loadImage("img/player2.png");
  bullet1Img = loadImage("img/bullet1.png");
  bullet2Img = loadImage("img/bullet2.png");
  itemImg = loadImage("img/item.png");
  
  font = createFont("ObelixPro.ttf", 96, true);
  textFont(font);
  
  model = new Model();
  enemy1s = new Enemy1[maxEnemyCount];
  enemy2s = new Enemy2[maxEnemyCount];
  player1 = new Player1();
}

void spawnEnemy(){
  for(int i = 0; i < enemy1s.length; i++){
    if(enemy1s[i] == null || !enemy1s[i].isAlive){
      float angle = random(TWO_PI);
      float distance = random(400, 600);
      float x = width / 2 + cos(angle) * distance;
      float y = height / 2 + sin(angle) * distance;
      enemy1s[i] = new Enemy1(x, y);
      //enemy1s[i] = (random(1) > specialEnemySpawnChance) ? new Enemy1(x, y) : new specialEnemy1(x, y);
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
    for(int i = - bg.width; i < width + bg.width; i += bg.width){
      for(int j = - bg.height; j < height + bg.height; j += bg.height){
        image(bg, i, j);
      }
    }
    
    drawScore();
    
    model.display();
    player1.update();
    player1.display();
    
    
    spawnTimer++;
    if(spawnTimer >= spawnInterval){
      spawnTimer = 0;
      spawnEnemy();
    }
    
    for(int i = 0; i < enemy1s.length; i++){
      if(enemy1s[i] != null && enemy1s[i].isAlive){
        enemy1s[i].update();
        enemy1s[i].display();
        if(model.isHit(enemy1s[i])){
          gameState = GAME_OVER;
        }
      }
    }
    
     for(int i = 0; i < enemy2s.length; i++){
      if(enemy2s[i] != null && enemy1s[i].isAlive){
        enemy2s[i].update();
        enemy2s[i].display();
        if(model.isHit(enemy2s[i])){
          gameState = GAME_OVER;
        }
      }
    }
    
    if(gameState == GAME_OVER){
      drawGameOverText();
    }
    break;
    
    case GAME_OVER:
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
      }
    break;
    
    case GAME_OVER:
      if(key==CODED){
        switch(keyCode){
          case 'R':
            enemy1s = new Enemy1[maxEnemyCount];
            player1 = new Player1();
            score = 0;
            gameState = GAME_RUN;
          break;
        }
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
