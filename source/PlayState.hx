package;

import ents.ColorPalette;
import ents.KeyPad;
import ents.NumText;
import ents.ResultBar;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.system.scaleModes.StageSizeScaleMode;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import modes.Addition;

class PlayState extends FlxState {
	
	override public function create():Void {
		super.create();
		Reg.color = new ents.ColorPalette(0xfffdf6e3, 0xffeee8d5, 0xff93a1a1, 0xffcb4b16, 0xffd33682, 0xff2aa198);
		
		FlxG.camera.bgColor = Reg.color.bg;
		FlxG.scaleMode = new PixelPerfectScaleMode();
		FlxG.mouse.load("assets/images/cursor.png", 1);
		
		var keypad:KeyPad = new KeyPad(0, 480);
		add(keypad);
		keypad.onKey = onKey;
		FlxTween.tween(keypad, {"y": 240}, 0.7, {ease: FlxEase.elasticOut});
		
		//var t1:NumText = new NumText(8 + 36, 8, "113");
		//var t2:NumText = new NumText(8, 8 + 36, "+ 47");
		//var bar:ResultBar = new ResultBar(8, 8 + 36 * 2 + 4, t2.getWidth());
		//var t3:NumText = new NumText(8 + 36, bar.y + bar.height + 4, "160");
		//add(t1);
		//add(t2);
		//add(bar);
		//add(t3);
		
		var tadd:Addition = new Addition();
		add(tadd);
		keypad.onKey = tadd.onKey;
		tadd.y = (FlxG.height / 2 - tadd.height) / 2;
		tadd.x = -tadd.width;
		FlxTween.tween(tadd, {"x": (FlxG.width - tadd.width) / 2}, 0.7, {ease: FlxEase.elasticOut});
	}
	
	private function onKey(Char:String):Void {
		trace(Char);
	}
}