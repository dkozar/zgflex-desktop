package fix 
{ 
	import flash.events.MouseEvent;
	
	import mx.controls.Button;
	import mx.controls.LinkBar;

	public class ExtLinkBar extends LinkBar 
	{ 
		override protected function clickHandler(event:MouseEvent):void 
		{ 
	        var index:int = getChildIndex(Button(event.currentTarget)); 
	
	        if (index == selectedIndex) 
	            hiliteSelectedNavItem(-1);	             
	        else 
	            hiliteSelectedNavItem(index); 
	
	        super.clickHandler(event); 
	    } 	
	} 
}