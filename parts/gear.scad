
use <parametric_involute_gear_v5.0.scad>
//use <spur_generator.scad>

$fn = 360;
thickness = 10;
theets = 10;

union(){
        mainGear();
        shaftLock();
    }


module shaftLock(){
    translate([0,((1.5/2)+(3.5/2)+0.1),(thickness+3)/2]){
       cube([4,1.5,thickness+3], center=true); 
    }
    
    translate([0,-((1.5/2)+(3.5/2)+0.1),(thickness+3)/2]){
       cube([4,1.5,thickness+3], center=true); 
    }
}
    
    
module mainGear(){
    gear (
    circular_pitch=299,
    pressure_angle=29,
    gear_thickness = thickness,
    rim_thickness = thickness,
    hub_thickness = thickness,
    hub_thickness = thickness+3,
	hub_diameter=8,
    circles=0,
    number_of_teeth = theets,
    bore_diameter = 5.1+0.25,
    rim_width = 2);
}