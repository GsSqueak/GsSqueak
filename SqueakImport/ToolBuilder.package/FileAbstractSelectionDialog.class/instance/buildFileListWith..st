toolbuilder
buildFileListWith: builder 
	| listSpec |
	listSpec := builder pluggableMultiColumnListSpec new.
	listSpec
		 model: self ;
		 list: #fileList ;
		 getIndex: #fileListIndex ;
		 setIndex: #fileListIndex: ;
		 menu: nil ;
		 keyPress: nil ;
		 frame:
		(self
			frameOffsetFromTop:0
			fromLeft: 0
			width: 1
			bottomFraction: 1);
		hScrollBarPolicy: #always .
	^listSpec