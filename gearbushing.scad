/*
608:
It is characterized by an 8mm inner diameter (the bore of the ball bearings), 
a 22mm outer diameter, and a width of 7mm
*/

use <parametric_involute_gear_v5.0.scad>
use <spur_generator.scad>

$fn = 360;
// n1 = 49; n2 = 23;
n1 = 49; n2 = 49;
p = fit_spur_gears(n1, n2, 60);

rim_t = 5;
g_t = 5;


//

rod_dia = 8.1;

module bearing608() {
	cylinder(d=22.3, h=7.1);
}

module bushing() {
	difference() {
		union() {
			cylinder(d1=74, d2=30, h=30);
			cylinder(d=74, h=3);
			cylinder(d=64.5, h=9);
			cylinder(d=55.5, h=15);
			cylinder(d=46.5, h=21);
			cylinder(d=37.5, h=27);
		}
		
		union() {
			cylinder(d=rod_dia, h=100, center=true);
			translate([0,0,30-7.1+0.01])bearing608();


		}
		
	}
}



module wholebushing() {
	bushing();


	difference() {
		union() {
		// Simple Test:
		translate([0,0,-rim_t])gear (circular_pitch=299.808,
			gear_thickness = g_t,
			rim_thickness = rim_t,
			hub_thickness = rim_t,
			number_of_teeth = n1,
			bore_diameter = 8,
			circles=0);
		echo(str("PitchSpool = ", 299.808));
		
		translate([gear_outer_radius(n1, p) + gear_outer_radius(n2, p),0,0])
		gear (circular_pitch=p,
			gear_thickness = g_t,
			rim_thickness = rim_t,
			hub_thickness = 17,
			circles=8,
			number_of_teeth = n2,
			bore_diameter = 5,
			rim_width = 2);

		//Tillägg
		//cylinder(d=24, h=17);

	}
	
	union() {
		cylinder(d=8.3, h=100, center=true);
		translate([0,0,-rim_t-0.01])bearing608();
	}
	
}
}

module motorgear(){
			translate([gear_outer_radius(n1, 299.808) + gear_outer_radius(n2, 299.808),0,-rim_t])
			difference() {
				union() {
					gear (circular_pitch=299.808,
						gear_thickness = g_t,
						rim_thickness = rim_t,
						hub_thickness = 10,
						circles=0,
						number_of_teeth = n2,
						bore_diameter = 8,
						rim_width = 2);
					echo(str("Variable = ", p));
					color("green", 1)cylinder(d=30, h=20);

				}
				union() {
					//Bore
					cylinder(d=8.2, h=100, center=true);

					//Setscrew
					translate([0,0,15])rotate([90,0,0])cylinder(d=3.2, h=50);

					//Nut

					translate([-3,-1.5 - 8,5])cube([6, 3, 20]);
				}
			}



		}



wholebushing();

motorgear();