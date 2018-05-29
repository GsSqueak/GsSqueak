toolbuilder
buildDefaultBrowserWith: builder
	"assemble the spec for a full 5-pane browser - package, category, class, protocol & message lists, build it and return the built but not opened morph.
	the build-but-don't-open phase is factored out to support the prototypicalToolWindow facility"

	"PackagePaneBrowser fullOnClass: Browser."

	| max windowSpec |
 	max := self wantsOptionalButtons ifTrue:[0.42] ifFalse:[0.5].
	windowSpec := self buildWindowWith: builder specs: {
		(0@0 corner: 0.15@max) -> [self buildPackageListWith: builder].
		(0.15@0 corner: 0.35@max) -> [self buildSystemCategoryListWith: builder].
		(self classListFrame: max fromLeft: 0.35 width: 0.25) -> [self buildClassListWith: builder].
		(self switchesFrame: max fromLeft: 0.35 width: 0.25) -> [self buildSwitchesWith: builder].
		(0.6@0 corner: 0.75@max) -> [self buildMessageCategoryListWith: builder].
		(0.75@0 corner: 1@max) -> [self buildMessageListWith: builder].
		(0@max corner: 1@1) -> [self buildCodePaneWith: builder].
	}.
	self setMultiWindowFor:windowSpec.

	^builder build: windowSpec