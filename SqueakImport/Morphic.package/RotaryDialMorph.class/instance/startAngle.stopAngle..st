accessing
startAngle: angle1 stopAngle: angle2
	"set the start and stop angles of the dial; we modulo them with 360 to keep things logical"
	startAngle := angle1 \\ 360.
	stopAngle := angle2 \\ 360.
	
	"if the two angles end up the same then we will guess that in fact the user wants a full-rotation rather than nothing. "
	startAngle = stopAngle ifTrue:[
		angle1 < angle2 ifTrue:[stopAngle := (startAngle +359.9) \\360].
		angle2 < angle1 ifTrue:[stopAngle := (startAngle - 359.9) \\360]]
	"if the input angles actually were the same then the user has made a mistake and we can't really solve it. Install a better user?"