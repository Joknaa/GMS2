/// step 

Xaxis = (keyboard_check(vk_right) - keyboard_check(vk_left));
Yaxis = (keyboard_check(vk_down) - keyboard_check(vk_up));


//change the direction .
if(Xaxis > 0) 
	Direction = RIGHT;
else if (Xaxis < 0) 
	Direction = LEFT;
	
if(Yaxis > 0) 
	Direction = DOWN;
else if (Yaxis < 0) 
	Direction = UP;
	
	
var _direction = point_direction(0,0,Xaxis,Yaxis);
var _length = Speed * ( (Xaxis != 0) || (Yaxis != 0) );

Xaxis = lengthdir_x(_length,_direction);
Yaxis = lengthdir_y(_length,_direction);


// colision .. 
if (place_meeting(x+Xaxis, y, o_colision)) 
{
	// one pixel at a time ..
	while (!place_meeting(x+sign(Xaxis), y, o_colision)) {
		x += sign(Xaxis);
	}
	Xaxis = 0;
}
x += Xaxis;

if (place_meeting(x, y+Yaxis, o_colision)) {
	// one pixel at a time ..
	while (!place_meeting(x, y+sign(Yaxis), o_colision)) {
		y += sign(Yaxis);
	}
	Yaxis = 0;
}
y += Yaxis;

// change the sprites ..
sprite_index = View[Direction,Action];