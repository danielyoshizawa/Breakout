/*
 * I can' use HitBox because It only checks if the collision happened and I need to know in which point it happened
 * also only the ball collide with the blocks and the paddle so I believe that it is easier to use a custom collision Detector
 * I hope that' ok
*/

public class CollisionManager
{

  private ArrayList<Entity> blockList;
  private Entity paddle;
  
  public CollisionManager()
  {
    blockList = new ArrayList<Entity>();
  }
  
  public boolean VerticalBorders(float x)
  {
    if (x > 800 - 20 || x < 0)
        return true;
     return false;
  }
  public boolean HorizontalBorders(float y)
  {
    if (y < 0)
        return true;
     return false;
  }
  
  public boolean BottomBorder(Entity ball)
  {
    if (ball.GetY() > 600)
    {
      ball.MarkForDeletion();
      return true;
    }
    return false;  
  }
  
  public void SetBlockList(ArrayList<Entity> blockList)
  {
    this.blockList = blockList;
  }
  
  public void SetPaddle(Entity paddle)
  {
    this.paddle = paddle;
  }
  
  public boolean VerticalLeftBlock(Entity ball)
  {
    float pointX = ball.GetX() + ball.GetW();
    float pointY = ball.GetY();
    
    for (Entity e : blockList)
    {
      if (pointY > e.GetY() - 5 && pointY < e.GetY() + e.GetH() + 5)
        if (pointX >= e.GetX() && pointX < e.GetX() + 5)
        {
          e.Hit();
          return true;
        }
    }
    
    return false;
  }
  
  public boolean VerticalRightBlock(Entity ball)
  {
    float pointX = ball.GetX();
    float pointY = ball.GetY();
    
    for (Entity e : blockList)
    {
      if (pointY > e.GetY() - 5 && pointY < e.GetY() + e.GetH() + 5)
        if (pointX <= e.GetX() + e.GetW() && pointX > e.GetX() + e.GetW() - 5)
        {
          e.Hit();
          return true;
        }
    }
    
    return false;
  }
  
  public boolean HorizontalBottomBlock(Entity ball)
  {
    float pointX = ball.GetX();
    float pointY = ball.GetY();
    for (Entity e : blockList)
    {
      if (pointX > e.GetX() - 5 && pointX < e.GetX() + e.GetW() + 5)
        if (pointY <= e.GetY() + e.GetH() && pointY > e.GetY() + e.GetH() - 5)
        {
          e.Hit();
          return true;
        }
    }
    
    return false;
  }
  
  public boolean HorizontalTopBlock(Entity ball)
  {
    float pointX = ball.GetX();
    float pointY = ball.GetY() + ball.GetH();
    
    for (Entity e : blockList)
    {
      if (pointX > e.GetX() - 5 && pointX < e.GetX() + e.GetW() + 5)
        if(pointY >= e.GetY() && pointY < e.GetY() + 5)
        {
          e.Hit();
          return true;
        }
    }
    
    return false;
  }
  
  public boolean PaddleCollision(Entity ball)
  {
    float pointX = ball.GetX();
    float pointY = ball.GetY() + ball.GetH();
    
    if (pointX > paddle.GetX() - 5 && pointX < paddle.GetX() + paddle.GetW() + 5)
      if (pointY >= paddle.GetY() && pointY < paddle.GetY() + 5)
        return true;
     return false;
  }
}