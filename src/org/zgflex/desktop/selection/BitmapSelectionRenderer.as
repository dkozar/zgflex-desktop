package org.zgflex.desktop.selection
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import mx.controls.Image;
	
	import org.zgflex.desktop.IIconSelector;

	public class BitmapSelectionRenderer extends SelectionRendererBase
	{
        public var imageClass:Class;
		
		public function BitmapSelectionRenderer(target:IIconSelector = null)
		{
			super(target);
		}
		
		/**
		 * Draws the selection rectangle 
		 * @param rect A dimensions of rectangle area
		 * 
		 */		
		override protected function draw(rect:Rectangle):void {			
			var g:Graphics = surface.graphics;
			var img:Image = new Image();
			img.source = imageClass;
			img.load();			
			
			var bitmapData:BitmapData = new BitmapData(img.content.width, img.content.height); //(img.width, img.height);
			bitmapData.draw(img);
			
			var m:Matrix = new Matrix();
			m.translate(rect.x, rect.y);
			
			g.beginBitmapFill(bitmapData, m);
			g.drawRect(rect.x, rect.y, rect.width, rect.height);
			g.endFill();
		}
		
	}
}