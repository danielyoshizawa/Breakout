
class Entity implements GameObject
{
  private float x, y;
  protected float w, h;
  boolean markedForDeletion;
  protected int life;
  protected boolean paused;
  
  public Entity(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    markedForDeletion = false;
    life = 0;
    paused = false;
  }
  
  public void SetX(float x) 
  {
    this.x = x;
  }
  
  public void SetY(float y)
  {
    this.y = y;
  }
  
  public float GetX() 
  {
    return x;
  }
  
  public float GetY()
  {
    return y;
  }
  
  public float GetW()
  {
    return w;
  }
  
  public float GetH()
  {
    return h;
  }
  
  public void Update()
  {
    
  }
  
  public float GetHorizontalMiddlePoint() 
  {
    return x + w/2;
  }
  
  public float GetVerticalMiddlePoint()
  {
    return y + h/2;
  }
  
  public void MarkForDeletion()
  {
    markedForDeletion = true;
  }
  
  public boolean IsMarkedForDeletion()
  {
    return markedForDeletion;
  }
  
  public void Hit()
  {
    life--;
  }
  
  public void Pause()
  {
    paused = true;
  }
  
  public void UnPause()
  {
    paused = false;
  }
}