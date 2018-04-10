testing
handlesMouseMove: evt 
	^ self wantsEveryMouseMove == true
		or: [((((mouseMoveRecipient notNil
								and: [mouseMoveSelector notNil])
							and: [evt hand hasSubmorphs not])
						and: [evt anyButtonPressed])
					and: [evt hand mouseFocus notNil])
				and: [evt hand mouseFocus eventHandler == self]]