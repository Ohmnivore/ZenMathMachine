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
	
	static public function loadPalette():Void {
		FlxG.save.bind("mentalmath");
		isDark = FlxG.save.data.isDark == true;
		if (isDark)
			color = dark;
		else
			color = light;
		FlxG.save.close();
	}
	static public function savePalette():Void {
		FlxG.save.bind("mentalmath");
		FlxG.save.data.isDark = isDark;
		FlxG.save.close();
	}
	
	static public var s:PlayState;
	static public var mode:Class<BaseMode>;
}