A UserInterfaceTheme is a dictionary of preferred visual-properties; colors, borderStyles, borderWidths, fonts, forms, etc. used to color and style the IDE.

Accessing The Theme
To access the proper UserInterfaceTheme instance for an object, send it #userInterfaceTheme.  The default implementation on Object provides the one instance of that is in-use by the IDE at the current time.

Customizing The Theme
We can ask the userInterfaceTheme for the value of any visual-property, by name:

	mySystemWindow userInterfaceTheme closeBoxImage

Initially, the above answers nil, which causes the legacy code to use whatever default it's always used.  To override various visual-properties of any kind of object, the #set: onAny: to: message can be used.  For example, 

	myUserInterfaceTheme
		set: #closeBoxImage 
		for: SystemWindow
		to: MenuIcons smallCancelIcon

Alternatively, values may be derived based on other values in the theme, as in:

	myUserInterfaceTheme
		set: #color 
		for: FillInTheBlankMorph
		to: { MenuMorph->#color.  #twiceDarker }

Now, the accessing expression, above, will answer will answer MenuIcons' smallCancelIcon instead of nil.  SystemWindow's code can be changed to use the expression above to access elements of the theme.

Upgrading Legacy Code
Following the introduction of this class, various client code all around the system must be modified to access it.  This variety of legacy code uses a variety of methods to specify their visual properties:

	1) a hard-coded values.
	2) a values derived from some other value.
	3) providing local storage for a settable value which can be nil.
	4) providing local storage for a settable value which is expected to always have a particular valid value (never nil).

The requirement, for each case, is to let the value be overridden.  

The solution for each of the above should be handled respectively to the above list, as follows:

	1) Check the userInterfaceTheme, if that property returns nil, use the legacy hard-coded value.  (see example: SystemWindow>>#createCloseBox).
	2) Nothing to do -- simply perform the same derivation on the result of (1).
	3) Check the local storage, if present, use it.  If nil, then check the userInterfaceTheme, if it has this property present, use it, else return nil.
	4) Check the userInterfaceTheme, if the property is not nil, use it, otherwise use the local value.

Tool Support
If a new access to #userInterfaceTheme is added to the code, be sure to add the property and its description to the #themeSettings for that class.  See implementors of #themeSettings for examples.