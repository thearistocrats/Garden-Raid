extends Node

#signals follow a pattern of call and response from one node to another
#signals pass information of components from one node to another
#nodes do not interact with eachothers components

@warning_ignore_start("unused_signal")
signal rabbit_moving(rabbit:Node)
signal moving_reived(source:Node, rabbit:Node) #not used

signal gun_fired(source:Node, target:Node)
signal on_gun_hit(target:Node, source:Node)

signal farmer_attempt_rabbit(farmer:Node, rabbit:Node)
signal rabbit_get_damage_from_farmer(rabbit:Node, farmer:Node)
@warning_ignore_restore("unused_signal")
