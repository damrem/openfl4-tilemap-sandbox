package;

import flash.geom.Rectangle;
import hxlpers.Rnd;
import openfl.Assets;
import openfl.display.Application;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.events.Event;
import openfl.geom.ColorTransform;
import openfl.Lib;

/**
 * ...
 * @author damrem
 */
class Main extends Sprite 
{
	var tilemap:openfl.display.Tilemap;
	var hero:openfl.display.Tile;

	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		var tileset = new Tileset(Assets.getBitmapData("img/tilesheet.png"));
		var blockTileIndex = tileset.addRect(new Rectangle(0, 0, 32, 48));
		var crateTileIndex = tileset.addRect(new Rectangle(32, 0, 32, 48));
		var HERO = tileset.addRect(new Rectangle(64, 0, 32, 48));
		
		var bmpDt = Assets.getBitmapData("img/tilesheet.png");
		var bmp = new Bitmap(bmpDt);
		addChild(bmp);
		bmpDt.colorTransform(bmpDt.rect, new ColorTransform(1, 1, 1, 1, 255));
		
		
		
		
		for (i in 0...10)
		{
			
			
			tilemap = new Tilemap(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight, tileset);
			
			
			addChild(tilemap);
			
			var blockTile = tilemap.addTile(new Tile(blockTileIndex, Rnd.int(Std.int(tilemap.width)), Rnd.int(Std.int(tilemap.height)), 1, 1, 0));
			var blockCt = new ColorTransform(1, 1, 1, 1, Random.int(0, 255), Random.int(0, 255), Random.int(0, 255), 0);
			blockTile.transformBitmapDataCallback = function(bmpDt:BitmapData, rect:Rectangle):BitmapData
			{
				bmpDt.colorTransform(rect, blockCt);
				return bmpDt;
			}
			
			var crateTile = tilemap.addTile(new Tile(crateTileIndex, Rnd.int(Std.int(tilemap.width)), Rnd.int(Std.int(tilemap.height)), 1, 1, 0));
			var crateCt = new ColorTransform(1, 1, 1, 1, Random.int(0, 255), Random.int(0, 255), Random.int(0, 255), 0);
			crateTile.transformBitmapDataCallback = function(bmpDt:BitmapData, rect:Rectangle):BitmapData
			{
				bmpDt.colorTransform(rect, crateCt);
				return bmpDt;
			}
		}
		
		hero = tilemap.addTile(new Tile(HERO, Rnd.int(Std.int(tilemap.width)), Rnd.int(Std.int(tilemap.height)), 1, 1, 0));
		hero.transformBitmapDataCallback = function(bmpDt:BitmapData, rect:Rectangle):BitmapData
		{
			bmpDt.colorTransform(rect, new ColorTransform(1, 1, 1, 1, 0, 0, 255, 0));
			return bmpDt;
		}
		addEventListener(Event.ENTER_FRAME, update);
		
		
	}
	
	private function update(e:Event):Void 
	{
		hero.x = hero.x + Rnd.float() - 0.5;
		hero.y = hero.y + Rnd.float()-0.5;
	}

}
