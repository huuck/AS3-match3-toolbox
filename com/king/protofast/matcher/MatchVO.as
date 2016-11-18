package com.king.protofast.matcher {
	import com.king.protofast.board.ITile;

	/**
	 * ...
	 * @author Ionut Ghenade

	 */
	public class MatchVO 
	{	
		public static const MATCH_DIRECTION_HORIZONTAL : String = "matchDirectionHorizontal";
		public static const MATCH_DIRECTION_VERTICAL : String = "matchDirectionVertical";
		
		private var _group:Vector.<ITile>;
		public var matchDirection : String;
		
		public function MatchVO(group:Vector.<ITile>) {				
			_group = group;			
		}	
		
		public function intersectsWith(match:MatchVO):Boolean {
			var idx1:uint;
			var idx2:uint;
			var len2:uint = match.length;
			
			for (idx1 = 0; idx1 < _group.length; idx1++) {
				var group2:Vector.<ITile> = match.group;
				for (idx2 = 0; idx2 < len2; idx2++) {
					if (_group[idx1].getRow() == group2[idx2].getRow() && _group[idx1].getColumn() == group2[idx2].getColumn()) { return true; }					
				}
			}
			
			return false;			
		}
		
		public function mergeWith(match:MatchVO):void {
			var idx:uint;
			var len:uint = match.length;
			var matchGroup:Vector.<ITile> = match.group;
			
			for (idx = 0; idx < len; idx++) {
				if (!contains(matchGroup[idx])) {
					_group.push(matchGroup[idx]);
				}
			}			
		}
		
		public function get group():Vector.<ITile> {
			return _group;
		}
		
		public function get length():uint 
		{
			return _group.length;
		}
		
		private function contains(cell:ITile):Boolean
		{
			var idx:uint;			
			for (idx = 0; idx < _group.length; idx++) {
				if (cell.getRow() == _group[idx].getRow() && cell.getColumn() == _group[idx].getColumn()) { return true; }				
			}
			
			return false;
		}
	}

}