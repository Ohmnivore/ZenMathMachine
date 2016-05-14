package ents;
import ents.NumText.NumTextChar;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

/**
 * ...
 * @author Ohmnivore
 */
class HintArrow extends NumTextChar {
	
	public function new(X:Float, Y:Float) {
		super(">");
		
		x = X;
		y = Y;
		color = Reg.color.op;
		alpha = 0;
		
		var t:FlxTween = FlxTween.tween(this, {"alpha": 0.8}, 1.5, {ease: FlxEase.quadInOut});
		t.type = FlxTween.PINGPONG;
		t.startDelay = 1.0;
		t.loopDelay = 1.0;
	}
}