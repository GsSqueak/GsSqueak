flaps registry
defaultsQuadsDefiningStackToolsFlap
	"Answer a structure defining the items on the default system Stack Tools flap.
	previously in quadsDefiningStackToolsFlap"

	^ {
	{#StackMorph. 		#authoringPrototype.	'Stack' translatedNoop. 				'A multi-card data base'	translatedNoop}.
	{#StackMorph.		#stackHelpWindow.		'Stack Help'	translatedNoop.		'Some hints about how to use Stacks' translatedNoop}.
	{#TextMorph	.		#authoringPrototype.	'Simple Text' translatedNoop.		'Text that you can edit into anything you wish' translatedNoop}.
	{#TextMorph	.		#fancyPrototype.		'Fancy Text' translatedNoop. 		'A text field with a rounded shadowed border, with a fancy font.' translatedNoop}.
	{#ScrollableField.	#newStandAlone.		'Scrolling Text' translatedNoop.		'Holds any amount of text; has a scroll bar' translatedNoop}.
	{#ScriptableButton.	#authoringPrototype.	'Scriptable Button' translatedNoop.	'A button whose script will be a method of the background Player' translatedNoop}.
	{#StackMorph.		#previousCardButton. 	'Previous Card' translatedNoop. 		'A button that takes the user to the previous card in the stack' translatedNoop}.
	{#StackMorph.		#nextCardButton.		'Next Card' translatedNoop.			'A button that takes the user to the next card in the stack' translatedNoop} } asOrderedCollection
