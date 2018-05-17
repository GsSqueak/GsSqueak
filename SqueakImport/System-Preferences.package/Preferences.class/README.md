A general mechanism to store preference choices.  The default setup treats any symbol as a potential boolean flag; flags unknown to the preference dictionary are always answered as false.  

	To open the control panel:
		PreferenceBrowser open
	To read how to use the panel (and how to make a preference be per-project):
		 Preferences giveHelpWithPreferences

All messages are on the class side.  There are two kinds of preference definition, preference pragmas (which are preferred) and  preferences local to Preferences.

Preference Pragmas
Preferences can be local to a class or system of classes using preference pragmas.  Look at senders of #preference:category:description:type: and #preference:categoryList:description:type: for examples:
	(self systemNavigation browseAllSelect:
		[:m|
		#(preference:category:description:type: preference:categoryList:description:type:) anySatisfy:
			[:s| (m pragmaAt: s) notNil]])
With a preference pragma, the preference is typically kept in a class variable, local to the class whose method(s) contain(s) the pragma.  Good style is to put the preference pragma in the accessor for the variable; see for example BitBlt class>>#subPixelRenderColorFonts. The pragma serves to declare the preference to Preferences.


Preference-local Preferences
To query a a preference:
	Preferences logDebuggerStackToFile
or some people prefer the more verbose
	Preferences valueOfFlag: #logDebuggerStackToFile

You can make up a new preference any time.  Do not define a new message in Preferences class. Accessor methods are compiled automatically when you add a preference, either as as illustrated below, or by using 

To add a non-pragma preference (e.g. in the Postscript of a fileout):
	Preferences
		addPreference: #samplePreference
		categories: #(general browsing)
		default: true
		balloonHelp: 'This is an example of a preference added by a do-it'
		projectLocal: false
		changeInformee: nil
		changeSelector: nil.

To change a preference programatically:
	Preferences disable: #logDebuggerStackToFile.
Or to turn it on,
	Preferences enable: #logDebuggerStackToFile.
