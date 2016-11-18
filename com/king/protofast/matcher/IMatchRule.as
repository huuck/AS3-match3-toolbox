package com.king.protofast.matcher
{
	import com.king.protofast.board.IBoard;
	
	/**
	 * ...
	 * @author Ionut Ghenade

	 */
	public interface IMatchRule 
	{		
		function getMatches(board:IBoard):Vector.<MatchVO>
	}

}