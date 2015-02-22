/*

Copyright 2006 Renaun Erickson (http://renaun.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

@ignore
*/
/*
    The RepeatingImage allows for ease deployment of repeating images

    Uses BitmapFill thanks to tip from Alex    
*/
package com.renaun.controls
{
	import mx.controls.SWFLoader;
	import mx.core.mx_internal;
	import flash.display.Bitmap;
	//import flash.utils.Dictionary;
	import flash.geom.Rectangle;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import mx.graphics.BitmapFill;
	//import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Graphics;
	
	use namespace mx_internal;
	
	/**
	 *  The RepeatingImage component provides a easy method of creating one image that repeat
	 *  across either axis.
	 *
	 *  @mxml
	 *
	 *  <pre>
	 *  &lt;renaun:RepeatingImage
	 *       <strong>Properties</strong>
	 *       repeatX="true|false"
	 *       repeatY="true|false"
	 *    /&gt;
	 *  </pre>
	 */
	public class RepeatingImage extends SWFLoader
	{
	
	    //--------------------------------------------------------------------------
	    //
	    //  Constructor
	    //
	    //--------------------------------------------------------------------------
	
	    /**
	     *  Constructor.
	     */
	    public function RepeatingImage()
	    {
	        super();
	        scaleContent = false;
	    }
	
	    //--------------------------------------------------------------------------
	    //
	    //  Variables
	    //
	    //--------------------------------------------------------------------------
	    
	    /**
	     *  @private
	     */    
	    private var fillArea:Sprite;
	
	    //--------------------------------------------------------------------------
	    //
	    //  Properties
	    //
	    //--------------------------------------------------------------------------
	
	    /**
	     *  Component will repeat the image on the X axis if true
	     */    
	    public var repeatX:Boolean = true;
	
	    /**
	     *  Component will repeat the image on the Y axis if true
	     */    
	    public var repeatY:Boolean = true;
	
	    /**
	     *  @private
	     */
	    override protected function updateDisplayList(unscaledWidth:Number,
	                                                  unscaledHeight:Number):void
	    {
	        super.updateDisplayList(unscaledWidth, unscaledHeight);
	
	        if( content && ( repeatX || repeatY ) )
	        {
	            var w:Number = width;
	               var h:Number = height;
	               if( !repeatX )
	                   w = content.width;
	               if( !repeatY )
	                   h = content.height;
	               
	            if( !fillArea ) {
	                fillArea = new Sprite();
	                fillArea.useHandCursor = false; // added by Danko
	            }
	            
	            this.addChild( fillArea );
	            var g:Graphics = fillArea.graphics;
	            g.clear();
	            g.moveTo( 0, 0 );
	                
	            var image:Bitmap = Bitmap( content );
	            var fill:BitmapFill = new BitmapFill();
	            fill.source = image.bitmapData;
	            fill.begin( g, new Rectangle( 0, 0, w, h ) );    
	            g.lineTo(w,0);
	            g.lineTo(w,h);
	            g.lineTo(0,h);
	            g.lineTo(0,0);  
	            fill.end( g );
	
	        }
	    }    
	}
}