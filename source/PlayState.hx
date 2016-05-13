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
import flixel.util.FlxTimer;
import modes.BaseMode;

class PlayState extends FlxState {
	
	private var keypad:KeyPad;
	
	private var cur:BaseMode;
	private var curTween:FlxTween;
	private var curOriginalX:Float;
	private var swipeBeginX:Float;
	private var targetx:Float;
	
	override public function create():Void {
		super.create();
		
		FlxG.camera.bgColor = Reg.color.bg;
		FlxG.scaleMode = new PixelPerfectScaleMode();
		FlxG.mouse.load("assets/images/cursor.png", 1);
		
		keypad = new KeyPad(0, FlxG.height);
		add(keypad);
		FlxTween.tween(keypad, {"y": 240}, 0.7, {ease: FlxEase.elasticOut});
		
		addChallenge();
	}
	
	private function addChallenge():Void {
		cur = Type.createInstance(Reg.mode, []);
		add(cur);
		keypad.onKey = cur.onKey;
		cur.y = (FlxG.height / 2 - cur.height) / 2;
		cur.x = -cur.width;
		targetx = (FlxG.width - cur.width) / 2;
		curOriginalX = (FlxG.width - cur.width) / 2;
		curTween = FlxTween.tween(cur, {"x": (FlxG.width - cur.width) / 2}, 0.7, {ease: FlxEase.elasticOut});
	}
	
	private function onDoneChallenge(T:FlxTween):Void {
		cur.kill();
		cur.destroy();
		remove(cur, true);
		
		addChallenge();
	}
	
	override public function update():Void {
		if (curTween.finished) {
			if (FlxG.mouse.justPressed)
				swipeBeginX = FlxG.mouse.x;
			if (FlxG.mouse.pressed) {
				var dx:Float = FlxG.mouse.x - swipeBeginX;
				targetx = curOriginalX + Math.max(dx, 0);
				
				if (cur.x + cur.width >= FlxG.width && targetx + cur.width >= FlxG.width) {
					swipeBeginX = FlxG.mouse.x;
					
					if (cur.inputIsEmpty())
						curTween = FlxTween.tween(cur, {"x": curOriginalX}, 0.7, {ease: FlxEase.elasticOut});
					else if (cur.inputIsValid()) {
						curTween = FlxTween.tween(cur, {"y": -cur.height}, 0.3,
							{ease: FlxEase.backIn, complete: onDoneChallenge});
						//cur.x = targetx = cur.x * 0.25 + (FlxG.width - cur.width) * 0.75;
					}
					else {
						curTween = FlxTween.tween(cur, {"x": curOriginalX}, 0.7, {ease: FlxEase.elasticOut});
						cur.input.setText(Std.string(cur.answer));
						cur.input.setColor(Reg.color.op);
						
						FlxG.camera.shake(0.005, 0.33);
					}
				}
			}
			else {
				targetx = curOriginalX;
			}
			
			cur.x = cur.x * 0.85 + targetx * 0.15;
		}
		
		super.update();
		
		if (FlxG.keys.justPressed.ESCAPE) {
			FlxTween.manager.clear();
			for (m in members)
				untyped FlxTween.tween(m, {"y": m.y - FlxG.height}, 0.3, {ease: FlxEase.backIn});
			new FlxTimer(0.3, function(T:FlxTimer) {
				FlxG.switchState(new MenuState());
			});
		}
	}
}