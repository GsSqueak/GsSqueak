widget classes
windowClassFor: aSpec
	^aSpec multiWindowStyle
		caseOf:
		{	[nil]				->	[PluggableSystemWindow].
			[#labelButton]	->	[PluggableSystemWindowWithLabelButton] }
		otherwise:				[PluggableSystemWindowWithLabelButton]