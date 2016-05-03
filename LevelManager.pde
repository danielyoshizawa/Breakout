/*
 * Manager for all the Levels in the game, which contain a State Machine to control the Levels.
*/
public class LevelManager
{

  private Level currentLevel;
  private LevelName currentState;
  private boolean restartState;
  private boolean pauseState;
  
  public LevelManager()
  {
    currentLevel = new LevelInitial();
    currentState = LevelName.INITIAL;
    restartState = true;
    pauseState = true;
  }
  
  public void StartLevel(LevelName level)
  {
    if (currentState == level)
      return;
    setLevel(level);
  }
  
  public void RestartLevel() 
  {
    if(restartState) {
      setLevel(currentState);
      restartState = false;
    }
  }
  
  public void ReleaseRestart() 
  {
    restartState = true;
  }
  
  private void setLevel(LevelName level) 
  {
    switch(level) {
      case INITIAL:
        currentLevel = new LevelInitial();
        break;
      case LVL_ONE:
        currentLevel = new LevelOne();
        break;
    }
    currentState = level;
  }  
  
  public void Update()
  {
    currentLevel.Update();
    if (currentLevel.GetState() == LevelState.FINISHED)
    {
      currentLevel = new LevelInitial();
      currentState = LevelName.INITIAL;
      restartState = true;
    }
  }
  
  public void MovePaddleRight()
  {
    currentLevel.MovePaddleRight();
  }
  
  public void MovePaddleLeft()
  {
    currentLevel.MovePaddleLeft();
  }
  
  public void ReleaseBall()
  {
    currentLevel.ReleaseBall();
  }
  
  public void PauseGame()
  {
    if (pauseState) {
      currentLevel.Pause();
      pauseState = false;
    }
  }
  
  public void ReleasePause()
  {
    pauseState = true;
  }
}