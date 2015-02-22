package org.zgflex.desktop.selection
{
	import flash.geom.Rectangle;
	
	import mx.containers.Canvas;
	import mx.controls.Image;
	
	import org.zgflex.desktop.IIconSelector;

	public class Scale9SelectionArea extends SelectionAreaBase
	{
		public var imageClass:Class;
		protected var image:Image;
		
		public function Scale9SelectionArea(target:IIconSelector = null)
		{
			super(target);			
		}
		
		/**
		 * Draws the selection rectangle 
		 * @param rect
		 * 
		 */		
		override protected function draw(rect:Rectangle):void {
			if (!image){
				image = new Image();
				image.source = imageClass;
				image.maintainAspectRatio = false;
				surface.addChild(image);
			} else
				image.visible = true;
					
			image.x = rect.x; // - image.content.scale9Grid.left;
			image.y = rect.y; // - image.content.scale9Grid.bottom;
			image.width = rect.width; // + image.content.scale9Grid.left + image.content.scale9Grid.right;
			image.height = rect.height; // + image.content.scale9Grid.top + image.content.scale9Grid.bottom;
		}
		
		override public function stop():void {
			super.stop();
			image.visible = false;
		}
		
	}
}