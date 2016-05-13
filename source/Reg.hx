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
	static public var isLight:Bool = false;
	static public var color:ColorPalette;
	
	static public function loadPalette():Void {
		FlxG.save.bind("mentalmath");
		isLight = FlxG.save.data.isLight == true;
		if (isLight)
			color = light;
		else
			color = dark;
		FlxG.save.close();
	}
	static public function savePalette():Void {
		FlxG.save.bind("mentalmath");
		FlxG.save.data.isLight = isLight;
		FlxG.save.close();
	}
	
	static public var s:PlayState;
	static public var mode:Class<BaseMode>;
}