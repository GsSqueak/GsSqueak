dial drawing
drawTickRadius: radius length: length thickness: thickness color: color angle: angle  onCanvas: canvas
"angles clockwise from North in degrees"

	| newPt cell pts rads |
	rads := (90 -  angle) degreesToRadians.
   	pts := {radius. radius + length + 0.5} collect: [ :rho |
		cell := (rho * rads cos) rounded @ (rho * rads sin) rounded negated.
		newPt := dialCenter * 2 + cell.
	].
	canvas line: pts first to: pts second width: thickness color: color
