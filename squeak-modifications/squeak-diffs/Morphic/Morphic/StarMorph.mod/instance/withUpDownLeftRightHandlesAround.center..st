editing
withUpDownLeftRightHandlesAround: radius center: center
	"Add to our handles the side and shape changing handles."
	| tri  above holder  triAbove triBelow triRight triLeft |
	above := 0 @ radius negated.
	
	tri := Array
				with: 0 @ -5
				with: 4 @ 3
				with: -4 @ 3.
	triAbove := tri + (center + above).
	triBelow := triAbove
				collect: [:pt | pt rotateBy: #pi centerAt: center].
	triRight := triAbove
				collect: [:pt | pt rotateBy: #right centerAt: center].
	triLeft := triAbove
				collect: [:pt | pt rotateBy: #left centerAt: center].
				
	holder := { (PolygonMorph
				vertices: triAbove
				color: Color green
				borderWidth: 1
				borderColor: Color black)
				 setBalloonText: 'More points.'. 
				
				(PolygonMorph
				vertices: triBelow
				color: Color magenta
				borderWidth: 1
				borderColor: Color black)
				 setBalloonText: 'Fewer points.'. 
				
				(PolygonMorph
				vertices: triRight
				color: Color green
				borderWidth: 1
				borderColor: Color black)
				 setBalloonText: 'Twinkle fatter.'. 
				
				(PolygonMorph
				vertices: triLeft
				color: Color magenta
				borderWidth: 1
				borderColor: Color black)
				 setBalloonText: 'Twinkle thinner.'}.
	
	holder
		with: {#more. #less. #next. #prev}
		do: [:handle :which | handle
				on: #mouseDown
				send: #changeVertices:event:fromHandle:
				to: self
				withValue: which;
				
				on: #mouseMove
				send: #changeVertices:event:fromHandle:
				to: self
				withValue: which].
	^ handles addAll: holder