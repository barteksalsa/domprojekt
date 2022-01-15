// floor

h=270;
w=505;
d=367;

//sciany
color("white")
 {
  //podloga
  translate([0,0,-1])
    cube([w,d,1]);
  //lewa   
  translate([-1,0,0])
    cube([1,d,h]);
  // tylna
  translate([220,d+1,0])
    cube([285,1,h]);
  // prawa
  translate([w,0,0])
    difference() {
     cube([1,d,h]);
     translate([-1,87,82]) cube([3,145,145]);
    };
  // parapet
  translate([w-4,d-131,82])
    rotate(a=[0,0,-90])
      cube([151,4,1]);
  // tylna
  translate([w-108,0,0])
    cube([108,1,h]);
 }
 
 // kolumna
 color("white")
   translate([89,190,0])
     cube([28,28,300]);
 
 // L: ciag szafek na tylnej scianie
 k=100;
 s=120;  
 LX=k+s; // poczatek szafek z tylu
 LY=d-60;  // poczatek szafek z tylu
 SZ_X=w-LX;
 
 wys_blatu = 82;
 
 // blat tyl
 color("white")
   translate([LX,LY,wys_blatu])
     cube([SZ_X,60,3]);
 
 color("green") {
   szafka(LX,80);
   szafka(LX+80,60);
   szafka(LX+140,60);
   szafka(LX+200,25);
 }


// szafa po lewej 
color("green") {
    cube([68,190+20,236]);
}

// zlew
module zlew() {
color("DimGray") {
    translate([LX+140,LY+2,wys_blatu+4]) {
      cube([80,50,1]);
      translate([30,50,0]) rotate(a=[30,0,0]) cube([5,5,30],center=true);
    }
}
color("#404040") {
    translate([LX+143,LY+4,wys_blatu+4]) {
      cube([80-4-20,50-4,1.5]);
}
}
}
zlew();
 
module szafka(leftoffset,width) {
    translate([leftoffset,d-60,0])
      cube([width,60,82]);
}

// szafki gorne z tylu
color("green") {
    umiesc_z_przodu([0,20,140]) szafka_wiszaca(80);
    umiesc_z_przodu([80,20,140]) szafka_wiszaca(60);
    umiesc_z_przodu([80+60,20,140]) szafka_wiszaca(80);
    umiesc_z_przodu([80+60+80,20,140]) szafka_wiszaca(60);
}

module szafka_wiszaca(w) {
    cube([w,40,80]);
}

// umiesc
module umiesc_z_przodu(a) {
    translate([LX+a.x,LY+a.y,a.z]) 
      rotate(a=[0,0,0])
        children();
}

R_szerokosc=70;
RX=w-60;
RY=d-60;

// blat
module blat(w) {
color("white")
      cube([w,60,3]);
}

katy=[45,135,-135,-45];

// plyta indukcyjna
module plyta_indukcyjna() {
    cube([60,50,1]);
    for (i=[0:3]) {
    translate([30+sin(katy[i])*20,25+cos(katy[i])*20,0]) 
        cylinder(2,r1=10,r2=10,center=true);
    }
}


//---- bok
// blaty
umiesc_z_boku([60,0,wys_blatu]) blat(70);
umiesc_z_boku([60+70,0,wys_blatu-4]) blat(40);
// plyta
color("#400040") umiesc_z_boku([60,3,wys_blatu+4]) plyta_indukcyjna();
// szafki
color("green") {
    umiesc_z_boku([60,0,0]) cube([60,60,82]);
    umiesc_z_boku([60+60,0,0]) cube([10,60,82]);
    umiesc_z_boku([40,20,140]) szafka_wiszaca(80);
    umiesc_z_boku([60+60+10,0,0]) cube([40,60,76]);
}

// umiesc
module umiesc_z_boku(a) {
    translate([RX+a.y,d-a.x,a.z]) 
      rotate(a=[0,0,-90])
        children();
}

// lewa strona
//color("white",alpha=0.1) translate([LX,LY-60,wys_blatu]) cube([60,100,3]);
//color("green", alpha=0.1) translate([LX,LY-60,0]) cube([60,100,wys_blatu]);

// slupek z piekarnikiem

// lodowka
translate([68,220,0]) rotate([0,0,90]) lodowka();

// piekarnik
translate([68,220+92,0]) rotate([0,0,90]) piekarnik();


// lodowka
module lodowka() {
  szer=92;
  gl=68;
  color("silver") cube([szer,gl,180]);
  color("#808080") translate([szer/2-4,-1,60]) cube([2,1,50]);
  color("#808080") translate([szer/2+4,-1,60]) cube([2,1,50]);
  color("#808080") translate([szer/4-10,-1,70]) cube([20,1,30]);
}

// piekarnik
module piekarnik() {
    color("green") cube([60,60,140]);
    h0=84;
    translate([0,-1,h0]) color("black") cube([60,1,45]);
    translate([5,-3,h0+35]) color("white") cube([50,1,1]);
    translate([60/2-5,-3,h0+37.5]) color("blue") cube([10,1,5]);
}


/*
// blat stolu
translate([w-70-260,70,75]) color("brown", alpha=0.5) cube([260,100,3]);

translate([w,60+30,0]) rotate(a=[0,0,90]) krzeslo(); // szczyt
translate([w-70-60,0,0]) rotate(a=[0,0,0]) krzeslo();
translate([w-70-60-60,0,0]) rotate(a=[0,0,0]) krzeslo();
translate([w-70-60-60-60,0,0]) rotate(a=[0,0,0]) krzeslo();
translate([w-70-60-60-60-60,0,0]) rotate(a=[0,0,0]) krzeslo();
translate([w-70,70+100+70,0]) rotate(a=[0,0,180]) krzeslo();
translate([w-70-60,70+100+70,0]) rotate(a=[0,0,180]) krzeslo();
translate([w-70-60-60,70+100+70,0]) rotate(a=[0,0,180]) krzeslo();
translate([w-70-60-60-60,70+100+70,0]) rotate(a=[0,0,180]) krzeslo();
translate([w-70-60-60-60-60-90,100+70-20,0]) rotate(a=[0,0,-90]) krzeslo();
*/

// krzeslo
module krzeslo() {
    translate([5,25,0]) {
    color("brown") rotate(a=[15,0,0]) cube([50,3,90]);
    color("brown") translate([0,-8,45]) cube([50,50,3]);
    color("brown") translate([0,35,0]) cube([50,3,45]);
    }
    color("#101010") cube([60,70,3]);
}


module maly_stol() { 
  // blat malego stolu
  translate([-150-70,70,75]) color("brown", alpha=0.5) cube([150,100,3]);
  // krzesla malego stollu
  translate([0,60+30,0]) rotate(a=[0,0,90]) krzeslo(); // szczyt
  translate([-70-60-20,0,0]) rotate(a=[0,0,0]) krzeslo();
  translate([-70-60-60-20,0,0]) rotate(a=[0,0,0]) krzeslo();
  translate([-70-20,70+100+70,0]) rotate(a=[0,0,180]) krzeslo();
  translate([-70-60-20,70+100+70,0]) rotate(a=[0,0,180]) krzeslo();
  translate([-70-60-60-100,100+70-20,0]) rotate(a=[0,0,-90]) krzeslo(); // dol
}

//translate([120+50,-70,0]) rotate(a=[0,0,-90])  maly_stol();
translate([450,0,0]) rotate(a=[0,0,0])  maly_stol();


translate([w,60,0]) rotate([0,0,180]) szafa_tyl();

// szafa tyl
module szafa_tyl() {
    sz=80;
    color("green") cube([sz,60,236]);
    color("grey") translate([sz/2-5,-1,80]) cube([1,1,30]);
    color("grey") translate([sz/2+5,-1,80]) cube([1,1,30]);
}


module przyklej(w) { translate([w.x,w.y,w.z]) children(); }

module schodek() { 
    color("#705030") cube([90,30,4]);
}


// kalkulacje schody
htotal = 300;
num = 17;
h1 = 300/(num);
space = 336;
step_dist = space/(num-1);

module schody(n) {
    h=h1;
    przyklej([0,0,-h]) schodek();
    if(n>1) {
      przyklej([0,step_dist,-h]) schody(n-1);
    }
}

translate([0,220,300]) schody(num-1);
// przestrzen pod schodami
translate([0,220,-0.1]) color("#808080", alpha=0.4) cube([90,space,0.1]);
translate([0,0,300]) cube([90,220,4]);
// wirtualna gora
translate([0,220+space-100,100]) color("#202020",alpha=0.001) cube([90,100,1]);
translate([0,220+space-100,300]) color("grey",alpha=1) cube([90,100,4]);
translate([0,220+space,0]) color("#202020",alpha=0.001) cube([90,1,300]);
