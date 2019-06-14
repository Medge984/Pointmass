// Surface Gravity(m/s²)
float sg = 9.807;

// Radius of Body(km)
float rb = 6371;

// Initial Altitude(km)
float iAl = 100;

int fastForward = 1;
Mass mass;
void setup() {
  size(300, 1050);
  frameRate(60);

  mass = new Mass();
}

void draw() { 
  translate(0, 25);  

  for (int i = 0; i < fastForward; i++ ) {
    background(0);
    mass.motion();
    mass.display();
    mass.massData();
    mass.marker();
  }
}
