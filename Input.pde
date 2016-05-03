void Input()
{
  if(keys[0] == true)
  {
    levelManager.StartLevel(LevelName.INITIAL);
  }
  if(keys[1] == true)
  {
    levelManager.StartLevel(LevelName.LVL_ONE);
  }
  if(keys[2] == true)
  {
    levelManager.RestartLevel();
  }
  if(keys[3] == true)
  {
    levelManager.MovePaddleLeft(); // I don' like this way, I have to think a better way
  }
  if(keys[4] == true)
  {
    levelManager.MovePaddleRight();
  }
  if(keys[5] == true)
  {
    levelManager.ReleaseBall();
  }
  if(keys[6] == true)
  {
    exit();
  }
  if(keys[7] == true)
  {
    levelManager.PauseGame();
  }
  
}

void keyPressed()
{
  if (key == 'b')
  {
    keys[0] = true;
  }
  if (key == '1')
  {
    keys[1] = true;
  }
  if (key == 'r')
  {
    keys[2] = true;
  }
  if (key == 'a')
  {
    keys[3] = true;
  }
  if (key == 'd')
  {
    keys[4] = true;
  }
  if (key == ' ')
  {
    keys[5] = true;
  }
  if (key == 'x')
  {
    keys[6] = true;
  }
  if (key == 'p')
  {
    keys[7] = true;
  }
}

void keyReleased() 
{
  if (key == 'b')
  {
    keys[0] = false;
  }
    if (key == '1')
  {
    keys[1] = false;
  }
  if (key == 'r')
  {
    keys[2] = false;
    levelManager.ReleaseRestart();
  }
  if (key == 'a')
  {
    keys[3] = false;
  }
  if (key == 'd')
  {
    keys[4] = false;
  }
  if (key == ' ')
  {
    keys[5] = false;
  }
  if (key == 'x')
  {
    keys[6] = false;
  }
  if (key == 'p')
  {
    keys[7] = false;
    levelManager.ReleasePause();
  }
  
}