package;
import ents.MenuKeyPad;
import ents.NumText;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import modes.*;

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
		#if debug
		Reg.initDebug();
		#end
		//ChallengeCounter.init();
		
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
		
		//var plus:NumText = new NumText(0, 0, ChallengeCounter.getString("+"));
		//add(plus);
		//plus.x = 120 - 72 - 4 + (72 - plus.getWidth());
		//plus.y = 80 - 18;
		//
		//var minus:NumText = new NumText(0, 0, ChallengeCounter.getString("-"));
		//add(minus);
		//minus.x = 120 - 72 - 4 + (72 - minus.getWidth());
		//minus.y = 160 - 18;
		//
		//var mult:NumText = new NumText(0, 0, ChallengeCounter.getString("*"));
		//add(mult);
		//mult.x = 200 + 4 + (72 - mult.getWidth());
		//mult.y = 320 - 18;
		//
		//var div:NumText = new NumText(0, 0, ChallengeCounter.getString("/"));
		//add(div);
		//div.x = 200 + 4 + (72 - div.getWidth());
		//div.y = 400 - 18;
		//
		//if (!skipintro) {
			//for (w in [plus, minus, mult, div]) {
				//w.y += 440;
				//FlxTween.tween(w, {"y": w.y - 440}, 0.7, {ease: FlxEase.elasticOut});
			//}
		//}
	}
	
	private function onKey(Char:String):Void {
		if (Char == "+") {
			Reg.mode = Addition;
			openChallenge();
		}
		else if (Char == "-") {
			Reg.mode = Substraction;
			openChallenge();
		}
		else if (Char == "*") {
			Reg.mode = Multiplication;
			openChallenge();
		}
		else if (Char == "/") {
			Reg.mode = Division;
			openChallenge();
		}
		else if (Char == "%") {
			Reg.isDark = !Reg.isDark;
			Reg.savePalette();
			FlxG.switchState(new MenuState(true));
		}
		else if (Char == "@") {
			FlxG.openURL("https://twitter.com/4_AM_Games");
		}
	}
	
	private function openChallenge():Void {
		for (m in members) {
			untyped FlxTween.tween(m, {"y": m.y - 440}, 0.3, {ease: FlxEase.backIn, complete:
				function(T:FlxTween) {
					FlxTween.manager.clear();
					FlxG.switchState(new PlayState());
				}
			});
		}
	}
}