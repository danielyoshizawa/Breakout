/*
 * All Levels in the game must extend this class and Override Update from GameObject
 * I'm not sure if this is the best way to represent things in java, but I' trying to
 * reproduce the Multi Hierarchy from C++
*/

public class Level implements GameObject
{ 
  
  protected LevelState levelState;
  protected Ball ball;
  protected Paddle paddle;
  
  public void Update()
  {
    println("Level Update");
  }
  
  public void MovePaddleRight()
  {
  
  }
  
  public void MovePaddleLeft()
  {
    
  }
  
  public void ReleaseBall()
  {
    
  }
  
  public LevelState GetState()
  {
    return levelState;
  }
  
  public void Pause()
  {
    if (paddle == null || ball == null)
      return;
      
    if (levelState == LevelState.RESUMED)
    {
      levelState = LevelState.PAUSED;
      ball.Pause();
      paddle.Pause();
    } else {
      levelState = LevelState.RESUMED;
      ball.UnPause();
      paddle.UnPause();
    }
  }
  
}