// ActionScript file

package com.wacube.fl.shape
{
	import com.wacube.fl.formula.SinFormula;
	import com.wacube.fl.util.Logger;
	
	import flash.display.CapsStyle;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;

	/**
	 * @author qyw
	 */
	public class Coordinator extends Sprite
	{
		private var _formula:SinFormula;
		
		public function Coordinator(formula:SinFormula)
		{
			_formula = formula;//new SinFormula(2, -1.8, 0, 0);
			
			//X coordinate
			var axisX:AxisX = new AxisX();
			addChild(axisX);
			
			//Y coordinate
			var axisY:AxisY = new AxisY();
			addChild(axisY);
			
			if(_formula != null) {
				graphics.moveTo(_formula.x, _formula.y);
			
				addEventListener(Event.ENTER_FRAME, onCoordinatorEnterFrame);
			}
		}
		
		public function onCoordinatorEnterFrame(evt:Event):void {
			graphics.lineStyle(1, 0x0000FF, 1.0);
			//Logger.debug("x: " + _formula.x + ", y: " + _formula.y);
			graphics.lineTo(_formula.x, _formula.y);
			_formula.next();
			
			if(_formula.isCycles(1)) {
				removeEventListener(Event.ENTER_FRAME, onCoordinatorEnterFrame);
				Logger.info("ENTER_FRAME listen removed.");
			}
		}
	}	
}