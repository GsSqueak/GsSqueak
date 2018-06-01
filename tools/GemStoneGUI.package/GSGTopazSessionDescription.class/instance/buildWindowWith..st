toolbuilder
buildWindowWith: builder

	^ builder pluggableDialogSpec new
		model: self;
		label: #windowTitle;
		extent: self initialExtent;
		spacing: 5;
		children: OrderedCollection new;
		yourself