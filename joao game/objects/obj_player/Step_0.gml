var _tile = layer_tilemap_get_id("Floor");


var _right = keyboard_check(vk_right);
var _left = keyboard_check(vk_left);
var _jump = keyboard_check_pressed(vk_space);


hsp = (_right - _left) * hsp_max;


vsp += grv;

var _chao = place_meeting(x, y + 1, _tile);

if (_chao) {
	if (_jump) {
		vsp = -vsp_max;
	} else {
		vsp = 0;
	}
} else {
	if (vsp < 0 && place_meeting(x, y - 1, _tile)) {
		vsp = 0;
	}
}


move_and_collide(hsp, vsp, _tile);