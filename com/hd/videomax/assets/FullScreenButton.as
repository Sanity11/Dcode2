﻿/*  VIDEOMAX - CONTROL BAR MUTE BUTTON  Version: 1.8 Date:    10/18/2010 AS Lang: 3.0  Author:  Anthony Hessler (Hessler Design) Web:     www.hesslerdesign.com Email:   anthony@hesslerdesign.com  VideoMax is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License. For more information about this license, visit: http://creativecommons.org/licenses/by-sa/3.0/*/package com.hd.videomax.assets {		import flash.display.Sprite;	import flash.events.MouseEvent;	import flash.filters.GlowFilter;		public class FullScreenButton extends Sprite {				// Private Properties		private var btn:Sprite;		private var icon:Sprite;		private var sizeUp:Sprite;		private var sizeDown:Sprite;		private var hit:Sprite;		private var glowFilter:GlowFilter = new GlowFilter(0xffffff, 0.45, 5, 5, 2, 3);		private var filters_arr:Array = [glowFilter];				public function FullScreenButton():void {			init();		}								// --- Public: Enable/Disable Functions --- //		public function enable(pWhatWay_bol:Boolean=true):void {			btn.buttonMode = pWhatWay_bol;			btn.useHandCursor = pWhatWay_bol;			if (pWhatWay_bol) {				btn.addEventListener(MouseEvent.MOUSE_OVER, onBtnOver);				btn.addEventListener(MouseEvent.MOUSE_OUT, onBtnOut);				btn.addEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);				btn.addEventListener(MouseEvent.MOUSE_UP, onBtnUp);			} else {				btn.removeEventListener(MouseEvent.MOUSE_OVER, onBtnOver);				btn.removeEventListener(MouseEvent.MOUSE_OUT, onBtnOut);				btn.removeEventListener(MouseEvent.MOUSE_DOWN, onBtnDown);				btn.removeEventListener(MouseEvent.MOUSE_UP, onBtnUp);			}		}								// --- Public: Mute/Unmute Functions --- //		public function setFullScreen(pWhatWay_bol:Boolean=true):void {			if (pWhatWay_bol) {				sizeUp.visible = false;				sizeDown.visible = true;			} else {				sizeUp.visible = true;				sizeDown.visible = false;			}		}								// --- Public: Get/Set Functions --- //		public function setWidth(pSize_num:Number):void {			hit.width = pSize_num;			icon.x = Math.floor((pSize_num/2) - (icon.width/2));		}		public function setHeight(pSize_num:Number):void {			hit.height = pSize_num;			icon.y = Math.ceil((pSize_num/2) - (icon.height/2));		}								// --- Private: Initialization Functions --- //		private function init():void {			btn = new Sprite();			drawIcon();			drawHit();			setWidth(35);			setHeight(30);			onBtnOut(null);			addChild(btn);		}								// --- Private: Drawing Functions --- //		private function drawIcon():void {			icon = new Sprite();			sizeUp = new Sprite();			sizeDown = new Sprite();						var downTopLeftArrow:Sprite = downArrow();			var downTopRightArrow:Sprite = downArrow();			var downBottomLeftArrow:Sprite = downArrow();			var downBottomRightArrow:Sprite = downArrow();			var downInnerRect:Sprite = innerRectangle(7, 4);						var upTopLeftArrow:Sprite = upArrow();			var upTopRightArrow:Sprite = upArrow();			var upBottomLeftArrow:Sprite = upArrow();			var upBottomRightArrow:Sprite = upArrow();			var upInnerRect:Sprite = innerRectangle(11, 8);						downTopRightArrow.rotation = upTopRightArrow.rotation = 90;			downBottomLeftArrow.rotation = upBottomLeftArrow.rotation = -90;			downBottomRightArrow.rotation = upBottomRightArrow.rotation = 180;						downTopLeftArrow.x = 0;			downTopLeftArrow.y = 0;			downTopRightArrow.x = 12 + downTopRightArrow.width;			downTopRightArrow.y = 0;			downBottomLeftArrow.x = 0;			downBottomLeftArrow.y = 9 + downBottomLeftArrow.height;			downBottomRightArrow.x = 12 + downBottomRightArrow.width;			downBottomRightArrow.y = 9 + downBottomRightArrow.height;			downInnerRect.x = 4;			downInnerRect.y = 4;						upTopLeftArrow.x = 0;			upTopLeftArrow.y = 0;			upTopRightArrow.x = 12 + upTopRightArrow.width;			upTopRightArrow.y = 0;			upBottomLeftArrow.x = 0;			upBottomLeftArrow.y = 9 + upBottomLeftArrow.height;			upBottomRightArrow.x = 12 + upBottomRightArrow.width;			upBottomRightArrow.y = 9 + upBottomRightArrow.height;			upInnerRect.x = 2;			upInnerRect.y = 2;						sizeDown.addChild(downTopLeftArrow);			sizeDown.addChild(downTopRightArrow);			sizeDown.addChild(downBottomLeftArrow);			sizeDown.addChild(downBottomRightArrow);			sizeDown.addChild(downInnerRect);						sizeUp.addChild(upTopLeftArrow);			sizeUp.addChild(upTopRightArrow);			sizeUp.addChild(upBottomLeftArrow);			sizeUp.addChild(upBottomRightArrow);			sizeUp.addChild(upInnerRect);						icon.addChild(sizeDown);			icon.addChild(sizeUp);			btn.addChildAt(icon, 0);		}		private function downArrow():Sprite {			var downArrow:Sprite = new Sprite();			downArrow.graphics.beginFill(0xffffff, 1);			downArrow.graphics.moveTo(0, 0.5);			downArrow.graphics.lineTo(0.5, 0);			downArrow.graphics.lineTo(2, 1.5);			downArrow.graphics.lineTo(2, 0);			downArrow.graphics.lineTo(3, 0);			downArrow.graphics.lineTo(3, 3);			downArrow.graphics.lineTo(0, 3);			downArrow.graphics.lineTo(0, 2);			downArrow.graphics.lineTo(1.5, 0);			downArrow.graphics.lineTo(0, 0.5);			downArrow.graphics.endFill();			return downArrow;		}		private function upArrow():Sprite {			var upArrow:Sprite = new Sprite();			upArrow.graphics.beginFill(0xffffff, 1);			upArrow.graphics.moveTo(0, 0);			upArrow.graphics.lineTo(3, 0);			upArrow.graphics.lineTo(3, 1);			upArrow.graphics.lineTo(2, 1);			upArrow.graphics.lineTo(2, 2);			upArrow.graphics.lineTo(1, 2);			upArrow.graphics.lineTo(1, 3);			upArrow.graphics.lineTo(0, 3);			upArrow.graphics.lineTo(0, 0);			upArrow.graphics.endFill();			return upArrow;		}		private function innerRectangle(pw:Number, ph:Number):Sprite {			var innerRect:Sprite = new Sprite();			var top:Sprite = rectangle(pw, 1);			var left:Sprite = rectangle(1, (ph-2));			var right:Sprite = rectangle(1, (ph-2));			var bottom:Sprite = rectangle(pw, 1);			top.x = 0;			top.y = 0;			left.x = 0;			left.y = 1;			right.x = pw-1;			right.y = 1;			bottom.x = 0;			bottom.y = left.y + left.height;			innerRect.addChild(top);			innerRect.addChild(left);			innerRect.addChild(right);			innerRect.addChild(bottom);			return innerRect;		}		private function rectangle(pw:Number, ph:Number):Sprite {			var rect:Sprite = new Sprite();			rect.graphics.beginFill(0xffffff, 1);			rect.graphics.drawRect(0, 0, pw, ph);			rect.graphics.endFill();			return rect;		}		private function drawHit():void {			hit = new Sprite();			hit.graphics.beginFill(0xffffff, 1);			hit.graphics.drawRect(0, 0, 30, 30);			hit.graphics.endFill();			hit.alpha = 0;			btn.addChildAt(hit, 1);		}								// --- Private: Event Handler Functions --- //		private function onBtnOver(e:MouseEvent):void {			icon.alpha = 1;			icon.filters = filters_arr;		}		private function onBtnOut(e:MouseEvent):void {			icon.alpha = 0.4;			icon.filters = null;		}		private function onBtnDown(e:MouseEvent):void {			icon.alpha = 0.4;			icon.filters = filters_arr;			icon.y += 1;		}		private function onBtnUp(e:MouseEvent):void {			icon.alpha = 1;			icon.filters = filters_arr;			icon.y = Math.ceil((hit.height/2) - (icon.height/2));		}		}	}