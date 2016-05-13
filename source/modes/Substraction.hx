package modes;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Ohmnivore
 */
class Substraction extends BaseMode {
	
	override function getOperator():String {
		return "-";
	}
	
	override private function getOperands():Array<Int> {
		answer = 0;
		
		var ret:Array<Int> = [];
		for (i in 0...getCount()) {
			var operand:Int = getOperand();
			ret.push(operand);
			answer -= operand;
		}
		answer += ret[0] * 2;
		return ret;
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
}