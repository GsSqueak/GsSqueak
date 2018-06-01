toolbuilder
buildWith: builder
	"Create a Browser that lets you type part of a selector, shows a list of selectors, shows the classes of the one you chose, and spawns a full browser on it.  Answer the window
	SelectorBrowser new open "
	| windowSpec |
	selectorIndex := classListIndex := 0.
	windowSpec := 	self buildWindowWith: builder specs: {
		(0@0 corner: 0.5@0.14) -> [self buildEditViewWith: builder].
		(0@0.14 corner: 0.5@0.6) -> [self buildMessageListWith: builder].
		(0.5@0 corner: 1@0.6) -> [self buildClassListWith: builder].
		(0@0.6 corner: 1@1) -> [self buildExamplePaneWith: builder].
	}.
	^builder build: windowSpec