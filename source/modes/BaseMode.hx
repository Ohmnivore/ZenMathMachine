package modes;
import ents.NumText;
import ents.ResultBar;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Ohmnivore
 */
class BaseMode extends FlxGroup {
	
	public var answer:Int;
	public var input:NumText;
	private var corrected:Bool = false;
	
	public var x:Float = 0;
	public var y:Float = 0;
	private var oldx:Float = 0;
	private var oldy:Float = 0;
	public var width:Int;
	public var height:Int;
	
	public function new() {
		super();
		
		var operands:Array<Int> = getOperands();
		var toperands:Array<NumText> = [];
		for (i in 0...operands.length) {
			var operand:Int = operands[i];
			
			var t:NumText = new NumText(NumTextChar.SIZE, i * NumTextChar.SIZE, Std.string(operand));
			add(t);
			toperands.push(t);
		}
		
		var maxWidth:Int = getMaxWidth(toperands);
		for (o in toperands)
			o.x += maxWidth - o.getWidth();
		
		input = new NumText(NumTextChar.SIZE, NumTextChar.SIZE * toperands.length + 12, "");
		add(input);
		
		var operator:NumText = new NumText(0, NumTextChar.SIZE, getOperator());
		add(operator);
		
		var bar:ResultBar = new ResultBar(NumTextChar.SIZE, NumTextChar.SIZE * toperands.length + 4, maxWidth);
		add(bar);
		
		width = maxWidth + NumTextChar.SIZE;
		height = (toperands.length + 1) * NumTextChar.SIZE + 12;
	}
	
	private function getOperator():String {
		return null;
	}
	
	private function getOperands():Array<Int> {
		return null;
	}
	
	public function onKey(Char:String):Void {
		var cur:String = input.getText();
		
		if (Char == "*") {
			if (cur.length > 0)
				input.setText(cur.substr(1));
		}
		else if (cur.charAt(0) != "-")
			input.setText(Char + input.getText());
	}
	
	public function inputIsEmpty():Bool {
		return input.getText().length == 0;
	}
	
	public function inputIsValid():Bool {
		return answer == Std.parseInt(input.getText());
	}
	
	public function correct():Void {
		input.setText(Std.string(answer));
		input.setColor(Reg.color.op);
		corrected = true;
	}
	
	public function submit():Void {
		//if (!corrected)
			//ChallengeCounter.add(getOperator());
	}
	
	override public function update():Void {
		var dx:Float = x - oldx;
		var dy:Float = y - oldy;
		
		if (dx != 0 || dy != 0) {
			for (i in 0...members.length) {
				untyped members[i].x += dx;
				untyped members[i].y += dy;
			}
		}
		
		input.x = x + width - input.getWidth();
		
		oldx = x;
		oldy = y;
		
		super.update();
	}
	
	private function getMaxWidth(Operands:Array<NumText>):Int {
		var ret:Int = 0;
		for (o in Operands) {
			var owidth:Int = o.getText().length;
			if (owidth > ret)
				ret = owidth;
		}
		return ret * NumTextChar.SIZE;
	}
}