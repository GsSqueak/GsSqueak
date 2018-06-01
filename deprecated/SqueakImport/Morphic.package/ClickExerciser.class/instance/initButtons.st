initialization
initButtons
	| aButton positions |
	aButton := ThreePhaseButtonMorph checkBox. 
	positions := ((0@0) rect: aButton extent negated) corners + self center .
	buttons := positions collect: [ :p | ThreePhaseButtonMorph checkBox position: p; state: #on ] .
	buttons with: self allSelectors do: [ :b :s | b balloonText:  s asString ] .
	self removeAllMorphs .
	self addAllMorphs:  buttons .
