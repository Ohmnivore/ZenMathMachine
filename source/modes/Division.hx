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
		if (Reg.difficulty == 0) {
			var n1:Int;
			var n2:Int;
			do {
				n1 = getOperand(1);
				n2 = getOperand(1);
			} while (n1 == n1 * n2 || n2 == n1 * n2 || n1 * n2 > 20);
			answer = n1;
			return [n1 * n2, n2];
		}
		else if (Reg.difficulty == 1) {
			var n1:Int;
			var n2:Int;
			do {
				n1 = getOperand(FlxRandom.intRanged(1, 2));
				n2 = getOperand(FlxRandom.intRanged(1, 2));
			} while (n1 == n1 * n2 || n2 == n1 * n2 || n1 * n2 > 100);
			answer = n1;
			return [n1 * n2, n2];
		}
		else if (Reg.difficulty == 2) {
			var n1:Int;
			var n2:Int;
			do {
				n1 = getOperand(FlxRandom.intRanged(1, 2));
				n2 = getOperand(FlxRandom.intRanged(1, 2));
			} while (n1 == n1 * n2 || n2 == n1 * n2 || n1 * n2 > 200);
			answer = n1;
			return [n1 * n2, n2];
		}
		else if (Reg.difficulty == 3) {
			var n1:Int;
			var n2:Int;
			do {
				n1 = getOperand(2);
				n2 = getOperand(FlxRandom.intRanged(1, 2));
			} while (n1 == n1 * n2 || n2 == n1 * n2 || n1 * n2 > 1000);
			answer = n1;
			return [n1 * n2, n2];
		}
		else {
			var n1:Int;
			var n2:Int;
			do {
				n1 = getOperand(2);
				n2 = getOperand(2);
			} while (n1 == n1 * n2 || n2 == n1 * n2);
			answer = n1;
			return [n1 * n2, n2];
		}
	}
	
	private function getOperand(Digits:Int):Int {
		if (Digits == 1)
			return FlxRandom.intRanged(1, 9);
		else if (Digits == 2)
			return FlxRandom.intRanged(10, 99);
		else
			return FlxRandom.intRanged(100, 999);
	}
}