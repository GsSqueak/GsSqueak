toolbuilder
buildCodeProvenanceButtonWith: builder
	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
		model: self;
		label: #codePaneProvenanceString;
		changeLabelWhen: #contents;
		style: #menuButton;
		action: #offerWhatToShowMenu;
		help: 'Governs what view is shown in the code pane.  Click here to change the view';
		margin: (5@0 corner: 0@0).
	^buttonSpec