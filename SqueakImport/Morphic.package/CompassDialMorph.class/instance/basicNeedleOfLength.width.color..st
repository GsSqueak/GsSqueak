needle graphics
basicNeedleOfLength: nLength width: nWidth color: aColor
	"make a really trivial needle as a colored rhombus"
	| fancy |
    
	fancy := Form extent: nWidth@nLength depth: 32.
	fancy fillColor: Color transparent.
	fancy getCanvas asBalloonCanvas
		aaLevel: 4;
		drawPolygon: (Array with: (nWidth/ 2)@0 with: (nWidth)@( nLength / 2)  with:0@(nLength / 2) with: (nWidth/ 2)@0) fillStyle: aColor borderWidth: 1 borderColor: Color black;
		drawPolygon: (Array with: (nWidth)@( nLength / 2) with: (nWidth/ 2)@(nLength) with:0@(nLength / 2)  with: (nWidth)@( nLength / 2)) fillStyle: Color black borderWidth: 0 borderColor: Color black.

	^fancy asMorph.
