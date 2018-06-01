MagnifierMorph instances are magnifying lenses that magnify the morphs below them (if grabbed or if trackPointer is false) or the area around the mouse pointer.

Instance variables:

magnification	<Number> The magnification to use. If non-integer, smooths the magnified form.

trackPointer		<Boolean> If set, magnifies the area around the Hand. If not, magnfies the area underneath the magnifier center.

showPointer		<Boolean> If set, display a small reversed rectangle in the center of the lens. Also enables the display of Morphs in the Hand itself.

srcExtent		<Rectangle> The extent of the source rectangle.
		
Class variables:

RecursionLock	<MagnifierMorph|nil> Used to avoid infinite recursion when getting the source patch to display.