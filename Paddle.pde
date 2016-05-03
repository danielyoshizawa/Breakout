public class Paddle extends Entity
{
  private Ball ball;
  
  public Paddle(float x, float y, float w, float h)
  {
    super(x,y,w,h);
  }
  
  public void Update()
  {
    fill(0,0,255);
    rect(GetX(), GetY(), GetW(), GetH());
  }
  
  public void Right()
  {
    if (paused)
      return;
      
    if (GetX() < 800 - GetW())
    {
      SetX(GetX() + 5);
      
      if (!ball.IsReleased())
        ball.SetX(GetX() + (GetW() / 2) - (ball.GetW() / 2));
    }
  }
  
  public void Left()
  {
    if (paused)
      return;
    if (GetX() > 0)
    {
      SetX(GetX() - 5);
      
      if(!ball.IsReleased())
        ball.SetX(GetX() + (GetW() / 2) - (ball.GetW() / 2));
    }
  }
  
  public void SetBall(Ball ball)
  {
    this.ball = ball;
    this.ball.SetX(GetX() + (GetW()/2) - (ball.GetW() / 2));
    this.ball.SetY(GetY() - ball.GetH());
  }
  
  public void Release()
  {
    ball.Release();
  }
}