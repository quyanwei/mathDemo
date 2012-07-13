package com.wacube.fl.shape
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.text.StyleSheet;
	import flash.text.TextField;

	public class AxisX extends Sprite
	{
		private var _scale:Number;
		private var _graduationNum:int;
		
		public function AxisX(graduationNum:int = 12, scale:Number = 50)
		{	
			_scale = scale;
			_graduationNum = graduationNum;
			
			with(graphics) {
				lineStyle(1, 0x000000, 0.75);
				
				//X coordinate
				moveTo(-180, 0);
				lineTo(450, 0);
				lineTo(442, -3);
				moveTo(450, 0);
				lineTo(442, 3);
			}
			
			var txt:TextField = new TextField();
			txt.x = -15;
			txt.y = 1;
			txt.text = "O";
			txt.textColor = 0xFF0000;
			txt.thickness = 3;
			addChild(txt);
			
			for(var i:int = 1; i <= _graduationNum; i++) {
				drawGraduation(i);
			}
		}
		
		private function drawGraduation(index:int):void {
			var x:Number = index * Math.PI / 6 * _scale;
			with(graphics) {
				moveTo(x, 0);
				if(index * 2 % 6 == 0) {
					lineTo(x, -5);
				}else {
					lineTo(x, -3);
				}
			}
			if(index % 6 == 0) {
				var txt:TextField = new TextField();
				txt.x = x - 5;
				var prefix:int = index / 6;
				if(prefix > 1) {
					txt.x = txt.x - 3;
					txt.text = prefix + "π";
				}else {
					txt.text = "π";
				}
				addChild(txt);
			}
		}
	}
}