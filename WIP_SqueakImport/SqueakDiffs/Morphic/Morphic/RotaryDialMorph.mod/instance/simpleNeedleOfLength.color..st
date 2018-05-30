needle graphics
simpleNeedleOfLength: aNumber color: aColor
	"we can make a simpler type needle with a curly arrow and no tail and then scale it to a length" 
| fancy smaller |
    
	fancy := Form extent: 100@500 depth: 32.
	fancy fillColor: Color white.
	fancy getCanvas
		fillRectangle: (20@40 extent: 60@60) color: aColor;
		fillOval: (-348@ -200 extent: 400@400) color: Color white;
		fillOval: (48@ -200 extent: 400@400) color: Color white;
		fillRectangle: (48@10 extent: 4@490) color: aColor.
	fancy replaceColor: Color white withColor: Color transparent.

	smaller := fancy magnify: fancy boundingBox by: (aNumber / fancy boundingBox height) smoothing: 2.
	^smaller asMorph.
