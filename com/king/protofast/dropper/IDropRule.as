package com.king.protofast.dropper
{
	import com.king.protofast.board.IBoard;

	/**
	 * ...
	 * @author Ionut Ghenade

	 */
	public interface IDropRule 
	{			
		function applyTo(board:IBoard):Vector.<TileWaypointVO>;
		function isBoardStable(board:IBoard):Boolean;
	}

}