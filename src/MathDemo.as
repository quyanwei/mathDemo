package
{
	import com.wacube.fl.formula.SinFormula;
	import com.wacube.fl.shape.Coordinator;
	import com.wacube.fl.shape.LabelInput;
	import com.wacube.fl.util.Logger;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Transform;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	
	public class MathDemo extends Sprite
	{
		private var _coordinator:Coordinator;
		
		public function MathDemo()
		{
			//stage.stageWidth = 800;
			//stage.stageHeight = 600;
			stage.frameRate = 36;
			stage.color = 0xccffff;
			Logger.info("App started.");
			Logger.info("Frame rate: " + stage.frameRate);
			Logger.info("stage w/h: " + stage.stageWidth + "/" + stage.stageHeight);
			
			var coordinator:Coordinator = new Coordinator(null);
			coordinator.x = stage.stageWidth / 10;
			coordinator.y = stage.stageHeight / 2;
			
			addChild(coordinator);
			
			var origX:Number = stage.stageWidth - 250;
			var origY:Number = stage.stageHeight - 30;
			var formulaY:Number = origY - 30;
			
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.bold = true;
			
			var formulaTxt:TextField = new TextField();
			formulaTxt.text = "函数： y = Asin(Wx + Q)";
			formulaTxt.autoSize = TextFieldAutoSize.LEFT;
			formulaTxt.textColor = 0x333333;
			formulaTxt.x = origX;
			formulaTxt.y = formulaY;
			formulaTxt.selectable = false;
			formulaTxt.tabEnabled = false;
			formulaTxt.setTextFormat(textFormat);
			addChild(formulaTxt);
			
			var errorTxt:TextField = new TextField();
			errorTxt.text = "";
			errorTxt.autoSize = TextFieldAutoSize.LEFT;
			errorTxt.textColor = 0xFF0000;
			errorTxt.x = origX + formulaTxt.width + 10;
			errorTxt.y = formulaY;
			errorTxt.selectable = false;
			errorTxt.tabEnabled = false;
			errorTxt.setTextFormat(textFormat);
			addChild(errorTxt);
			
			var inputA:LabelInput = new LabelInput("A:");
			inputA.x = origX;
			inputA.y = origY;
			addChild(inputA);
			stage.focus = inputA.input;
			
			var inputW:LabelInput = new LabelInput("W:");
			inputW.x = inputA.x + inputA.width + 5;
			inputW.y = inputA.y;
			addChild(inputW);
			
			var inputQ:LabelInput = new LabelInput("Q:");
			inputQ.x = inputW.x + inputW.width + 5;
			inputQ.y = inputW.y;
			addChild(inputQ);
			
			var btnFormat:TextFormat = new TextFormat();
			btnFormat.bold = true;
			btnFormat.align = TextFormatAlign.CENTER;
			
			var btnTxt:TextField = new TextField();
			btnTxt.text = "作图";
			//btnTxt.autoSize = TextFieldAutoSize.LEFT;
			btnTxt.textColor = 0x0000FF;
			btnTxt.background = true;
			btnTxt.backgroundColor = 0xCCCCCC;
			btnTxt.border = true;
			btnTxt.borderColor = 0xBBBBBB;
			btnTxt.setTextFormat(btnFormat);
			btnTxt.width = 40;
			btnTxt.height = 20;
			
			var btnTxtOver:TextField = new TextField();
			btnTxtOver.text = "作图";
			btnTxtOver.width = 40;
			btnTxtOver.height = 20;
			//btnTxtOver.autoSize = TextFieldAutoSize.LEFT;
			btnTxtOver.textColor = 0x0000FF;
			btnTxtOver.background = true;
			btnTxtOver.backgroundColor = 0xEEEEEE;
			btnTxtOver.border = true;
			btnTxtOver.borderColor = 0x000000;
			btnTxtOver.setTextFormat(btnFormat);
			
			var drawBtn:SimpleButton = new SimpleButton(btnTxt, btnTxtOver, btnTxtOver, btnTxt);
			drawBtn.x = inputQ.x + inputQ.width + 10;
			drawBtn.y = origY;
			drawBtn.useHandCursor = true;
			
			drawBtn.addEventListener(MouseEvent.CLICK, onButtonClick);
			addChild(drawBtn);
			
			function onButtonClick(evt:MouseEvent):void {
				
				var numA:Number = new Number(inputA.input.text);
				var numW:Number = new Number(inputW.input.text);
				var numQ:Number = new Number(inputQ.input.text);
				
				Logger.debug("numA: " + numA +", numW: " + numW + ", numQ: " + numQ);
				if(isNaN(numA) || isNaN(numW) || isNaN(numQ)){
					Logger.error("参数输入错误！");
					errorTxt.text = "参数不是数字！";
				}
				else {
					errorTxt.text = "";
					numA = numA == 0 ? 1 : numA;
					numW = numW == 0 ? 1 : numW;
					var formula:SinFormula = new SinFormula(numA, numW, numQ);
					formulaTxt.text = "函数： y = " + numA + "sin(" + numW + "x + " + numQ + ")";
					drawImageInCoordinates(formula);
				}
			}
			
		}
		
		private function drawImageInCoordinates(formula:SinFormula):void {
			if(_coordinator != null) {
				removeChild(_coordinator);
			}
			_coordinator = new Coordinator(formula);
			_coordinator.x = stage.stageWidth / 10;
			_coordinator.y = stage.stageHeight / 2;
			
			addChild(_coordinator);
		}
		
	}
}