package com.king.protofast.animation
{
	public class AnimationManager
	{
		private var animations : Vector.<TickAnimation>;
		
		public function AnimationManager()
		{
			animations = new Vector.<TickAnimation>();
		}
		
		public function update(tick : Number) : void
		{
			var i : int;
			for(i = 0; i < animations.length; i++)
			{
				animations[i].update(tick);
				
				if(animations[i].isDone() == true)
				{
					animations[i].end(tick);
					animations.splice(i, 1);
					i--;
				}
			}
			
		}
		
		public function addAnimation(tick : Number, animation : TickAnimation) : void
		{
			animations.push(animation);
			animation.start(tick);
		}
		
		public function isIdle() : Boolean
		{
			return animations.length == 0;
		}
	}
}