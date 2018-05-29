toolbuilder
buildButtonBarSpecWith: aBuilder
	
	| buttonBarSpec |
	buttonBarSpec := aBuilder pluggablePanelSpec new
		children: OrderedCollection new;
		layout: #horizontal;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 1 offset: 0;
			bottomFraction: 0 offset: self buttonBarHeight);
		yourself.
	
	buttonBarSpec children add: (aBuilder pluggableButtonSpec new
		model: self;
		action: #sendMail;
		label: #sendMailButtonLabel;
		yourself).
	
	buttonBarSpec children add: (aBuilder pluggableButtonSpec new
		model: self;
		action: #addAttachment;
		label: #addAttachmentButtonLabel;
		yourself).
		
	buttonBarSpec children add: (aBuilder pluggableButtonSpec new
		model: self;
		action: #removeAttachment;
		label: #removeAttachmentButtonLabel;
		yourself).
		
	^ buttonBarSpec