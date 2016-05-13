package modes;
import flixel.util.FlxRandom;

/**
 * ...
 * @author Ohmnivore
 */
class Division extends BaseMode {
	
	override function getOperator():String {
		return "/";
	}
	
	override private function getOperands():Array<Int> {
		var n1 = getOperand();
		var n2 = getOperand();
		answer = n1;
		n1 = n1 * n2;
		return [n1, n2];
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