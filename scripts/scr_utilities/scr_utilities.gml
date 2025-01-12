/// general utility functions
function point_in_camera(x, y, cam)
{
	var camx = camera_get_view_x(cam);
	var camy = camera_get_view_y(cam);
	var camw = camera_get_view_width(cam);
	var camh = camera_get_view_height(cam);
	return point_in_rectangle(x, y, camx, camy, camx + camw, camy + camh);
}

function instance_in_camera(inst, cam)
{
	var camx = camera_get_view_x(cam);
	var camy = camera_get_view_y(cam);
	var camw = camera_get_view_width(cam);
	var camh = camera_get_view_height(cam);
	
	var result = false;
	var xx = inst.x - sprite_get_xoffset(inst.sprite_index);
	var yy = inst.y - sprite_get_yoffset(inst.sprite_index);
	
	// left bottom
	result |= point_in_rectangle(
		xx + sprite_get_bbox_left(inst.sprite_index), 
		yy + sprite_get_bbox_bottom(inst.sprite_index), 
	camx, camy, camx + camw, camy + camh);
	
	// left top
	if !result
	{
		result |= point_in_rectangle(
			xx + sprite_get_bbox_left(inst.sprite_index), 
			yy + sprite_get_bbox_top(inst.sprite_index), 
		camx, camy, camx + camw, camy + camh);
	}
	
	// right bottom
	if !result
	{
		result |= point_in_rectangle(
			xx + sprite_get_bbox_right(inst.sprite_index), 
			yy + sprite_get_bbox_bottom(inst.sprite_index), 
		camx, camy, camx + camw, camy + camh);
	}
	
	// right top
	if !result
	{
		result |= point_in_rectangle(
			xx + sprite_get_bbox_right(inst.sprite_index), 
			yy + sprite_get_bbox_top(inst.sprite_index), 
		camx, camy, camx + camw, camy + camh);
	}
	
	return result;
}

function loydecode(str) {
	return str;
}
function loyencode(str) {
	return str;
}

/// game specific
function check_sugary() {
	return room == hub_roomSP
	or string_startswith(room_get_name(room), "cotton_")
	or string_startswith(room_get_name(room), "wafer_")
	or string_startswith(room_get_name(room), "jawbreaker_");
}

/// enemy
function increase_combo()
{
	scr_failmod(mods.pacifist);
	
	var funny = true;
	if variable_instance_exists(id, "baddieID")
	&& instance_exists(baddieID)
		if baddieID.important or baddieID.object_index == obj_pizzaballOLD or baddieID.object_index == obj_pizzaboy funny = false;
	if variable_instance_exists(id, "boundbox")
		if important or object_index == obj_pizzaballOLD or object_index == obj_pizzaboy funny = false;
	
	if global.gameplay != 0 && funny
	{
		global.combo += 1
		global.combotime = 60;
		global.heattime = 60;
		global.style += 5 + global.combo;
		
		with obj_player1
			if supercharge < 10 then supercharge++;
	}
	else
		global.combotime = 60;
}

function scr_hitthrow(baddie, player, lag = 5)
{
	with baddie
	{
		if state != states.hit
		{
			if stuntouchbuffer <= 0
				increase_combo();
			
			repeat 3
			{
				create_particle(x, y, particles.baddiegibs)
				instance_create(x, y, obj_slapstar)
			}
			instance_create(x, y, obj_bangeffect)
			
			hp -= 1;
			thrown = true;
						
			hitLag = lag;
			hitX = x;
			hitY = --y;
			state = states.hit;
			
			stuntouchbuffer = lag * 3;
			
			hsp = hithsp;
			vsp = hitvsp;
						
			grounded = false;
		}
	}
	
	with player
	{
		if state != states.hitlag
		{
			if scr_solid(x, y)
			{
				x = hitX;
				y = hitY;
			}
			tauntstoredmovespeed = movespeed;
			tauntstoredsprite = sprite_index;
			tauntstoredstate = state;
			tauntstoredvsp = vsp;
			state = states.hitlag;
						
			hitLag = lag;
			hitX = x;
			hitY = y;
		}
	}
}