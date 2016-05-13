package ents;
import ents.KeyPad.Key;
import flixel.FlxG;

/**
 * ...
 * @author Ohmnivore
 */
class MenuKeyPad extends KeyPad {
	
	override function addKeys():Void {
		var xv:Float = (FlxG.width - 80) / 2;
		
		add(new Key(this, xv, 0, "+"));
		add(new Key(this, xv, 80, "-"));
		add(new Key(this, xv - 80, 160, "%"));
		add(new Key(this, xv, 160, "{"));
		add(new Key(this, xv + 80, 160, "@"));
		add(new Key(this, xv, 240, "*"));
		add(new Key(this, xv, 320, "/"));
	}
}