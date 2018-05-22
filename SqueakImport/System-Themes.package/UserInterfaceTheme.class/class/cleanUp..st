initialize-release
cleanUp: aggressive

	aggressive ifTrue: [
		All := nil.
		SqueakTheme create; createDuller.
		SolarizedTheme createDark; createLight.
		MonokaiTheme createDark.
		CommunityTheme createDark].