class Mass {
  PVector loc, vel, acc;
  int nframe, timer;
  float cAl, massY, mult;

  FloatList maxVel, maxAcc;

  Mass() {
    loc = new PVector(width/2, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    maxVel = new FloatList();
    maxAcc = new FloatList();

    mult = 1000/iAl;

    nframe = 0;
    timer = 0;
    cAl = iAl * mult;
    massY = 0;
  }


  void display() {
    int diameter = 20;
    strokeWeight(1);
    stroke(255);
    fill(150);
    ellipse(width - 30, massY - diameter/2, diameter, diameter);

    line(0, 0, width, 0);
    line(0, 1000, width, 1000);
  }

  void motion() {
    if ( cAl <= 0 ) {
      acc.y = 0;
      vel.y = 0;
      loc.y = iAl * mult;
      massY = 1000;
      cAl = 0;
    } else {     
      acc.y = (((((sg*(1/iAl))/(sq(frameRate))) * sq(rb))/sq(rb+(cAl/mult))));

      vel.add(acc);
      loc.add(vel);
      cAl = (iAl * mult) - loc.y;
      massY = 1000 - cAl;

      nframe++;
      int a = nframe % 60;
      if ( a == 0) {
        timer++;
        println("T " + timer + "  ial " + iAl * mult + "  cal " + cAl + "  acc " + acc.y + "  vel " +vel.y + "  loc " +loc.y);
        //println("T " + timer + "  ial " + iAl * 1000 + "  cal " + cAl * iAl + "  acc " + acc.y + "  vel " + ((frameRate * vel.y)/(1/iAl)) + "  loc " +loc.y);
      }
    }
  }

  void massData() {
    String time = nf(timer);
    String alititude = nf(cAl * 1000/mult, 0, -1);
    String velocity = nf(((frameRate * vel.y)/(1/iAl)), 0, 2);
    String acceleration = nf((sg * sq(rb))/sq(rb+(cAl/mult)), 0, 3);

    int x = 20;
    int y = 40;
    int gap = 15;

    fill(0);
    rect(x - 7,y - 17,x+200,y + 28);
    
    fill(255);
    textSize(14);

    text("Time(s): " + time, x, y);
    text("Altitude(m): " + alititude, x, y + gap);
    text("Velocity(m/s): " + velocity, x, y + (2*gap));
    text("Acceleration(m/s²): " + acceleration, x, y + (3*gap));
    
    if (massY > 990 ) {
      maxVel.append(((frameRate * vel.y)/(1/iAl)));
      maxAcc.append((sg * sq(rb))/sq(rb+(cAl/mult)));
      
      float maxvel = maxVel.max();
      String maxV = nf(maxvel, 0, 2);

      float maxacc = maxAcc.max();
      String maxA = nf(maxacc, 0, 3);

      if (cAl <= 0) {
        text("Peak Velocity(m/s): " + maxV, x, y + (5*gap));
        text("Peak Acceleration(m/s²): " + maxA, x, y + (6*gap));
      }
    }
  }

  void marker() {
    int x = 20;

    if ( iAl*1000 > 1.2 * 1.76 && (iAl*1000)/1.76 < 300 ) {
      text("Human, 1.76m", x + 2, (1000 - (1000 * 1.76/(iAl*1000))));
      line(x, (1000 - (1000 * 1.76/(iAl*1000))) + 2, 240, (1000 - (1000 * 1.76/(iAl*1000))) + 2);
    }

    if ( iAl*1000 > 1.2 * 830 && (iAl*1000)/830 < 300 ) {
      text("Burj Khalifa, 830m", x + 2, (1000 - (1000 * 830/(iAl*1000))));
      line(x, (1000 - (1000 * 830/(iAl*1000))) + 2, 240, (1000 - (1000 * 830/(iAl*1000))) + 2);
    }

    if ( iAl*1000 > 1.2 * 8848 && (iAl*1000)/8848 < 200 ) {
      text("Everest, 8,848m", x + 2, (1000 - (1000 * 8848/(iAl*1000))));
      line(x, (1000 - (1000 * 8848/(iAl*1000))) + 2, 240, (1000 - (1000 * 8848/(iAl*1000))) + 2);
    }

    if ( iAl*1000 > 1.2 * 25000 && (iAl*1000)/25000 < 200 ) {
      text("Olympus Mons, 25,000m", x + 2, (1000 - (1000 * 25000/(iAl*1000))));
      line(x, (1000 - (1000 * 25000/(iAl*1000))) + 2, 240, (1000 - (1000 * 25000/(iAl*1000))) + 2);
    }

    if ( iAl*1000 > 1.2 * 41425 && (iAl*1000)/41425 < 200 ) {
      text("Longest Freefall, 41,425m", x + 2, (1000 - (1000 * 41425/(iAl*1000))));
      line(x, (1000 - (1000 * 41425/(iAl*1000))) + 2, 240, (1000 - (1000 * 41425/(iAl*1000))) + 2);
    }

    if ( iAl*1000 > 1.2 * 100000 && (iAl*1000)/100000 < 200 ) {
      text("Kármán line, 80-100km", x + 2, (1000 - (1000 * 100000/(iAl*1000))));
      line(x, (1000 - (1000 * 100000/(iAl*1000))) + 2, 240, (1000 - (1000 * 100000/(iAl*1000))) + 2);
    }

    if ( iAl*1000 > 1.2 * 408000 && (iAl*1000)/408000 < 200 ) {
      text("ISS Orbit, 408km", x + 2, (1000 - (1000 * 408000/(iAl*1000))));
      line(x, (1000 - (1000 * 408000/(iAl*1000))) + 2, 240, (1000 - (1000 * 408000/(iAl*1000))) + 2);
    }

    if ( iAl*1000 > 1.2 * 569000 && (iAl*1000)/569000 < 200 ) {
      text("Huble Orbit, 569km", x + 2, (1000 - (1000 * 569000/(iAl*1000))));
      line(x, (1000 - (1000 * 569000/(iAl*1000))) + 2, 240, (1000 - (1000 * 569000/(iAl*1000))) + 2);
    }
  }
}
