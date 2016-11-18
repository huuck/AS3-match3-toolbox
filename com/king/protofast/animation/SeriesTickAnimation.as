package com.king.protofast.animation
{
	public class SeriesTickAnimation extends TickAnimation
	{
		private var animationQueue : Vector.<TickAnimation>;
		
		public function SeriesTickAnimation()
		{
			super();
			
			animationQueue = new Vector.<TickAnimation>();
		}
		
		public function addAnimation(newAnimation : TickAnimation) : void
		{
			animationQueue.push(newAnimation);
		}
		
		override public function isDone():Boolean
		{
			return animationQueue.length == 0;
		}
		
		override public function start(tick:Number):void
		{
			super.start(tick);
			
			if(animationQueue.length > 0)
			{
				animationQueue[0].start(tick);
			}
		}
		
		override public function update(tick:Number):void
		{
			if(animationQueue.length > 0)
			{
				animationQueue[0].update(tick);
			}
			
			if(animationQueue[0].isDone() == true)
			{
				animationQueue[0].end(tick);
				animationQueue.shift();
				
				if(animationQueue.length > 0)
				{
					animationQueue[0].start(tick);
				}
			}
		}
	}
}