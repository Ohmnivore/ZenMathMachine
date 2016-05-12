package ents;
import flixel.FlxSprite;

/**
 * ...
 * @author Ohmnivore
 */
class ResultBar extends FlxSprite {
	
	public function new(X:Float, Y:Float, Width:Int) {
		super(X, Y);
		makeGraphic(Width, 4, Reg.color.misc, true);
	}
}