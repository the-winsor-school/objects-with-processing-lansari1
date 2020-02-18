/* Sprite is an abstract class representing something that will move around the screen
 * a Sprite must know it's current position (x, y) and it's velocity vector <dx, dy>
 * by default a Sprite starts with <0, 0> velocity.
 * included in the Sprite class are a few standard methods that are useful--see comments
 */
abstract class Sprite
{
  // this Sprite's current location.
  //float x, y;
  
  // this Sprite's current velocity vector.
  //float dx, dy;
  
  // replaced this
  // this Sprite's current location.
  Vector2 location;
  
  // this Sprite's current velocity vector.
  Vector2 velocity;
  
  
  // initialize a Sprite at a given coordinate.
  Sprite(float x, float y)
  {
    //this.x = x;
    //this.y = y;
    
    //this.dx = 0;
    //this.dy = 0;
    
    // Altered the "Implementation" without changing the "Interface" of this class.
    
    this.location = new Vector2(x, y);
    this.velocity = new Vector2(0, 0);
  }
  
  // initalize a Sprite at a given coordinate with a given velocity.
  Sprite(float x, float y, float dx, float dy)
  {
    //this.x = x;
    //this.y = y;
    //this.dx = dx;
    //this.dy = dy;
    
    this.location = new Vector2(x, y);
    this.velocity = new Vector2(dx, dy);
  }
  
  // check to see if this Sprite is sitting on a particular color.
  boolean collidesWith(color c)
  {
    // we will need to replace 'x' with 'location.x' and 'y' with 'location.y' thoughout.
    return get((int)location.x,(int)location.y)==c;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite
  void chase(Sprite other)
  {
    /*
    float speed = sqrt(dx*dx + dy*dy);
    float delX = other.x - this.x;
    float delY = other.y - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
    */
    
    // Do the same exact calculations, but now using Vectors
    float speed = velocity.magnitude(); //velocity.magnitude() = sqrt(dx*dx + dy*dy)
    
    //the interface is the names of all these things (add, mag, etc)
    //the actual code behind the interface is the implementation (but it's not important to the interface, don't have to understand how it works in order to use it)
    
    Vector2 diff = other.location.subtract(this.location);
    float mag = diff.magnitude();
    
    if(diff.x != 0) location.x += (diff.x / mag) * speed; //diff is a vector and mag is the distance
    
    if(diff.y != 0) location.y += (diff.y / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>| 
  // directly toward another Sprite while mafloataing
  // a minimum follow distance
  void chase(Sprite other, float minFollowDistance)
  {
    float speed = sqrt(velocity.x*velocity.x + velocity.y*velocity.y);
    float delX = other.location.x - this.location.x;
    float delY = other.location.y - this.location.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(mag > 0 && mag <= minFollowDistance) 
    {
      if(delY < delX)
      {
        location.x -= (delY / mag) * speed * 0.5;
        location.y += (delX / mag) * speed * 0.5;
      }
      else
      {
        location.x += (delY / mag) * speed * 0.5;
        location.y -= (delX / mag) * speed * 0.5;
      }
      return;
    }
    
    if(delX != 0) location.x += (delX / mag) * speed;
    if(delY != 0) location.y += (delY / mag) * speed;
  }
  
  // make this Sprite move at the speed := |<dx, dy>|
  // directly toward your mouse pofloater!
  void followMouse()
  {
    float speed = sqrt(velocity.x*velocity.x + velocity.y*velocity.y);
    float delX = mouseX - this.location.x;
    float delY = mouseY - this.location.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) location.x += (delX / mag) * speed;
    if(delY != 0) location.y += (delY / mag) * speed;
  }
  
  // move this sprite according to it's current velocity vector
  // bounces off the walls
  void move()
  {
    location.x += velocity.x; //moving the location by the speed and direction
    location.y += velocity.y;
    
    // make sure we don't go out of bounds
    if(location.x < 0) //limits on where it can go
    { 
      location.x += width; //width is the width of the screen
    }
    if(location.x > width) 
    {
      location.x -= width;
    }
    if(location.y < 0) 
    {
      location.y += height; //height is the height of the screen
    }
    if(location.y > height)
    {
      location.y -= height;
    }
  }
  
  // get the distance between centers of this Sprite and another
  float distanceTo(Sprite other)
  {
    float delX = other.location.x - this.location.x;
    float delY = other.location.y - this.location.y;
    return sqrt(delX*delX + delY*delY);
  }
  
  // Control this sprite using the Arrow Keys
  void keyboardControl()
  {
    // If I hit the LEFT arrow, go Left
    if(keyCode == LEFT)
    {
      velocity.x = -1;
      velocity.y = 0;
    }
    // if I hit the RIGHT arrow, go Right
    else if(keyCode == RIGHT)
    {
      velocity.x = 1;
      velocity.y = 0;
    }
    // if I hit the UP arrow, go Up
    if(keyCode == UP)
    {
      velocity.y = -1;
      velocity.x = 0;
    }
    // if I hit the DOWN arrow, go Down
    else if(keyCode == DOWN)
    {
      velocity.y = 1;
      velocity.x = 0;
    }
    // if I hit the Space Bar, Stop
    if(keyCode == ' ')
    {
      velocity.x = 0;
      velocity.y = 0;
    }
    
    // move x and y in the appropriate way
    location.x = location.x + velocity.x;
    location.y = location.y + velocity.y;
    
    // make sure we don't go out of bounds
    if(location.x < 0) location.x += width;
    if(location.x > width) location.x -= width;
    if(location.y < 0) location.y += height;
    if(location.y > height) location.y -= height;
  }
  
  // a Sprite itself is abstract and does not actually know
  // what it looks like.  This method must be overriden in 
  // any classes which /are/ Sprites.
  abstract void drawSprite();
}
