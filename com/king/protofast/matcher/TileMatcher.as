package com.king.protofast.matcher {
	import com.king.protofast.board.IBoard;
	
	/**
	 * ...
	 * @author Ionut Ghenade

	 */
	public class TileMatcher 
	{							
		protected var _matchRules:Vector.<IMatchRule>;
		private var _board : IBoard;
		
		public function TileMatcher(board : IBoard) 
		{
			_board = board;
			_matchRules = new Vector.<IMatchRule>();
			setRules();							
		}	
		
		public function getMatches():Vector.<MatchVO>
		{
			var matches:Vector.<MatchVO> = new Vector.<MatchVO>();
			var ruleIdx:uint;
			var ruleLen:uint = _matchRules.length;
			
			for (ruleIdx = 0 ; ruleIdx < ruleLen; ruleIdx++) {			
				var found:Vector.<MatchVO> = _matchRules[ruleIdx].getMatches(_board);
				if (found.length > 0) { matches = matches.concat(found); }				
			}					
			
			return matches;
		}		
		
		protected function setRules():void
		{
			throw new Error("TileMatcher rules not set! Override 'setRules()' in your matcher class", 1);
		}				
	}
}