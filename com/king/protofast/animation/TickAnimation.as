package com.king.protofast.animation
{
	

	public class TickAnimation implements ITickAnimation
	{
		public static const STATE_IDLE : String = "stateIdle";
		public static const STATE_RUNNING : String = "stateRunning";
		public static const STATE_DONE : String = "stateDone";
		
		protected var currentState : String = "currentState";
		protected var currentGlobalTick : Number;
		protected var currentLocalTick : Number;
		
		protected var startTick : Number;
		
		protected var endTick : Number;
		
		public var onStart : Function;
		public var onEnd : Function;
		
		public function TickAnimation()
		{
			currentGlobalTick = 0;
			currentLocalTick = 0;
			startTick = 0;
			endTick = 0;
		}
		
		public function isDone() : Boolean
		{
			return currentState == STATE_DONE;
		}
		
		public function start(tick : Number) : void
		{
			startTick = tick;
			currentGlobalTick = tick;
			currentState = STATE_RUNNING;
			
			if(onStart != null)
			{
				onStart.call();
			}
		}
		
		public function update(tick : Number) : void
		{
			currentGlobalTick = tick;
			currentLocalTick = tick - startTick;
		}
		
		public function end(tick : Number) : void
		{
			endTick = tick;
			currentState = STATE_DONE;
			
			if(onEnd != null)
			{
				onEnd.call();
			}
		}
		
	}
}