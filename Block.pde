public class Block extends Entity
{
  public Block(float x, float y, int life)
  {
    super(x,y,Common.BLOCK_W, Common.BLOCK_H);
    this.life = life;
  }
  
  public void Update()
  {
    if (life == 5)
      fill(255,0,0);
    if (life == 4)
      fill(255,255,0);
    if (life == 3)
      fill(0,255,0);
    if (life == 2)
      fill(45,225,225);
    if (life == 1)
      fill(0,0,255);
    if (life == 0)
      this.MarkForDeletion();
      
    rect(GetX(), GetY(), w, h);
  }
}