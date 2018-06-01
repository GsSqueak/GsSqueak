right side
clockOn: aDockingBar 
	aDockingBar 
		addMorphBack: (ClockMorph new
			font: self fontToUse;
			color: self colorToUse;
			show24hr: self class twentyFourHourClock;
			showSeconds: self class showSecondsInClock;
			yourself);
		addDefaultSpace