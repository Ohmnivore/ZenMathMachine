# Very Zen Mental Math Machine
This is an exercise in UI design and tweening. The idea was to make a dead simple math game feel as good as possible.
The project took around four days to complete. Some parts of the code could definitely be cleaned up, I'll do that eventually.

# TODO
* Better division challenge generator

# Solarized
The color palettes I used were designed by Ethan Schoonover: [http://ethanschoonover.com/solarized]

### Dependencies
* Haxe 3.2.0
* HaxeFlixel 3.3.11
* OpenFL 3.1.4
* Lime 2.5.0
* HaxeDevelop 5.1.1.1

### HaxeFlixel modifications (improved screen shake)
#### FlxCamera 260
```
public var _fxShakeOffset:FlxPoint;
```

#### FlxCamera 988
```
//if ((_fxShakeOffset.x != 0) || (_fxShakeOffset.y != 0))
//{
	//flashSprite.x += _fxShakeOffset.x;
	//flashSprite.y += _fxShakeOffset.y;
//}
```

#### FlxSprite 760
```
_point.x = x - (camera.scroll.x * scrollFactor.x) - (offset.x) + camera._fxShakeOffset.x;
_point.y = y - (camera.scroll.y * scrollFactor.y) - (offset.y) + camera._fxShakeOffset.y;
```

#### FlxSprite 766
```
_point.x = x - (camera.scroll.x * scrollFactor.x) - (offset.x) + camera._fxShakeOffset.x;
_point.y = y - (camera.scroll.y * scrollFactor.y) - (offset.y) + camera._fxShakeOffset.y;
```