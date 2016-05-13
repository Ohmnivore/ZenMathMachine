package modes;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Ohmnivore
 */
class Multiplication extends BaseMode {
	
	override function getOperator():String {
		return "*";
	}
	
	override private function getOperands():Array<Int> {
		answer = 1;
		
		var ret:Array<Int> = [];
		for (i in 0...getCount()) {
			var operand:Int = getOperand();
			ret.push(operand);
			answer *= operand;
		}
		return ret;
	}
	
	private function getCount():Int {
		return FlxRandom.intRanged(2, 3);
	}
	
	private function getOperand():Int {
		var digits:Int = FlxRandom.intRanged(1, 2);
		if (digits == 1)
			return FlxRandom.intRanged(1, 9);
		else if (digits == 2)
			return FlxRandom.intRanged(10, 99);
		else
			return FlxRandom.intRanged(100, 999);
	}
}