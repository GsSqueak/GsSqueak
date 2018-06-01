Inst vars (converting to morphic events)
hostView -- SketchMorph we are working on.
stampForm -- Stamp is stored here.
canvasRectangle -- later use bounds
palette -- the PaintBox interface Morph
dirty -- not used
currentColor 
ticksToDwell rotationCenter registrationPoint 
newPicBlock -- do this after painting
action -- selector of painting action
paintingForm -- our copy
composite -- now paintArea origin.  world relative.  stop using it.
dimForm -- SketchMorph of the dimmed background.  Opaque.  
		installed behind the editor morph.
buff 
brush -- 1-bit Form of the brush, 
paintingFormPen 
formCanvas -- Aim it at paintingForm to allow it to draw ovals, rectangles, lines, etc.
picToComp dimToComp compToDisplay -- used to composite -- obsolete
picToBuff brushToBuff buffToBuff buffToPic 
rotationButton scaleButton -- submorphs, handles to do these actions.
strokeOrigin -- During Pickup, origin of rect. 
cumRot cumMag -- cumulative for multiple operations from same original
undoBuffer 
lastEvent 
currentNib -- 1 bit deep form.


For now, we do not carry the SketchMorph's registration point, rotation center, or ticksToDwell.

New -- using transform morphs to rotate the finished player.  How get it rotated back and the rotationDegrees to be right?  We cancel out rotationDegrees, so how remember it?

Registration point convention:  
In a GraphicFrame, reg point is relative to this image's origin.
During painting, it is relative to canvasRectangle origin, and thus us absolute within the canvas.  To convert back, subract newBox origin.

Be sure to convert back and forth correctly.  In deliverPainting. initializeFromFrame:inView: 