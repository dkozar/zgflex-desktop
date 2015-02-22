package org.zgflex.desktop.selection
{
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	
	import org.zgflex.desktop.IIconSelector;

	public class RoundedSelectionArea extends SelectionAreaBase
	{
		public var radius:Number = 5;
		
		public function RoundedSelectionArea(target:IIconSelector = null)
		{
			super(target);
		}
		
		/**
		 * Draws the selection rectangle 
		 * @param rect
		 * 
		 */		
		override protected function draw(rect:Rectangle):void {			
			var g:Graphics = surface.graphics;
			g.clear();
			g.lineStyle(borderWidth, borderColor, borderAlpha);
			g.beginFill(backgroundColor, backgroundAlpha);
			g.drawRoundRect(rect.x, rect.y, rect.width, rect.height, radius, radius);
			g.endFill();
		}
		
	}
}