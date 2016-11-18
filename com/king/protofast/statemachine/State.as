package com.king.protofast.statemachine
{
	public class State
	{
		public var name:String;
		public var from:Array;
		public var enter:Function;
		public var update:Function;
		public var exit:Function;		
		
		public function State(name:String, from:Array, enter:Function, update:Function, exit:Function)
		{
			this.name = name;			
			if (!from) from = ["*"];
			this.from = from;
			this.enter = enter;
			this.update = update;
			this.exit = exit;
		}
		
		public function toString():String
		{
			return this.name;
		}
	}
}