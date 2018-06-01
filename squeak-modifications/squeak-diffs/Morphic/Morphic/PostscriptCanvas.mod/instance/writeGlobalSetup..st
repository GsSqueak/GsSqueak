private
writeGlobalSetup: rotateFlag 
	target print: '%%EndProlog';
		 cr.
	target print: '%%BeginSetup';
		 cr.
	target print: '% initialScale: ';
		 write: initialScale;
		 cr.
	target print: '% pageBBox: '; write: self pageBBox; cr.
	
	target print: '% pageOffset';
		 cr.
	target translate: self pageOffset.
	rotateFlag
		ifTrue: ["no translate needed for 0,0 = upper LH corner of page"
			target print: '90 rotate';
				 cr;
				 print: '0 0 translate';
				 cr]
		ifFalse: [target write: 0 @ topLevelMorph height * initialScale;
				 print: ' translate';
				 cr].
	target print: '% flip';
		 cr.
	target scale: initialScale @ initialScale negated;
		 print: ' [ {true setstrokeadjust} stopped ] pop';
		 cr.
	target print: '%%EndSetup';
		 cr