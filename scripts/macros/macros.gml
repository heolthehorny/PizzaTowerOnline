if live_call() return live_result;

// config macros
#macro debug false
#macro debug:debug true
#macro repaintjokebuild false
#macro repaintjokebuild:repaintjokebuild true

// macros
#macro c_owner merge_colour(c_blue, c_white, 0.75)
#macro c_admin merge_colour(c_yellow, c_white, 0.5)
#macro c_eatery merge_colour(c_orange, c_white, 0.25)
#macro c_beebawp merge_colour(c_fuchsia, c_white, 0.5)
#macro c_pvp merge_colour(c_red, c_white, 0.5)
#macro c_peicy make_colour_rgb(0, 215, 232)

#macro _camx camera_get_view_x(view_camera[view_current])
#macro _camy camera_get_view_y(view_camera[view_current])
#macro _camw camera_get_view_width(view_camera[view_current])
#macro _camh camera_get_view_height(view_camera[view_current])

// states enum
globalvar states;
states = {
	normal : 0,
	revolver : 1,
	dynamite : 2,
	boots : 3,
	grabbed : 4,
	tumble : 5,
	finishingblow : 6,
	ejected : 7,
	transitioncutscene : 8,
	fireass : 9,
	firemouth : 10,
	mort : 11,
	hook : 12,
	ghost : 13,
	titlescreen : 14,
	hookshot : 15,
	tacklecharge : 16,
	cheeseball : 17,
	slap : 18,
	cheesepep : 19,
	cheesepepstick : 20,
	cheesepepstickside : 21,
	cheesepepstickup : 22,
	rideweenie : 23,
	boxxedpep : 24,
	pistolaim : 25,
	climbwall : 26,
	knightpepslopes : 27,
	portal : 28,
	secondjump : 29,
	chainsawbump : 30,
	handstandjump : 31,
	gottreasure : 32,
	knightpep : 33,
	knightpepattack : 34,
	meteorpep : 35,
	bombpep : 36,
	grabbing : 37,
	chainsawpogo : 38,
	shotgunjump : 39,
	pogo : 40,
	stunned : 41,
	highjump : 42,
	chainsaw : 43,
	facestomp : 44,
	mach4 : 45,
	timesup : 46,
	machroll : 47,
	shotgun : 48,
	pistol : 49,
	machfreefall : 50,
	_throw : 51,
	slam : 52,
	superslam : 53,
	skateboard : 54,
	grind : 55,
	grab : 56,
	punch : 57,
	backkick : 58,
	uppunch : 59,
	shoulder : 60,
	backbreaker : 61,
	bossdefeat : 62,
	pizzathrow : 63,
	bossintro : 64,
	gameover : 65,
	keyget : 66,
	tackle : 67,
	jump : 68,
	ladder : 69,
	slipnslide : 70,
	comingoutdoor : 71,
	smirk : 72,
	Sjump : 73,
	victory : 74,
	Sjumpprep : 75,
	crouch : 76,
	crouchjump : 77,
	crouchslide : 78,
	mach1 : 79,
	mach2 : 80,
	machslide : 81,
	bump : 82,
	hurt : 83,
	freefall : 84,
	hang : 85,
	turning : 86,
	freefallland : 87,
	door : 88,
	barrel : 89,
	current : 90,
	boulder : 91,
	taxi : 92,
	runonball : 93,
	mach3 : 94,
	freefallprep : 95,
	Sjumpland : 96,
	faceplant : 97,
	rage : 98,
	//enemy states
	idle : 99,
	bounce : 100,
	charge : 101,
	pizzagoblinthrow : 102,
	turn : 103,
	hitceilling : 104,
	hitwall : 105,
	rolling : 106,
	walk : 107,
	fall : 108,
	land : 109,
	hit : 110,
	stun : 111,
	recovery : 112,
	stomped : 113,
	chase : 114,
	spawn : 115,
	arenaintro : 116,
	actor : 117,
	parry : 118,
	golf : 119,
	tube : 120,
	pummel : 121,
	slipbanan : 122,
	bombdelete : 123,
	rocket : 124,
	gotoplayer : 125,
	hitlag : 126,
	dance : 127,
	rotate : 128,
	frozen : 129,
	spindash : 130
}