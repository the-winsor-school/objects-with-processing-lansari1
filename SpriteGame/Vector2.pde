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
    return new Vector2(this.x - other.x, this.y - other.y);
  }
  
  //compute the dot product x1*x2 + y1*y2
  float dotProduct(Vector2 other)
  {
    float prod = this.x * other.x + this.y * other.y;
    return prod;
  }
  
  // compute the magnitude of this vector.
  float magnitude()
  {
    return sqrt(x*x + y*y);
  }
  
}

//Vector2=return type, add=name, Vector2 other=parameters, Vector2 add(Vector2 other)=method header
