actions & preps
showDirType
	"Display the proper symbol for this direction type.  rotationStyle
is one of #(normal leftRight upDown none)."

| rr poly |
rr := self rotationStyle.
poly := self valueOfProperty: #fwdButton.
rr == #normal ifTrue: [^ poly makeBackArrow].
rr == #leftRight ifTrue: [
	poly makeBothArrows.
	^ poly setVertices: (Array with: poly center - (7@0) with:  poly
center + (7@0))].
rr == #upDown ifTrue: [
	poly makeBothArrows.
	^ poly setVertices: (Array with: poly center - (0@7) with:  poly
center + (0@7))].
rr == #none ifTrue: [
	poly makeNoArrows.
	^ poly setVertices: (Array with: poly center - (7@0) with:  poly
center + (7@0)
		 with: poly center with: poly center - (0@7) with:  poly
center + (0@7))].
