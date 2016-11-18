package com.king.protofast.dropper {
	import com.king.protofast.board.ITile;

	/**
	 * ...
	 * @author Ionut Ghenade

	 */
	public class TileWaypointVO 
	{
		public var source : ITile;
		public var targetRow : Number;
		public var targetColumn : Number;
		
		public function TileWaypointVO(source:ITile, targetRow : Number, targetColumn : Number) {
			this.source = source;
			this.targetRow = targetRow;
			this.targetColumn = targetColumn;
		}		
	}

}