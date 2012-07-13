package com.wacube.fl.formula
{

	/**
	 * Formula: y = Asin(Wx + Q)
	 */
	public class SinFormula
	{
		private var _factorA:Number;
		private var _factorW:Number;
		private var _factorQ:Number;
		private var _startX:Number;
		
		private var _x:Number;
		private var _scale:Number;
		
		public function SinFormula(factorA:Number = 1, factorW:Number = 1, factorQ:Number = 0, startX:Number = 0, scale:Number = 50)
		{
			this._factorA = factorA == 0 ? 1 : factorA;
			this._factorW = factorW == 0 ? 1 : factorW;
			this._factorQ = factorQ;
			this._startX = startX;
			this._x = 0.0;
			this._scale = scale < 1 ? 1 : scale;
		}
		
		
		public function get x():Number {
			return (_x + _startX) * _scale;
		}
		
		public function get y():Number {
			return - _factorA * Math.sin(_factorW * _x + _factorQ) * _scale;
		}
		
		public function next():void {
			_x += 2.0 / _scale;
		}
		
		public function isCycles(num:int = 1):Boolean {
			num = num <= 0 ? 1 : num;
			return _x >= num * 2 * Math.PI;
		}
	}
}