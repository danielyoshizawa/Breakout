import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
boolean [] keys;
LevelManager levelManager;

void setup()
{
  size(800,600);
  keys = new boolean[20];
  levelManager = new LevelManager(); 
  minim = new Minim(this);
}

void draw()
{
  background(0,0,0);
  Input();
  levelManager.Update();
}