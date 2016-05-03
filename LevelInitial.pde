public class LevelInitial extends Level
{
  private int posX = 50;
  private int posY = 50;
  public LevelInitial()
  {
    println("Initial Level");
  }
  
  public void Update()
  {
    textSize(32);
    fill(255,0,0);
    text("Breakout", 300,nextY());
    text("Commands : ", 50, nextY());
    text("Press 1 to Start Level One", 100, nextY()); 
    text("Press R to Reload the level", 100, nextY());
    text("Press A to move the paddle to the left", 100, nextY());
    text("Press D to move the paddle to the right", 100, nextY());
    text("Press P to pause the game", 100, nextY());
    text("Press Space to release the ball", 100, nextY());
    text("Press B to get back to this screen", 100, nextY());
    text("Press X to exit", 100, nextY());
    posY = 50;
  }
  
  private int nextY()
  {
    posY += 50;
    return posY;
  }
}