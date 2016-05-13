package;
import ents.MenuKeyPad;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

/**
 * ...
 * @author Ohmnivore
 */
class MenuState extends FlxState {
	
	private var skipintro:Bool;
	private var keypad:MenuKeyPad;
	
	public function new(SkipIntro:Bool = false) {
		skipintro = SkipIntro;
		super();
	}
	
	override public function create():Void {
		super.create();
		Reg.loadPalette();
		
		FlxG.camera.bgColor = Reg.color.bg;
		FlxG.scaleMode = new PixelPerfectScaleMode();
		FlxG.mouse.load("assets/images/cursor.png", 1);
		
		keypad = new MenuKeyPad(0, 0);
		add(keypad);
		keypad.onKey = onKey;
		if (skipintro)
			keypad.y = 40;
		else {
			keypad.y = FlxG.height;
			FlxTween.tween(keypad, {"y": 40}, 0.7, {ease: FlxEase.elasticOut});
		}
	}
	
	private function onKey(Char:String):Void {
		if (Char == "+") {
			openChallenge();
		}
		else if (Char == "%") {
			Reg.isLight = !Reg.isLight;
			Reg.savePalette();
			FlxG.switchState(new MenuState(true));
		}
	}
	
	private function openChallenge():Void {
		FlxTween.tween(keypad, {"y": -400}, 0.3, {ease: FlxEase.backIn, complete:
			function(T:FlxTween) {
				FlxG.switchState(new PlayState());
			}
		});
	}
}