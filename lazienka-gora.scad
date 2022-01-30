d = 269;
w = 201;
h = 250;

lewastrona=false;

// podloga
difference() {
    translate([0,0,-10]) cube([w,d,10]);

    for(a=[0:20]) { translate([a*20,0,-0.1+0.01]) cube([1,1000,0.1]); }
    for(a=[0:20]) { translate([0,a*20,-0.1+0.01]) cube([1000,1,0.1]); }
}

// sciana lewa
if (lewastrona) translate([-10,0,0]) cube([10,d,h]);

// sciana prawa
translate([w,0,0]) cube([10,d,h]);

// sciana okno
translate([0,d,0]) difference() { 
    cube([w,10,h]);
    translate([94,-1,88]) cube([56,12,100]);
}


// sciana przednia
translate([w-30-53,-10,0]) {
  cube([30+53,10,h]); // sama sciana
  translate([30,10,0]) {
      cube([53,30,h]); // komin1
      translate([10,30,0]) { cube([53-10,7,h]); // komin2
          translate([43-7,10+4,0]) cylinder(h=h, r1=6, r2=6, center=false);
      }
  }
}

// zabudowa
color("white",alpha=0.2) translate([w,d-146-50,0]) rotate(a=[0,0,-90]) translate([0,-19,0]) cube([50,19,112]); // prawo od geberitu
color("white",alpha=0.2) translate([w,d-146-50,112]) rotate(a=[0,0,-90]) translate([0,-19,0]) cube([50,19,30]);
color("white") translate([w,d-146,0]) rotate(a=[0,0,-90]) translate ([0,-19,112+30]) cube([50+50,19,h-112-30]); // gorna szafka

// wyrownanie sciany
color("white") translate([148,29+8,0]) translate([0,-7,0]) cube([10,7,h]);

// kabina
module kabina(w,d) {
    color(alpha=0.2) cube([w,d,200]);
}
if (lewastrona) translate([0,d-100,0]) kabina(80,100);

// umywalka
module umywalka(w,h) {
    d=50;
    translate([0,-d,0]) {
        difference () {
            union () {
                translate([0,10,0]) cube([w,d-10,h]); // misa
                translate([10,10,0]) cylinder(h=h, r1=10, r2=10, center=false); // lewy rog
                translate([w-10,10,0]) cylinder(h=h, r1=10, r2=10, center=false); // prawy rog
                translate([10,0,0]) cube([w-20,10,h]); // przod
            }
            // difference
            translate([5,10,h-10]) cube([w-10,d-20,11]);
        }
    }
}

translate([w,d-20,0]) rotate(a=[0,0,-90]) umywalka(103,85);
//translate([w,d-20-60,0]) rotate(a=[0,0,-90]) umywalka(60,85);

// kibelek
module kibelek(w,h) {
    translate([0,-50,0]) {
        difference () {
            union () {
                translate([0,10,0]) cube([w,40,h]); // misa
                translate([10,10,0]) cylinder(h=h, r1=10, r2=10, center=false); // lewy rog
                translate([w-10,10,0]) cylinder(h=h, r1=10, r2=10, center=false); // prawy rog
                translate([10,0,0]) cube([w-20,10,h]); // przod
            }
            // difference
            translate([w/2,(w/2),h-15+0.001]) cylinder(h=15, r1=(w-20)/2, r2=(w-5)/2, center=false);
        }
    }
}

// geberit
module geberit() {
    translate([0,-19,0]) 
    difference() {
        cube([50,19,112]);
        translate([20/2,-0.001,90]) cube([30,3,15]);
    }
}
module kibel(w,h) {
    geberit();
    translate([5,-19,0]) kibelek(w,h);
}

translate([w,d-146,0]) rotate(a=[0,0,-90]) kibel(40,40);


// gniazdko
module gniazdko(h) {
    translate([0,0,h]) {
        translate([0,-1,0]) rotate([-90,0,0]) cylinder(h=1, r1=4, r2=4, center=false);
    }
}
color("white") translate([w,d-118,0]) rotate([0,0,-90]) gniazdko(110);

// recznikowiec
module recznikowiec() {
    for (a=[0:15]) { translate([0,0,a*10]) rotate([0,90,0]) cylinder(h=50, r=1.5, center=false); }
}
if (lewastrona) color("white") { translate([0,d-170,50]) rotate([0,0,-90]) recznikowiec() ;}
