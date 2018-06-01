tests-button
makeButtonSpec
	| spec |
	spec := builder pluggableButtonSpec new.
	spec name: #button.
	spec model: self.
	spec label: #getLabel.
	spec color: #getColor.
	spec state: #getState.
	spec enabled: #getEnabled.
	^spec