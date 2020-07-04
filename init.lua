if minetest.get_modpath("technic") then
technic.register_power_tool("technic_jetpack:jetpack", 1000)
end

if minetest.get_modpath("3d_armor") then
armor:register_armor("technic_jetpack:jetpack", {
	description = "Jetpack",
	inventory_image = "mod_name_speed_boots_inv.png",
	texture = "jetpack.png",
	preview = "mod_name_speed_boots_preview.png",
	stack_max = 1,
	groups = {armor_torso=1, armor_heal=100, armor_use=1000, physics_speed=5, physics_jump=5, physics_gravity=0.0001},
	armor_groups = {fleshy=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	wear_represents = "technic_RE_charge",
	on_refill = technic.refill_RE_charge,
	on_destroy = function(player, index, stack)
		local pos = player:get_pos()
		if pos then
			minetest.sound_play({
				name = "mod_name_break_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})
end