//your variable declarations here
Star[]night=new Star[50];
ArrayList <Asteroid> rox;
ArrayList <Bullet> bang;
SpaceShip Starfox;
boolean lvlup=false;
boolean wPressed = false;
boolean aPressed = false;
boolean sPressed = false;
boolean dPressed = false;
boolean qPressed = false;
boolean jPressed = false;
boolean spacePressed = false;
double degreesOfRotation;
double gravity;
boolean hyperspace;
boolean boom;
int cdBoots=0;
int boost;
int megaBoost;
int []x2Corners;
int []y2Corners;
int []x3Corners;
int []y3Corners;
public void setup() 
{
background(0);
  Starfox=new SpaceShip();
  size(400,400);
  for(int i=0;i<night.length;i++)
  {
    night[i]=new Star();
  }
  //  for(int i=0;i<rock.length;i++)
  //{
  //  rock[i]=new Asteroid();
  //}
    rox = new ArrayList < Asteroid > ();
    for (int a = 0; a < 15; a++) {
        rox.add(new Asteroid());
    }
    bang = new ArrayList <Bullet> ();
    for (int b=0; b<100; b++) {
      bang.add(new Bullet());
    }
}
public void draw() 
{  
    if(cdBoots<=50&&cdBoots>0){
      cdBoots=cdBoots-1;
    }

background(0);
    for(int i=0;i<night.length;i++)
    {
    night[i].show();
     if(lvlup==true){
    night[i].restart();
    }

    }
        for (int a = 0; a < rox.size(); a++) {
        rox.get(a).move();
        rox.get(a).show();
      }
        for (int b = 0 ;b < bang.size(); b++){
        bang.get(b).move();
        bang.get(b).show();
        bang.get(b).shoot();
        }
  if (wPressed==true){
    Starfox.accelerate(0.1);
    Starfox.fire();
  }
  if (sPressed==true){
    Starfox.accelerate(-0.1);
  }
  if (aPressed==true){
    Starfox.rotate(-4);
  }
  if (dPressed==true){
    Starfox.rotate(4);
  }
  if (spacePressed==true){
    Starfox.accelerate(1.0);
    Starfox.mixTape();
  }
  Starfox.show();
  Starfox.move();
  
System.out.println(bang.size());
}

  //your code here
class Star
{
  private double maX,maY,ma2X, ma2Y;
  public Star() 
  {
    fill(255);
    maX=(Math.random()*400);
    maY=(Math.random()*400);
    ma2X=(Math.random()*400);
    ma2Y=(Math.random()*400);
  }
  public void show()
  {
    fill(255);
    stroke(255);
    ellipse((float)maX,(float)maY,(float)5,(float)5);
  }
  public void restart()
  {

    maX=(Math.random()*400);
    maY=(Math.random()*400);
}
}
class Bullet extends Floater{
  private double dRadians;
     public Bullet()
  {
    myCenterX = Starfox.getX();

    myCenterY = Starfox.getY();
    myPointDirection = Starfox.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + Starfox.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + Starfox.getDirectionY();
    myColor = color(0, 255, 0);
    System.out.println(myDirectionY);
  }
    public void move ()   //move the floater in the current direction of travel
  {      
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;    
  }  
  public void shoot(){
    ellipse((float)myCenterX,(float)myCenterY,(float)2,(float)2);
  }

    public void setX(int x){
  myCenterX=x;
  }
  public int  getX(){
  return (int)myCenterX;
  }
  public void setY(int y){
  myCenterY=y;
 }
  public int getY(){
  return (int)myCenterY;
  }
  public void setDirectionX(double x){
  myDirectionX=x;
  }
  public double getDirectionX(){
  return (double)myDirectionX;
  }
  public void setDirectionY(double y){
    myDirectionY=y;
  }
  public double getDirectionY(){
    return (double)myDirectionY;
  }
  public void setPointDirection(int degrees){
    myPointDirection= degrees;
  }
  double getPointDirection(){
    return myPointDirection;
  }
} 
class Asteroid extends Floater
{
    public Asteroid(){

      myColor = color(50, 50, 50);
      myCenterX = Math.random()*400;
      myCenterY = Math.random()*400;
      myDirectionX = (Math.random()*2)-1;
      myDirectionY = (Math.random()*2)-1;
      myPointDirection = 0;
      corners=6;
      xCorners= new int[corners];
      yCorners= new int[corners];
      xCorners[0]=(int)(Math.random()*50)-25;
      yCorners[0]=(int)(Math.random()*50)-25;
      xCorners[1]=(int)(Math.random()*10)-5;
      yCorners[1]=(int)(Math.random()*10)-5;
      xCorners[2]=(int)(Math.random()*25)-12;
      yCorners[2]=(int)(Math.random()*25)-12;
      xCorners[3]=(int)(Math.random()*40)-20;
      yCorners[3]=(int)(Math.random()*40)-20;
      xCorners[4]=(int)(Math.random()*30)-15;
      yCorners[4]=(int)(Math.random()*30)-15;
      xCorners[5]=(int)(Math.random()*60)-30;
      yCorners[5]=(int)(Math.random()*60)-30;

      gravity=1.03;
    degreesOfRotation = 0;
    }
  public void restart(){
      myCenterX = Math.random()*400;
      myCenterY = Math.random()*400;
      myDirectionX = (Math.random()*2)-1;
      myDirectionY = (Math.random()*2)-1;
      xCorners[0]=(int)(Math.random()*50)-25;
      yCorners[0]=(int)(Math.random()*50)-25;
      xCorners[1]=(int)(Math.random()*10)-5;
      yCorners[1]=(int)(Math.random()*10)-5;
      xCorners[2]=(int)(Math.random()*25)-12;
      yCorners[2]=(int)(Math.random()*25)-12;
      xCorners[3]=(int)(Math.random()*40)-20;
      yCorners[3]=(int)(Math.random()*40)-20;
      xCorners[4]=(int)(Math.random()*30)-15;
      yCorners[4]=(int)(Math.random()*30)-15;
      xCorners[5]=(int)(Math.random()*60)-30;
      yCorners[5]=(int)(Math.random()*60)-30;
  }
    
  public void setX(int x){
  myCenterX=x;
  }
  public int getX(){
  return (int)myCenterX;
  }
  public void setY(int y){
  myCenterY=y;
 }
  public int getY(){
  return (int)myCenterY;
  }
  public void setDirectionX(double x){
  myDirectionX=x;
  }
  public double getDirectionX(){
  return (double)myDirectionX;
  }
  public void setDirectionY(double y){
    myDirectionY=y;
  }
  public double getDirectionY(){
    return (double)myDirectionY;
  }
  public void setPointDirection(int degrees){
    myPointDirection= degrees;
  }
  double getPointDirection(){
    return myPointDirection;
  }
}
class SpaceShip extends Floater  
{   
  public SpaceShip(){

      myColor = color(0, 100, 255);
      myCenterX = 200;
      myCenterY = 200;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      corners=3;
      xCorners= new int[corners];
      yCorners= new int[corners];
      
      /*ARRAYLIST
      ArrayList <something> sumTing
      */
      fill(myColor);
      xCorners[0]=-8;
      yCorners[0]=-8;
      xCorners[1]=16;
      yCorners[1]=0;
      xCorners[2]=-8;
      yCorners[2]=8;
      gravity=1.04;
    degreesOfRotation = 0;
  }
   public void fire(){
      fill(255,0,0);
    stroke(255,0,0);
        double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
      beginShape();
        for(int nI = 0; nI < boost; nI++)    
    {     
      xRotatedTranslated = (int)((x2Corners[nI]* Math.cos(dRadians)) - (y2Corners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((x2Corners[nI]* Math.sin(dRadians)) + (y2Corners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  
       boost=7;
       x2Corners = new int[boost];
       y2Corners = new int[boost];
             x2Corners[0]=-8;
       y2Corners[0]=-2;
             x2Corners[1]=-16;
       y2Corners[1]=-4;
             x2Corners[2]=-8;
       y2Corners[2]=-1;
             x2Corners[3]=-16;
       y2Corners[3]=0;
             x2Corners[4]=-8;
       y2Corners[4]=1;
             x2Corners[5]=-16;
       y2Corners[5]=4;
             x2Corners[6]=-8;
       y2Corners[6]=2;
    }
    public void mixTape(){
      fill(255,0,0);
    stroke(255,0,0);
        double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
      beginShape();
        for(int nI = 0; nI < megaBoost; nI++)    
    {     
      xRotatedTranslated = (int)((x3Corners[nI]* Math.cos(dRadians)) - (y3Corners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((x3Corners[nI]* Math.sin(dRadians)) + (y3Corners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  
       megaBoost=7;
       x3Corners = new int[megaBoost];
       y3Corners = new int[megaBoost];
             x3Corners[0]=-8;
       y3Corners[0]=-2*5;
             x3Corners[1]=-16*5;
       y3Corners[1]=-4*5;
             x3Corners[2]=-8*5;
       y3Corners[2]=-1*5;
             x3Corners[3]=-16*5;
       y3Corners[3]=0*5;
             x3Corners[4]=-8*5;
       y3Corners[4]=1*5;
             x3Corners[5]=-16*5;
       y3Corners[5]=4*5;
             x3Corners[6]=-8;
       y3Corners[6]=2*5;
    }
  public void setX(int x){
  myCenterX=x;
  }
  public int getX(){
  return (int)myCenterX;
  }
  public void setY(int y){
  myCenterY=y;
 }
  public int getY(){
  return (int)myCenterY;
  }
  public void setDirectionX(double x){
  myDirectionX=x;
  }
  public double getDirectionX(){
  return (double)myDirectionX;
  }
  public void setDirectionY(double y){
    myDirectionY=y;
  }
  public double getDirectionY(){
    return (double)myDirectionY;
  }
  public void setPointDirection(int degrees){
    myPointDirection= degrees;
  }
  double getPointDirection(){
    return myPointDirection;
  }
    public void move () 
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;
      lvlup=true; 
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;
      lvlup=true;
    }    
    else if(myCenterY >height)
    {    
      myCenterY = 0;
      lvlup=true;
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;
      lvlup=true;
    }   
    else lvlup=false;
  myDirectionX=myDirectionX/gravity;
  myDirectionY=myDirectionY/gravity;
  }
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  
  }   
}
public void keyPressed() 
{
  if (keyCode == 'W' || keyCode == UP) {
    wPressed = true;
  }
  if (keyCode == 'S' || keyCode == DOWN) {
    sPressed = true;
  }
  if (keyCode == 'D' || keyCode == RIGHT) {
    dPressed = true;
  }
  if (keyCode == 'A' || keyCode == LEFT) {
    aPressed = true;
  }
  if (keyCode == ' '){
    spacePressed = true;
  }
  if (keyCode == 'H'&&cdBoots==0){
    Starfox.accelerate(0);
    Starfox.setX((int)(Math.random()*400));
    Starfox.setY((int)(Math.random()*400));
    Starfox.setDirectionX(0);
    Starfox.setDirectionY(0);
    Starfox.setPointDirection((int)(Math.random()*360));
  }
  if (keyCode == 'J'){
      bang.add(0, new Bullet());
  }
}
public void keyReleased() {
  if (keyCode == 'W' || keyCode == UP) {
    wPressed = false;
  }
  if (keyCode == 'S' || keyCode == DOWN) {
    sPressed = false;
  }
    if (keyCode == 'D' || keyCode == RIGHT) {
    dPressed = false;
  }
  if (keyCode == 'A' || keyCode == LEFT) {
    aPressed = false;
  }
    if (keyCode == ' '){
    spacePressed = false;
  }
  if (keyCode == 'H'){
    hyperspace = false;
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
