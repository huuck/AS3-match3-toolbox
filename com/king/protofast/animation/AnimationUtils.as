package com.king.protofast.animation
{
	import com.king.kob.core.Constants;
	
	import flash.utils.getTimer;

	public class AnimationUtils
	{
		private static const AMPLITUDE : Number = 0.1;
		private static const DECAY : Number = -7.5;
		private static const OMEGA : Number = 10*Math.PI;
		
		//returns a value between 1 and 0 that is a dampened sinusoidal function of time (bounce easing)
		public static function dampenedCosine(t : Number) : Number
		{
//			var cos : Number = Math.cos(OMEGA * t);
//			var exp : Number = 1/Math.pow(Math.E, -DECAY * t);
			
			//decaying sine wave
			var value : Number = AMPLITUDE * 1/Math.pow(Math.E, -DECAY * t) * Math.cos(OMEGA * t);
			
			return value;
		}
		
		public static function easeOutExpo (time:Number, before:Number, amount:Number, duration:Number):Number
		{
			return (time==duration) ? before+amount : amount * (-Math.pow(2, -10 * time/duration) + 1) + before;
		}
		
		public static function easeInExpo (time:Number, before:Number, amount:Number, duration:Number):Number
		{
			return (time==0) ? before : amount * Math.pow(2, 10 * (time/duration - 1)) + before;
		}
		
		public static function easeOutCubic (time:Number, before:Number, amount:Number, duration:Number):Number
		{
			return amount*((time=time/duration-1)*time*time + 1) + before;
		}
		
		public static function parabolicSpike(x : Number) : Number
		{
			return 0.25*(4*x - 1) * (4*x - 1) - 0.25;
		}
		
		public static function reverseQuadratic(x : Number) : Number
		{
			return -x*x*x*x;
		}
		
		public static function getGlobalTick() : Number
		{
			return getTimer() / Constants.FRAME_RATE;
		}
	}
}