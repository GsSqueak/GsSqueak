widget classes
windowClassFor: aSpec 
	^ aSpec multiWindowStyle caseOf: {
		[] -> [PluggableSystemWindow].
		[#labelButton] -> [PluggableSystemWindowWithLabelButton]}
		 otherwise: [PluggableSystemWindowWithLabelButton]