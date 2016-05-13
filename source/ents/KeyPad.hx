package ents;
import ents.KeyPad.Key;
import ents.NumText.NumTextChar;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Ohmnivore
 */
class KeyPad extends FlxGroup {
	
	public var x:Float;
	public var y:Float;
	public var onKey:String->Void;
	
	public function new(X:Float, Y:Float) {
		super();
		
		x = X;
		y = Y;
		addKeys();
	}
	
	private function addKeys():Void {
		add(new Key(this, 0, 0, "0"));
		add(new Key(this, 80, 0, "1"));
		add(new Key(this, 160, 0, "2"));
		add(new Key(this, 240, 0, "3"));
		add(new Key(this, 0, 80, "4"));
		add(new Key(this, 80, 80, "5"));
		add(new Key(this, 160, 80, "6"));
		add(new Key(this, 240, 80, "7"));
		add(new Key(this, 0, 160, "8"));
		add(new Key(this, 80, 160, "9"));
		add(new Key(this, 160, 160, "-"));
		add(new Key(this, 240, 160, "*"));
	}
	
	override public function update():Void {
		super.update();
		
		for (i in 0...members.length) {
			var key:Key = cast members[i];
			key.x = x + key.offsetx;
			key.y = y + key.offsety;
		}
	}
}

class Key extends FlxGroup {
	
	static private inline var SPACING:Int = 8;
	
	public var x:Float;
	public var y:Float;
	public var offsetx:Float;
	public var offsety:Float;
	
	public var bg:FlxSprite;
	public var char:NumTextChar;
	public var pad:KeyPad;
	
	public function new(Pad:KeyPad, OffsetX:Float, OffsetY:Float, Char:String) {
		super();
		
		pad = Pad;
		x = 0;
		y = 0;
		offsetx = OffsetX;
		offsety = OffsetY;
		
		bg = new FlxSprite();
		bg.makeGraphic(80 - SPACING, 80 - SPACING, 0xffffffff);
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
		
		if (FlxG.mouse.pressed && bg.overlapsPoint(FlxG.mouse.getWorldPosition())) {
			bg.color = Reg.color.bg;
			char.color = Reg.color.op;
		}
		else if (FlxG.mouse.justReleased && pad.onKey != null && bg.overlapsPoint(FlxG.mouse.getWorldPosition())) {
			pad.onKey(char.char);
		}
		else {
			bg.color = Reg.color.bg2;
			char.color = Reg.color.num;
		}
	}
}