package com.wacube.fl.shape
{
	import flash.display.Sprite;
	
	public class Button extends Sprite
	{
		
		public function Button()
		{
			//Set the color of the button graphic
			graphics.beginFill(0xFFCC00);
			
			//Set the X,Y, Width, and Height of the button graphic
			graphics.drawRect(0, 0, 200, 200);
			
			//Apply the fill
			graphics.endFill();
		}
	}
}