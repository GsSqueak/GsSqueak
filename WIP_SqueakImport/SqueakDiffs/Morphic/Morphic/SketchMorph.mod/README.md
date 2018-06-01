The morph that results when the user draws a color bitmap using the PaintBox (SketchEditorMorph and PaintBoxMorph).  

forwardDirection is the angle at which the object will go forward.  When the rotationStyle is not #normal, then forwardDirection is any angle, while the rotation is highly restricted.  If flexed, this is remembered by the Transform morph.  For non-normal rotationStyle, it is rotationDegrees.

setupAngle (a property) is where the user put the green arrow to indicate which direction on the picture is forward.  When #normal, draw the morph initially at (0.0 - setupAngle).  The enclosing TransformationMorph then rotates it to the true angle.
 
rotationDegrees  In a #normal object, rotationDegrees is constant an equal to setupAngle.
	For non-normal, it is the direction the object is going.

When repainting, set it back to its original state. The green arrow is set to setupAngle, and the sketch is shown as drawn originally (rotationDegrees = 0). 

rotationStyle = normal (turns), leftRight, upDown, fixed.  
When leftRight upDown or fixed, bit map has severe restrictions.
