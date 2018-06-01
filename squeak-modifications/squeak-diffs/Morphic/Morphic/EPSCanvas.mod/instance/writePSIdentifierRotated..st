private
writePSIdentifierRotated: rotateFlag 
	target
		print: '%!PS-Adobe-2.0 EPSF-2.0';
		cr.
	rotateFlag 
		ifTrue: 
			[target
				print: '%%BoundingBox: ';
				write: (0 @ 0 corner: psBounds corner transposed) rounded;
				cr]
		ifFalse: 
			[target
				print: '%%BoundingBox: ';
				write: psBounds rounded;
				cr].
	target
		print: '%%Title: ';
		print: self topLevelMorph externalName;
		cr.
	target
		print: '%%Creator: ';
		print: Utilities authorName;
		cr.
	target
		print: '%%CreationDate: ';
		print: Date today asString;
		space;
		print: Time now asString;
		cr.
		
	"is this relevant?"
	target print: '%%Orientation: ';
		 print: (rotateFlag ifTrue: [ 'Landscape' ] ifFalse: [ 'Portrait' ]);
		cr.
	target print: '%%DocumentFonts: (atend)'; cr.
	target
		print: '%%EndComments';
		cr

	"	self writeEPSPreviewImageFor: topLevelMorph."

	"	target print: '%%EndProlog'; cr."