toolbuilder
buildCodePaneWith: builder

	| textSpec top buttonSpec annoSpec utilityButtons transactionButtons |
	self wantsOptionalButtons ifTrue: [
		top := builder pluggablePanelSpec new.
		top children: OrderedCollection new.
		buttonSpec := self buildOptionalButtonsWith: builder.
		buttonSpec frame: self optionalButtonsFrame.
		top children add: buttonSpec].
	textSpec := builder pluggableCodePaneSpec new.
	textSpec 
		model: self;
		getText: #contents; 
		setText: #contents:notifying:;
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	self wantsFooter ifTrue: [
		top ifNil: [
			top := builder pluggablePanelSpec new.
			top children: OrderedCollection new].
		annoSpec := self buildAnnotationPaneWith: builder.
		annoSpec frame: (self footerFrameFromLeft: 0 width: 0.5).
		utilityButtons := self buildUtilityButtonsWith: builder.
		utilityButtons frame: (self footerFrameFromLeft: 0.5 width: 0.1).
		transactionButtons := self buildTransactionButtonsWith: builder.
		transactionButtons frame: (self footerFrameFromLeft: 0.6 width: 0.4).
		top children addAll: {annoSpec . utilityButtons . transactionButtons}].
	top ifNotNil: [
		textSpec frame: self contentsFrame.
		top children add: textSpec].
	^ top ifNil: [textSpec]