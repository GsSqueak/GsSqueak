widgets required
buildPluggableMenu: menuSpec 
	"Just a very simple mapping to selection menu. It assumes that all item specs have the same receiver."
	
	| menu |
	menu := CustomMenu new.
	menuSpec items do: [:ea |
		menu
			add: ea label
			target: ea action receiver
			selector: ea action selector
			argumentList: ea action arguments.
		ea separator ifTrue: [menu addLine]].
	^ menu