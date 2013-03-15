// Pi Day 2012 Script by @herlifeinpixels 
// Displays Pi to the 100,000 digit
// ... supposedly, but I've yet to add screen edge detection
// and make the whole thing spiral inwards to display more digits

//-----------------------------------------------------------//

// Define Polar Coordinates
float r = 0;
float theta = 0;
float x;
float y;
int i = 0;

// Define pi stuffs
PFont font;
String pi;
int fSize = 5;
int piLength = 100000;
char currentChar;


// Pi to 100k decimal pts from http://thestarman.pcministry.com/math/pi/picalcs.htm
void setup() {
  
  size(displayWidth, displayHeight);
  background(255);
  fill(150);
  
  thread("getPI");
  font = loadFont("HelveticaNeueLTCom-Lt-48.vlw");
  textFont(font, fSize);
  
  smooth();
  
}

// Read from file
void getPI() {
  
  pi = loadStrings("PI100K.TXT")[0];
  
}

void draw() {
  
    // Polar to Cartesian conversion
    x = r * cos(theta);
    y = r * sin(theta);
    currentChar = pi.charAt(i);

    text(currentChar, x + width/2, y + height/2);
    textSize(fSize+int(i/10));
    // TODO: Rotate the char on the spot
    // rotate(theta+PI/2); // Not what I wanted but this is interesting...
    
    // textWidth() spaces the characters out properly.
    x += textWidth(currentChar);
    theta += 0.1;
    r += 1;
    i ++;

}

