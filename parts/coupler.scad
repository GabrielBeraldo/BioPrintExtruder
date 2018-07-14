// Spider Coupling
// Simon Kirkby
// tigger@interthingy.com
// 201005301120

// modes 
// 0 - displays assembled coupling 
// 1 - coupling layed out for printing , single stl
// 2 - just coupling
// 3 - just spider
$fs = 0.01;
            
mode = 3;

// display 

lift = 0.01; // explodes the coupling in mode 0 , 0.0 assembled , 2.0 exploded

// variables

// wheel

wheel_radius = 15; // external radius of entire coupling
wheel_height = 25; // height of the base
shaft_size = 10.5; // shaft size 
shaft_size2 = 10; // shaft size of second wheel. ONLY USED IN MODE 0 AND 1

//coupling

coupling_height =10; // height of the struts 
coupling_thickness = 6; // wall thickness of struts
coupling_struts = 2; // number of struts
spider_angle = 90; // combined angle of the spider arms
 
clearance = 0.2; // linear clearance of the spider
radial_clearance = 3; // radial clearance in degrees at each spider arm

//spider

spider_wall_thickness = 4; // thickness of the spider hub



module spider_leg()
{	
	inc = 360/(2*coupling_struts);
	intersection()
	{
		difference()
		{
			cylinder(coupling_height-clearance,r=wheel_radius-clearance);
			translate([0,0,-(clearance/2)])
			cylinder(coupling_height+2*clearance,r=wheel_radius-coupling_thickness-clearance-spider_wall_thickness);
		}			
		intersection()
		{
			rotate(-90,[0,0,1])
			rotate((spider_angle/coupling_struts)-radial_clearance,[0,0,1])
			cube(size=wheel_radius*5);
			cube(size=wheel_radius*5);			
		}
	}
}

module spider()
{
	inc = 360/(2*coupling_struts);
	color([1,0,0])
	{
	rotate(inc-(spider_angle/coupling_struts),[0,0,1])
	union()
	{
		difference()
		{
			cylinder(coupling_height-clearance,r=wheel_radius-coupling_thickness-clearance);
			translate([0,0,-(clearance/2)])
			cylinder(coupling_height+clearance,r=wheel_radius-coupling_thickness-clearance-spider_wall_thickness);
		}
		for ( z = [1:(coupling_struts*2)])
			{	
				rotate((z*inc)+(radial_clearance/2),[0,0,1])		
				spider_leg();
			}
		}
	}
}

module strut()
{
	inc = 360/(2*coupling_struts);
	intersection()
	{
		difference()
		{
			cylinder(coupling_height,r=wheel_radius);
			translate([0,0,-(0.1+coupling_height/2)])
			cylinder(coupling_height*2+0.1,r=wheel_radius-coupling_thickness);
		}
		intersection()
		{
			rotate(-90,[0,0,1])
			rotate(inc-(spider_angle/coupling_struts),[0,0,1])
			cube(size=wheel_radius*5);
			cube(size=wheel_radius*5);			
		}
	}
}

module struts()
{
	inc = 360/coupling_struts;
	for ( z = [1:coupling_struts])
	{	
		rotate(z*inc,[0,0,1])		
		strut();
	}
}

module shaft(sr)
{
		cylinder(wheel_height*7,r1=sr,r2=sr,center=true);
}

module wheel(r)
{	
	difference()
	{
		union(){
			cylinder(wheel_height,r1=r,r2=r,center=true);
		}
		shaft(sr=shaft_size/2.0);
	}
}

module wheel2(r)
{	
	difference()
	{
		union(){
			cylinder(wheel_height,r1=r,r2=r,center=true);
		}
		shaft(sr=shaft_size2/2.0);
	}
}

module spider_coupling()
{
	translate([0,0,wheel_height/2])
	union()
	{
		wheel(r=wheel_radius);
		translate([0,0,wheel_height/2])
		struts();
	}
}

module spider_coupling2()
{
	translate([0,0,wheel_height/2])
	union()
	{
		wheel2(r=wheel_radius);
		translate([0,0,wheel_height/2])
		struts();
	}
}
module inverted_spider_coupling()
{
	mirror([0,0,1])
	translate([0,0,-(2*wheel_height+(2*lift+1)*coupling_height)])
	rotate((180/coupling_struts),[0,0,1])
	spider_coupling2();
}

module placed_spider()
{
	translate([0,0,wheel_height+lift*coupling_height+(clearance/2)])
	color([1,0,0])
	{
		spider();
	}
}

module display()
{
	spider_coupling();
	placed_spider();
	inverted_spider_coupling();
}

// modal display
if ( mode == 0)
{
	display(); 
}

if (mode == 1)
{
	translate([-wheel_radius,-1.1*wheel_radius,0])
	spider_coupling();
	translate([-wheel_radius,1.1*wheel_radius,0])
	spider_coupling2();
	translate([wheel_radius,0,0])
	spider();
}

if (mode == 2)
{   
	difference(){
        spider_coupling();
        translate ([0,(wheel_radius/2),wheel_height-((3.5/2)+(wheel_height/4))]){
            cube([5.5, 2.5, 3.5+wheel_height/2], center=true);
        }
        translate([0,wheel_radius/2,wheel_height/2]){
            rotate(90,[1,0,0])
            cylinder(h=wheel_radius, d=3.2, center=true);
            }
        }
        
        
    
}

if (mode == 3)
{
	spider();
}
