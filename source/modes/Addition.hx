package modes;
import ents.NumText;
import ents.NumText.NumTextChar;
import ents.ResultBar;
import flixel.group.FlxGroup;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Ohmnivore
 */
class Addition extends FlxGroup {
	
	public var answer:Int;
	public var input:NumText;
	
	public var x:Float = 0;
	public var y:Float = 0;
	private var oldx:Float = 0;
	private var oldy:Float = 0;
	public var width:Int;
	public var height:Int;
	
	public function new() {
		super();
		
		answer = 0;
		var count:Int = getCount();
		
		var operands:Array<Int> = [];
		var toperands:Array<NumText> = [];
		for (i in 0...count) {
			var operand:Int = getOperand();
			operands.push(operand);
			answer += operand;
			
			var t:NumText = new NumText(NumTextChar.SIZE, i * NumTextChar.SIZE, Std.string(operand));
			add(t);
			toperands.push(t);
		}
		
		var maxWidth:Int = getMaxWidth(toperands);
		for (o in toperands)
			o.x += maxWidth - o.getWidth();
		
		input = new NumText(NumTextChar.SIZE, NumTextChar.SIZE * toperands.length + 12, "");
		add(input);
		
		var operator:NumText = new NumText(0, NumTextChar.SIZE, "+");
		add(operator);
		
		var bar:ResultBar = new ResultBar(NumTextChar.SIZE, NumTextChar.SIZE * toperands.length + 4, maxWidth);
		add(bar);
		
		width = maxWidth + NumTextChar.SIZE;
		height = (toperands.length + 1) * NumTextChar.SIZE + 12;
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
	
	private function getCount():Int {
		return FlxRandom.intRanged(2, 4);
	}
	private function getOperand():Int {
		var digits:Int = FlxRandom.intRanged(1, 3);
		if (digits == 1)
			return FlxRandom.intRanged(1, 9);
		else if (digits == 2)
			return FlxRandom.intRanged(10, 99);
		else
			return FlxRandom.intRanged(100, 999);
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