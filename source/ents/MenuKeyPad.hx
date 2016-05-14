package ents;
import ents.KeyPad.Key;
import flixel.FlxG;

/**
 * ...
 * @author Ohmnivore
 */
class MenuKeyPad extends KeyPad {
	
	private var diffKey:Key;
	
	override function addKeys():Void {
		var xv:Float = (FlxG.width - 80) / 2;
		
		add(new Key(this, xv, 0, "+"));
		add(new Key(this, xv, 80, "-"));
		add(new Key(this, xv - 80, 160, "%"));
		diffKey = new Key(this, xv, 160, "{");
		add(diffKey);
		add(new Key(this, xv + 80, 160, "@"));
		add(new Key(this, xv, 240, "*"));
		add(new Key(this, xv, 320, "/"));
	}
	
	public function setDifficulty(Difficulty:Int):Void {
		if (Difficulty == 0)
			diffKey.char.setChar("(", false);
		else if (Difficulty == 1)
			diffKey.char.setChar("}", false);
		else if (Difficulty == 2)
			diffKey.char.setChar("{", false);
		else if (Difficulty == 3)
			diffKey.char.setChar("]", false);
		else if (Difficulty == 4)
			diffKey.char.setChar("[", false);
	}
}