//package;
//import flixel.FlxG;
//
///**
 //* ...
 //* @author Ohmnivore
 //*/
//class ChallengeCounter {
	//
	//static public function init() {
		//FlxG.save.bind(Reg.SAVE_ID);
	//}
	//
	//static public function add(Operator:String):Void {
		//if (Reflect.field(FlxG.save.data, Operator) == null)
			//Reflect.setField(FlxG.save.data, Operator, 1);
		//else {
			//var newCount:Int = Reflect.field(FlxG.save.data, Operator) + 1;
			//if (newCount < 100)
				//Reflect.setField(FlxG.save.data, Operator, newCount);
		//}
		//FlxG.save.flush();
	//}
	//
	//static public function get(Operator:String):Int {
		//if (Reflect.field(FlxG.save.data, Operator) == null)
			//return 0;
		//else
			//return Reflect.field(FlxG.save.data, Operator);
	//}
	//
	//static public function getString(Operator:String):String {
		//var op:Int = get(Operator);
		//var ret:String = Std.string(op);
		//if (op < 10)
			//ret = "0" + ret;
		//return ret;
	//}
//}