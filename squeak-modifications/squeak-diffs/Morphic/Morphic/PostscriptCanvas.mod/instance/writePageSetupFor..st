private
writePageSetupFor: aMorph 

	target print: '%%BeginPageSetup'; cr.
	target print: 'gsave'; cr.
	target translate: aMorph bounds origin negated.
	target print: '%%EndPageSetup';
		 cr