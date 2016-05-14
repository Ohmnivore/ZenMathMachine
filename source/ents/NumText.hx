package ents;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

/**
 * ...
 * @author Ohmnivore
 */
class NumText extends FlxGroup {
	
	public var x:Float;
	public var y:Float;
	private var text:String;
	
	public function new(X:Float, Y:Float, Text:String) {
		super();
		
		x = X;
		y = Y;
		setText(Text);
	}
	
	public function setText(Text:String):Void {
		if (Text != text) {
			
			callAll("kill");
			callAll("destroy");
			clear();
			
			for (i in 0...Text.length) {
				var c:String = Text.charAt(i);
				var char:NumTextChar = new NumTextChar(c);
				add(char);
			}
			text = Text;
		}
	}
	
	public function getText():String {
		return text;
	}
	
	public function getWidth():Int {
		return text.length * NumTextChar.SIZE;
	}
	
	public function setColor(Color:Int):Void {
		for (i in 0...members.length) {
			var char:NumTextChar = cast members[i];
			char.color = Color;
		}
	}
	
	override public function update():Void {
		for (i in 0...members.length) {
			var char:NumTextChar = cast members[i];
			char.x = NumTextChar.SIZE * i + x;
			char.y = y;
		}
		
		super.update();
	}
}

class NumTextChar extends FlxSprite {
	
	static public inline var SIZE:Int = 36;
	
	public var char:String;
	
	public function new(Char:String) {
		super();
		loadGraphic("assets/images/font.png", true, SIZE, SIZE);
		
		animation.add("0", [ 0], 30, false);
		animation.add("1", [ 1], 30, false);
		animation.add("2", [ 2], 30, false);
		animation.add("3", [ 3], 30, false);
		animation.add("4", [ 4], 30, false);
		animation.add("5", [ 5], 30, false);
		animation.add("6", [ 6], 30, false);
		animation.add("7", [ 7], 30, false);
		animation.add("8", [ 8], 30, false);
		animation.add("9", [ 9], 30, false);
		animation.add("=", [10], 30, false);
		animation.add("+", [11], 30, false);
		animation.add("-", [12], 30, false);
		animation.add("*", [13], 30, false);
		animation.add("/", [14], 30, false);
		animation.add(" ", [15], 30, false);
		animation.add("%", [16], 30, false);
		animation.add("[", [17], 30, false);
		animation.add("]", [18], 30, false);
		animation.add("{", [19], 30, false);
		animation.add("}", [20], 30, false);
		animation.add("(", [21], 30, false);
		animation.add("@", [22], 30, false);
		animation.add(">", [23], 30, false);
		
		setChar(Char);
	}
	
	public function setChar(Char:String):Void {
		char = Char;
		animation.play(char);
		
		var code:Int = char.charCodeAt(0);
		if (code >= 48 && code <= 57)
			color = Reg.color.num;
		else
			color = Reg.color.op;
	}
}