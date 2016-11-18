package com.king.protofast.board
{
	public interface IBoard
	{
		function getRows() : Number;
		function getColumns() : Number;
		
		function getTileAt(row : Number, column : Number) : ITile;
	}
}