class Vector2
{
  float x, y; //coordinates of this Vector2, instance variables
  
  //initialize an instance of a Vector2, go from class to object (putting data into the structure created)
  Vector2(float x, float y)
  {
    this.x = x; //the x (x1) right after "this" refers to the x in line 6 and the = x says that that x (x1) is the same as the x (x2) in line 6
    this.y = y; //"this" is the key word for self-reference (refers to the instance/object itself), talking about the x and y in line 3
  } 
  
  Vector2 add(Vector2 other) //Vector2 at the beginning of the line is the ReturnType and add is the method
  {
    return new Vector2(this.x + other.x, this.y + other.y); //new vector that is the sum of the x coordinates and sum of the y coordinates
  }
  
  // Do subtraction~
  Vector2 subtract(Vector2 other)
  {
    return new Vector2(this.x - other.x, this.y - other.y);//subtracts the x-component of other from the x-component of this vector (and the same for the y-components) and returns the resultant vector which has these new x- and y-components
  }
  
  //compute the dot product x1*x2 + y1*y2
  float dotProduct(Vector2 other)
  {
    float prod = this.x * other.x + this.y * other.y;//multiplying the x- and y-components of the other and this vectors
    return prod; //returning the product (which is a scalar value)
  }
  
  // compute the magnitude of this vector.
  float magnitude()
  {
    return sqrt(x*x + y*y);//the magnitude of the vector is the squareroot of the square of its x- and y-components
  }
  
  Vector2 inverse() 
  {
    return new Vector2(this.x*-1, this.y*-1);//returning the inverse of the vector by "reversing" (i.e. multiplying by -1) the x- and y-components
  }
  
  Vector2 scale(float s)
  {
    float newX = (float)(this.x*s);//increases/decreases the scale of the x-component of this vector by multiplying it by the scalar s
    float newY = (float)(this.y*s);//increases/decreases the scale of the y-component of this vector by multiplying it by the scalar s
    return new Vector2(newX, newY);//returns the new vector of changed scale (unless s=1)
  }
  
  Vector2 perpendicular()
  {
    return new Vector2(this.y, this.x*-1);//returns a vector perpendicular to the original by multiplying the x-component by -1 and thereby "flipping" the vector
  }
  
  Vector2 unitVector()
  {
    return new Vector2(this.x/this.magnitude(), this.y/this.magnitude());//to produce a unit vector, we keep the vector pointing in the same direction, change but change its length to one
  }
  
  //float angle(Vector2 other)
  {
    //float a = Vector2.angleBetween(this, other); //I am getting an error message for this line which says that the funcion angleBetween(Vector2, Vector2) does not exist, but I'm not exactly sure how to fix the issue. I found the method "angleBetween" on the internet
    //return degrees(a); //angleBetween is supposed to yield a result in radians, so this would change the return the result in degrees 
  }
}

//Vector2=return type, add=name, Vector2 other=parameters, Vector2 add(Vector2 other)=method header
