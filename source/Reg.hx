package;
import ents.ColorPalette;
import flixel.FlxG;
import modes.BaseMode;

/**
 * ...
 * @author Ohmnivore
 */
class Reg {
	
	static public var light:ColorPalette;
	static public var dark:ColorPalette;
	static public var isDark:Bool = false;
	static public var color:ColorPalette;
	static public inline var SAVE_ID:String = "mentalmath";
	
	static public function loadPalette():Void {
		FlxG.save.bind(SAVE_ID);
		isDark = FlxG.save.data.isDark == true;
		if (isDark)
			color = dark;
		else
			color = light;
	}
	static public function savePalette():Void {
		FlxG.save.bind(SAVE_ID);
		FlxG.save.data.isDark = isDark;
		FlxG.save.flush();
	}
	
	static public var difficulty:Int;
	static public function loadDifficulty():Void {
		FlxG.save.bind(SAVE_ID);
		if (Reflect.field(FlxG.save.data, "difficulty") == null)
			difficulty = 2;
		else
			difficulty = Reflect.field(FlxG.save.data, "difficulty");
	}
	static public function addDifficulty():Void {
		difficulty++;
		if (difficulty > 4)
			difficulty = 0;
		
		FlxG.save.bind(SAVE_ID);
		FlxG.save.data.difficulty = difficulty;
		FlxG.save.flush();
	}
	
	static public var fSize:Int = 36;
	static public var margin:Int = 4;
	static public var s:PlayState;
	static public var mode:Class<BaseMode>;
	static public var hintShown:Bool = false;
	
	static public function initDebug():Void {
		FlxG.console.addCommand(["es"], eraseSave);
	}
	static private function eraseSave():Void {
		FlxG.save.bind(SAVE_ID);
		FlxG.save.erase();
	}
}