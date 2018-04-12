toolbuilder
buildPreviewPaneWith: builder 
	"Build the preview panel"
	^ builder pluggablePanelSpec new wantsResizeHandles: true;
		 children: {builder pluggableInputFieldSpec new model: self;
			 getText: #filename;
			 readOnly: true;
			 indicateUnacceptedChanges: false;
			 font: self filenameFont;
			
			frame: (LayoutFrame
					fractions: (0 @ 0 corner: 1 @ 0)
					offsets: (0 @ 0 corner: 0 @ self filenameHeight));
			 yourself. builder pluggableTextSpec new model: self;
			 getText: #previewText;
			 askBeforeDiscardingEdits: false;
			 indicateUnacceptedChanges: false;
			 softLineWrap: false;
			
			frame: (LayoutFrame
					fractions: (0 @ 0 corner: 1 @ 0.75)
					offsets: (0 @ self filenameHeight corner: 0 @ 0));
			 yourself. builder pluggableTextSpec new model: self;
			 getText: #copyright;
			 readOnly: true;
			 indicateUnacceptedChanges: false;
			
			frame: (LayoutFrame
					fractions: (0 @ 0.75 corner: 1 @ 1));
			 yourself};
		 yourself