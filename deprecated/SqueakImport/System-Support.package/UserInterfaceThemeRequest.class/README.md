In order to be able to use a UserInterfaceTheme as a container of fairly arbitrary properties whilst making it seem like we are sending regular messages as a way of accessing those properties we can handle the dNU: and check the not understood message name against our property list. This is clever, devious, interesting and may confuse users until they get to see an explanation like this.

Answer nil or a value for the property specified by aMessage's #selector. Searching for the property proceeds by
	a) searching my dictionary for a key made up of an Association with a key of the class of the 'client' and a value of the message name. For example SimpleButtonMorph->borderColor
	b) searching again for a key made from the superclass(es) of the client - e.g. RectangleMorph->borderColor and then if required BorderedMorph->borderColor etc.
	c) if there is a linked theme, search it in the same manner.
	
As an extreme example, consider a basic theme with a linked theme specifically for buttons. 

	mySimpleButtonMorph borderColor

... would search the basic theme for SimpleButtonMorph->borderColor, the superclass equivalents as in b) above, then search the linked theme for SimpleButtonMorph->borderColor and, we hope, find something meaningful.