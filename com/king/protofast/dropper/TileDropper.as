package com.king.protofast.dropper 
{
	import com.king.protofast.board.IBoard;
	

	/**
	 * ...
	 * @author Ionut Ghenade

	 */
	public class TileDropper 
	{
		protected var _rules:Vector.<IDropRule>;
		private var _board : IBoard;
		
		public function TileDropper(board : IBoard) 
		{
			_board = board;
			_rules = new Vector.<IDropRule>();
			setupRules();
		}
		
		public function dropTiles():Vector.<TileWaypointVO>
		{
			var ret : Vector.<TileWaypointVO> = new Vector.<TileWaypointVO>();
			
			var ruleIdx:uint;
			var rulesLen:uint = _rules.length;
			for (ruleIdx = 0; ruleIdx < rulesLen; ruleIdx++) { 
				ret = ret.concat(_rules[ruleIdx].applyTo(_board)); 
			}
			
			return ret;
		}		
		
		protected function setupRules():void
		{
			throw new Error("TileDropper rules not set! Override 'setRules()' in your dropper class", 1);
		}
		
		public function isBoardStable():Boolean
		{
			var idx:uint;
			var len:uint = _rules.length;
			for (idx = 0; idx < len; idx++) { if (!_rules[idx].isBoardStable(_board)) { return false; } }
			
			return true;
		}
	}

}