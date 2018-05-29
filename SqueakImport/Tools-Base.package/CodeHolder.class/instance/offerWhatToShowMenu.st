what to show
offerWhatToShowMenu
	"Offer a menu governing what to show"
	| builder menuSpec |
	builder := ToolBuilder default.
	menuSpec := builder pluggableMenuSpec new.
	self contentsSymbolQuints do: [:aQuint | aQuint == #-
		ifTrue: [menuSpec addSeparator]
		ifFalse: [
			| item |
			item := menuSpec add: (self perform: aQuint third) 
					target: self selector: aQuint second argumentList: #().
			item help: aQuint fifth.
		].
	].
	builder runModal: (builder open: menuSpec).