--=========== Copyright © 2019, Planimeter, All rights reserved. ===========--
--
-- Purpose: item_ingot_gold
--
--==========================================================================--

require( "game.shared.entities.item" )
require( "game" )

class "item_ingot_gold" ( "item" )

item_ingot_gold.data = {
	name      = "Gold Ingot",
	image     = "images/entities/item_gold/ingot_gold.png",
	stackable = true
}

function item_ingot_gold:item_ingot_gold()
	item.item( self )
end

if ( _CLIENT ) then
	function item_ingot_gold:pickup()
		localplayer:pickup( self )
	end

	function item_ingot_gold:drop()
		localplayer:drop( self.__type )
	end

	function item_ingot_gold:examine()
		chat.addText( "Shiny. Rectangular." )
	end
end

function item_ingot_gold:spawn()
	entity.spawn( self )

	local tileSize = game.tileSize
	local min      = vector()
	local max      = vector( tileSize, -tileSize )
	self:initializePhysics( "dynamic" )
	self:setCollisionBounds( min, max )
end

entities.linkToClassname( item_ingot_gold, "item_ingot_gold" )
