package com.wacube.fl.shape
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;

	public class LabelInput extends Sprite
	{
		private var _label:String;
		private var _txtA:TextField;
		private var _inputA:TextField;
		
		
		public function LabelInput(label:String = "")
		{
			_txtA = new TextField();
			_txtA.autoSize = TextFieldAutoSize.LEFT;
			_txtA.text = label;
			_txtA.selectable = false;
			addChild(_txtA);
			
			_inputA = new TextField();
			_inputA.type = TextFieldType.INPUT;
			_inputA.border = true;
			_inputA.width = 36;
			_inputA.height = 20;
			_inputA.maxChars = 5;
			_inputA.x = _txtA.x + _txtA.width;
			addChild(_inputA);
		}
		
		public function set label(value:String):void
		{
			_txtA.text = value;
			_inputA.x = _txtA.x + _txtA.width;
		}
		
		public function get input():TextField {
			return _inputA;
		}
	}
}