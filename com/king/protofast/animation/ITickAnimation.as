package com.king.protofast.animation
{
	public interface ITickAnimation
	{
		function isDone() : Boolean; 
		function start(tick : Number) : void;
		function update(tick : Number) : void;
		function end(tick : Number) : void;
	}
}