*Morphic-MorphicExtras-windows & flaps menu
formulateFlapsMenu: aMenu
	"Fill aMenu with appropriate content"

	aMenu addTitle: 'flaps' translated.
	aMenu addStayUpItem.
	Preferences classicNavigatorEnabled ifTrue:
		[aMenu
			addUpdating: #navigatorShowingString
			enablementSelector: #enableProjectNavigator
			target: Preferences
			selector: #toggle: 
			argumentList: #(showProjectNavigator).
		aMenu balloonTextForLastItem: (Preferences preferenceAt: #showProjectNavigator) helpString translated].

	Flaps sharedFlapsAllowed
		ifTrue:
			[self fillIn: aMenu from:
				{{#suppressFlapsString.
					{Project current. #toggleFlapsSuppressed}.
				'Whether prevailing flaps should be shown in the project right now or not.'}}.

			aMenu addUpdating: #automaticFlapLayoutString  target: Preferences selector: #toggle: argumentList: #(automaticFlapLayout).
			aMenu balloonTextForLastItem: (Preferences preferenceAt: #automaticFlapLayout) helpString translated.

			aMenu addLine.
			Flaps addIndividualGlobalFlapItemsTo: aMenu].

     self fillIn: aMenu from: {
			nil.

               {'make a new flap'.
			{Flaps. #addLocalFlap}.
			'Create a new flap.  You can later make it into a shared flap is you wish.'}.

			nil.}.
	Flaps sharedFlapsAllowed
		ifTrue:
			[aMenu addWithLabel: 'put shared flaps on bottom' translated enablementSelector: #showSharedFlaps
				target: Flaps selector: #sharedFlapsAlongBottom argumentList: #().
			aMenu balloonTextForLastItem: 'Group all the standard shared flaps along the bottom edge of the screen' translated.

			self fillIn: aMenu from: {
				{'destroy all shared flaps'.
				{Flaps. #disableGlobalFlaps}.
				'Destroy all the shared flaps and disable their use in all projects.'}}]
		ifFalse:
			[aMenu add: 'install default shared flaps' translated target: Flaps action: #enableGlobalFlaps.
			aMenu balloonTextForLastItem: 'Create the default set of shared flaps' translated.
			aMenu add: 'install etoy flaps' translated target: Flaps action: #enableEToyFlaps.
			aMenu balloonTextForLastItem: 'Put up the default etoy flaps: a custom Suplies flap and the Navigator flap' translated.
			aMenu addLine].

	self fillIn: aMenu from: {
			nil.
			{'about flaps...'.
			{Flaps . #explainFlaps}.
			'Gives a window full of details about how to use flaps.'}}