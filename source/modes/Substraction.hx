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
		}
		
		if (Reg.difficulty <= 1) {
			if (ret[1] > ret[0]) {
				var temp:Int = ret[0];
				ret[0] = ret[1];
				ret[1] = temp;
			}
		}
		
		answer = ret[0];
		for (i in 1...ret.length)
			answer -= ret[i];
		
		return ret;
	}
	
	private function getCount():Int {
		if (Reg.difficulty == 0)
			return 2;
		else if (Reg.difficulty == 1)
			return 2;
		else if (Reg.difficulty == 2)
			return FlxRandom.intRanged(2, 3);
		else if (Reg.difficulty == 3)
			return FlxRandom.intRanged(2, 4);
		else
			return FlxRandom.intRanged(3, 4);
	}
	
	private function getOperand():Int {
		var weights:Array<Float> = [];
		if (Reg.difficulty == 0)
			weights = [100];
		else if (Reg.difficulty == 1)
			weights = [25, 75];
		else if (Reg.difficulty == 2)
			weights = [20, 40, 40];
		else if (Reg.difficulty == 3)
			weights = [10, 30, 30, 30];
		else
			weights = [5, 10, 20, 35, 30];
		
		var digits:Int = FlxRandom.weightedPick(weights) + 1;
		if (digits == 1)
			return FlxRandom.intRanged(1, 9);
		else if (digits == 2)
			return FlxRandom.intRanged(10, 99);
		else if (digits == 3)
			return FlxRandom.intRanged(100, 999);
		else if (digits == 4)
			return FlxRandom.intRanged(1000, 9999);
		else
			return FlxRandom.intRanged(10000, 99999);
	}
}