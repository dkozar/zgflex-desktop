package org.zgflex.desktop.selection
{
	import flash.display.Graphics;
	import flash.geom.Rectangle;
	
	import org.zgflex.desktop.IIconSelector;

	public class RoundedSelectionRenderer extends SelectionRendererBase
	{
		public var radius:Number = 15;
		
		public function RoundedSelectionRenderer(target:IIconSelector = null)
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
			g.lineStyle(borderWidth, borderColor, borderAlpha);
			g.beginFill(backgroundColor, backgroundAlpha);
			g.drawRoundRect(rect.x, rect.y, rect.width, rect.height, radius, radius);
			g.endFill();
		}
		
	}
}