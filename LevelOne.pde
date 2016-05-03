public class LevelOne extends Level
{
  private CollisionManager collisionManager;
  private ArrayList<Entity> blockList;
  private int ballCount;
  
  public LevelOne()
  {
    println("Level One");
    collisionManager = new CollisionManager();
    ball = new Ball(10,100,20,20, collisionManager);
    blockList = new ArrayList<Entity>();
    createBlocks();
    collisionManager.SetBlockList(blockList);
    paddle = new Paddle(400, 550, 80, 20);
    collisionManager.SetPaddle(paddle);
    paddle.SetBall(ball);
    ballCount = 3;
    levelState = LevelState.RESUMED;
  }
  
  private void createBlocks()
  {
    float posX = 20;
    float posY = 100;
    for (int i = 0; i < 7; i++) 
    {
      posX += Common.BLOCK_W + 2;
      for (int j = 0; j < 5; j++)
      {
        blockList.add(new Block(posX, posY, 5));
        posY += Common.BLOCK_H + 2;
      }
      posY = 100;
    }
      
  }
  
  public void Update()
  {
    if (ball.IsMarkedForDeletion()) {
      ball = new Ball(10,100,20,20, collisionManager);
      paddle.SetBall(ball);
      ballCount--;
    }
    
    if (ballCount == 0) 
    {
      levelState = LevelState.FINISHED;
    }
    
    if (levelState == LevelState.PAUSED)
    {
      fill(255,0,0);
      textSize(46);
      text("PAUSED ", 300, 300);
    }
    
    ball.Update();
    paddle.Update();
    
    for ( Entity e : blockList)
    {
      if (e.IsMarkedForDeletion())
      {
        blockList.remove(e);
        AudioPlayer destroySFX = minim.loadFile("destroyBlockSound.wav");
        destroySFX.play();
        break;
      }
      e.Update();
    }
    
    fill(255,0,0);
    textSize(12);
    text("Balls left : " + Integer.toString(ballCount), 10, 20);
  }
  
  public void MovePaddleRight()
  {
    paddle.Right();
  }
  
  public void MovePaddleLeft()
  {
    paddle.Left();
  }
  
  public void ReleaseBall()
  {
    paddle.Release();
  }
}