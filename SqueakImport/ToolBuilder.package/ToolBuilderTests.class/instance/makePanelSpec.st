tests-panel
makePanelSpec
	| spec |
	spec := builder pluggablePanelSpec new.
	spec name: #panel.
	spec model: self.
	spec children: #getChildren.
	^spec