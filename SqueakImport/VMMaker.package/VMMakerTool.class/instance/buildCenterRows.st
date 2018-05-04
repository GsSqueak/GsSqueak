window construction
buildCenterRows
	| rows color1 color2 labelWidth longestLabel |
	color1 := Color blue veryMuchLighter.
	color2 := Color green veryMuchLighter.
	longestLabel := 'Path to generated sources:'.	"calculate labelWidth for acceptable results on varous images"
	labelWidth := (TextMorph new contents: longestLabel translated asText allBold) width.
	rows := Morph new color: Color transparent;
				 layoutPolicy: TableLayout new;
				 vResizing: #spaceFill;
				 extent: 550 @ (TextStyle defaultFont height * 16);
				 hResizing: #spaceFill;
				 listDirection: #topToBottom;
				borderStyle: (BorderStyle complexAltRaised width: 2);
				 wrapDirection: #none;
				 wrapCentering: #center;
				 yourself.
	rows
		addMorphBack: ((self
				entryRowWithLabel: 'Interpreter class name:'
				labelWidth: labelWidth
				balloonText: 'The name of the Interpreter class'
				getFieldText: #interpreterClassName
				setFieldText: #interpreterClassName:
				buttonLabel: 'Select'
				buttonAction: #interpreterListMenu
				buttonBalloonText: 'Choose Context interpreter for the classic interpreter VM, or Stack interpreter as basis for Cog and later development')
				color: color1).
	interpreterClassMorph := rows submorphs last submorphs second.

	rows
		addMorphBack: ((self
				entryRowWithLabel: 'Path to platforms code:'
				labelWidth: labelWidth
				balloonText: 'The directory where the platform source tree is found; can be edited in text field to the right. Default of {working directory}/src is strongly recommended'
				getFieldText: #platformsPathText
				setFieldText: #platformsPathText:
				buttonLabel: 'Find path'
				buttonAction: #findPlatformsPath
				buttonBalloonText: 'Choose the directory where you keep the platform specific code from a file dialogue')
				color: color2).
	platformPathMorph := rows submorphs last submorphs second.

	rows
		addMorphBack: ((self
				entryRowWithLabel: 'Platform name:'
				labelWidth: labelWidth
				balloonText: 'The platform name (as returned by Smalltalk platformName - unix, Mac OS, RISCOS, win32 etc); can be edited (in text field to the right) to cross generate'
				getFieldText: #platformNameText
				setFieldText: #platformNameText:
				buttonLabel: 'Find platform'
				buttonAction: #platformsListMenu
				buttonBalloonText: 'Choose from a list of known platforms. The default is this current platform.')
				color: color1).
	platformNameMorph := rows submorphs last submorphs second.

	rows
		addMorphBack: ((self
				entryRowWithLabel: 'Path to generated sources:'
				labelWidth: labelWidth
				balloonText: 'The directory where the built sources will be placed; can be edited in text field to the right. The default is strongly recommended; makefile alterations may be needed if you use a different path.'
				getFieldText: #sourcePathText
				setFieldText: #sourcePathText:
				buttonLabel: 'Clean out'
				buttonAction: #cleanoutSrcDir
				buttonBalloonText: 'Clean out all the files in the target directory, ready for a clean build')
				color: color2).
	generatedPathMorph := rows submorphs last submorphs second.

	^ rows