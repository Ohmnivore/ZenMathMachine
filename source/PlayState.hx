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

class PlayState extends FlxState {
	
	private var bg:FlxSprite;
	
	override public function create():Void {
		super.create();
		Reg.color = new ents.ColorPalette(0xfffdf6e3, 0xffeee8d5, 0xffcb4b16, 0xffd33682, 0xff2aa198);
		
		FlxG.camera.bgColor = Reg.color.bg;
		FlxG.scaleMode = new PixelPerfectScaleMode();
		FlxG.mouse.load("assets/images/cursor.png", 1);
		
		var keypad:KeyPad = new KeyPad(240);
		add(keypad);
		
		var t1:NumText = new NumText(8 + 36, 8, "113");
		var t2:NumText = new NumText(8, 8 + 36, "+ 47");
		var bar:ResultBar = new ResultBar(8, 8 + 36 * 2 + 4, t2.getWidth());
		var t3:NumText = new NumText(8 + 36, bar.y + bar.height + 4, "160");
		add(t1);
		add(t2);
		add(bar);
		add(t3);
	}
	
	override public function destroy():Void {
		super.destroy();
	}
	
	override public function update():Void {
		super.update();
	}
	
	override public function onResize(Width:Int, Height:Int):Void {
		super.onResize(Width, Height);
		if (bg != null) {
			bg.scale.x = bg.scale.y = FlxG.height / bg.height;
			bg.updateHitbox();
		}
	}
}