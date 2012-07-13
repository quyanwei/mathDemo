package com.wacube.fl.shape
{
	import flash.display.Sprite;
	import flash.text.TextField;

	public class AxisY extends Sprite
	{
		private var _scale:Number;
		private var _graduationNum:int;
		
		public function AxisY(graduationNum:int = 2, scale:Number = 50)
		{
			_scale = scale;
			_graduationNum = graduationNum;
			
			with(graphics) {
				lineStyle(1, 0x000000, 0.75);
				
				//Y coordinate
				graphics.moveTo(0, 150);
				graphics.lineTo(0, -150);
				graphics.lineTo(-3, -142);
				graphics.moveTo(0, -150);
				graphics.lineTo(3, -142);
			}
			for(var i:int = 1; i <= _graduationNum; i++) {
				drawGraduation(i);
				drawGraduation(-i);
			}
		}
		
		private function drawGraduation(index:int):void {
			var y:Number = index * _scale;
			with(graphics) {
				moveTo(0, y);
				lineTo(3, y);
			}
			var txt:TextField = new TextField();
			txt.text = -index + "";
			txt.x = -15;
			if(index > 0) {
				txt.x -= 5;
			}
			txt.y = y - 10;
			addChild(txt);
		}
	}
}