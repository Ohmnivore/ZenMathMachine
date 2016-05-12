package ents;
import ents.NumText.NumTextChar;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Ohmnivore
 */
class KeyPad extends FlxGroup {
	
	public function new(OffsetY:Float) {
		super();
		
		add(new Key(0, 0 + OffsetY, "0"));
		add(new Key(80, 0 + OffsetY, "1"));
		add(new Key(160, 0 + OffsetY, "2"));
		add(new Key(240, 0 + OffsetY, "3"));
		add(new Key(0, 80 + OffsetY, "4"));
		add(new Key(80, 80 + OffsetY, "5"));
		add(new Key(160, 80 + OffsetY, "6"));
		add(new Key(240, 80 + OffsetY, "7"));
		add(new Key(0, 160 + OffsetY, "8", 160));
		add(new Key(160, 160 + OffsetY, "9", 160));
	}
}

class Key extends FlxGroup {
	
	static private inline var SPACING:Int = 8;
	
	public var x:Float;
	public var y:Float;
	
	public var bg:FlxSprite;
	public var char:NumTextChar;
	
	public function new(X:Float, Y:Float, Char:String, Width:Int = 80) {
		super();
		
		x = X;
		y = Y;
		
		bg = new FlxSprite();
		bg.makeGraphic(Width - SPACING, 80 - SPACING, Reg.color.bg2);
		add(bg);
		
		char = new NumTextChar(Char);
		add(char);
	}
	
	override public function update():Void {
		super.update();
		
		bg.x = x + SPACING / 2;
		bg.y = y + SPACING / 2;
		
		char.x = bg.x + (bg.width - NumTextChar.SIZE) / 2;
		char.y = bg.y + (bg.height - NumTextChar.SIZE) / 2;
	}
}