boxes
boxesAndColorsAndSelectors

	^{
		{self zoomBoxArea. Color blue. #toggleZoom}.
		{self appViewBoxArea. Color yellow. #goAppView}.
		{self factoryViewBoxArea. Color red. #goFactoryView}.
		{self fullViewBoxArea. Color cyan. #goFullView}.
		{self normalEntryBoxArea. Color white. #goNormalProjectEntry}.
	}