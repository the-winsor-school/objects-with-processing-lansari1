
// this is your player, they're a blob and they're kinda boring.
Blob player;
Blob other; 

void setup()
{
  size(500, 500);
  
  // Blob parameters are: 
  // x (px), y (px), radius (px), 
  // x-speed (px/frame), y-speed (px/frame), and color.
  player = new Blob(100, 100, 15, 1.25, 1.5, color(150, 0, 255));
  other = new Blob(400, 200, 10, 10, 2, color(128, 0, 200)); //new takes the idea of a Blob and makes one; the difference between the idea of a chair and the actual thing; player is an actual blob and it has a certain set of attributes
}

void draw()
{
  background(255,255,255);
  
  // make the player move automatically.
  other.move();
  player.chase(other);
  
  // draw the player on the screen.
  player.drawSprite();
  other.drawSprite();
}
