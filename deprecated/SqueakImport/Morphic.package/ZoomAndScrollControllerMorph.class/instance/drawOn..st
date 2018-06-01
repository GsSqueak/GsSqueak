drawing
drawOn: aCanvas

	| dw bullsEye f |

	super drawOn: aCanvas.
	changeKeysState ifNotNil: [
		f := (
			StringMorph contents: 'Press the key to be used for "',changeKeysState first,'"'
		) imageForm.
		aCanvas paintImage: f at: self center - (f extent // 2).
		^self
	].
	mouseDownPoint ifNil: [^self].
	dw := self deadZoneWidth.
	bullsEye := mouseDownPoint - (dw@dw//2) extent: dw@dw.
	aCanvas 
		fillRectangle: (bullsEye left @ self top corner: bullsEye right @ self bottom) 
		color: (Color red alpha: 0.3).
	aCanvas 
		fillRectangle: (self left @ bullsEye top corner: self right @ bullsEye bottom) 
		color: (Color red alpha: 0.3).
	aCanvas 
		fillRectangle: bullsEye 
		color: (Color red alpha: 0.4).
