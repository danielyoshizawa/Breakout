public class Ball extends Entity
{
  private float speedX;
  private float speedY;
  private CollisionManager collisionManager;
  private boolean isReleased;
  
  public Ball(float x, float y, float w, float h, CollisionManager collisionManager)
  {
    super(x,y,w,h);
    speedX = 3;
    speedY = 3;
    this.collisionManager = collisionManager;
    isReleased = false;
  }
  
  public void Update()
  {
    if (isReleased)
    {
      if (!collisionManager.BottomBorder(this))
      {
        if (collisionManager.VerticalBorders(GetX()) 
            || collisionManager.VerticalLeftBlock(this) 
            || collisionManager.VerticalRightBlock(this)) 
         {
          invertSpeedX();
          AudioPlayer hitSFX = minim.loadFile("hitSound.wav");
          hitSFX.play();
         }
          
        if (collisionManager.HorizontalBorders(GetY()) 
            || collisionManager.HorizontalBottomBlock(this) 
            || collisionManager.HorizontalTopBlock(this) 
            || collisionManager.PaddleCollision(this)) 
        {
          invertSpeedY();
          AudioPlayer hitSFX = minim.loadFile("hitSound.wav");
          hitSFX.play();
        }
          
        if (!paused)
        {
          SetX(GetX() + speedX);
          SetY(GetY() + speedY);
        }
      }
    }
    
    fill(255,0,0);
    rect(GetX(), GetY(), w, h);
  }
  
  private void invertSpeedX()
  {
    speedX *= -1;
  }
  
  private void invertSpeedY()
  {
    speedY *= -1;
  }
  
  public void Release()
  {
    isReleased = true; 
  }
  
  public boolean IsReleased()
  {
    return isReleased;
  }
}