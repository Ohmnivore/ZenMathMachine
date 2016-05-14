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
		FlxG.save.flush();
	}
	static public function savePalette():Void {
		FlxG.save.bind(SAVE_ID);
		FlxG.save.data.isDark = isDark;
		FlxG.save.flush();
	}
	
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