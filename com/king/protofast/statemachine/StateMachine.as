package com.king.protofast.statemachine 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Ionut Ghenade

	 */
	public class StateMachine 
	{		
		private const NONE:Array = ["*"];
	
		private var _verbose:Boolean = false;
		
		private var _state:String;
		private var _lastState:String;
		private var _states:Dictionary;		
		
		public function StateMachine(verbose:Boolean) 
		{
			_verbose = verbose;
			_states = new Dictionary();
		}
		
		public function addState(name:String, from:Array, enter:Function, update:Function, exit:Function):void
		{			
			if (_states[name] == undefined) {
				var state:State = new State(name, from, enter, update, exit);				
				_states[state.name] = state;
			}
		}
		
		public function update():void
		{
			var state:State = _states[_state] as State;
			
			if(state.update != null) {
				state.update.call();
			}
		}
		
		public function changeState(stateName:String):Boolean
		{
			if (_states[stateName] == undefined) { if (_verbose) { trace("[STATE MACHINE]: state", stateName, "doesn't exist");  return false; }}			
			
			if(canChangeTo(stateName)){
				var oldState:State = _states[_state];	
				if (oldState.exit != null) { oldState.exit.call(); }			
				_state = stateName;												
				if (_verbose) { trace("[STATE MACHINE]: state changed to", _state, "from", oldState.name); }				
				_lastState = oldState.name;
				var newState:State = _states[_state];
				if (newState.enter != null) { newState.enter.call(); }
				return true;
			} else {
				if (_verbose) { trace("[STATE MACHINE]: can't change to", stateName, "from", _state); }
				return false;
			}
		}
		
		private function canChangeTo(stateName:String):Boolean
		{
			return ((_states[stateName].from.indexOf(_state)!=-1 || _states[stateName].from == NONE));
		}
		
		public function set initialState(stateName:String):void 
		{
			if (_states[stateName] == undefined) {return; }
			
			_state = stateName;
			var initialState:State = _states[_state];
			if (initialState.enter != null) { initialState.enter.call(); }			
			if (_verbose) { trace("[STATE MACHINE]: initial state set to -", _state); }			
		}
		
		public function get state():String 
		{
			return _state;
		}
		
		public function get lastState():String 
		{
			return _lastState;
		}
		
	}

}