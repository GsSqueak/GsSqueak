as yet unclassified
checkForRebuild
	| lastScreenMode flapsSuppressed |

	lastScreenMode := DisplayScreen displayIsFullScreen.
	flapsSuppressed := Project current flapsSuppressed.
	((self valueOfProperty: #currentNavigatorVersion) = self currentNavigatorVersion
			and: [lastScreenMode = self inFullScreenMode
			and: [flapsSuppressed = self inFlapsSuppressedMode
			and: [(self valueOfProperty: #includeSoundControlInNavigator) = 
						Preferences includeSoundControlInNavigator]]]) ifFalse: [
		self 
			setProperty: #includeSoundControlInNavigator 
			toValue: Preferences includeSoundControlInNavigator.
		self setProperty: #flapsSuppressedMode toValue: flapsSuppressed.
		self setProperty: #showingFullScreenMode toValue: lastScreenMode.
		self setProperty: #currentNavigatorVersion toValue: self currentNavigatorVersion.
		self removeAllMorphs.
		self addButtons.
	].
