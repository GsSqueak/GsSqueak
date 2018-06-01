actions
apply
	"Apply this theme to all affected objects. Let classes decide on how to iterate and call their instances."

	ignoreApply == true ifTrue: [^ self].

	UserInterfaceTheme current: self.

	self fixFontsAndScaleAround: [

		self class clientClassesToReapply in: [:cc |
			cc do: [:eachClass | eachClass applyUserInterfaceTheme].
			Cursor wait showWhile: [
			
			    "allObjectsDo is not yet supported in GsSqueak"
			    
				"SystemNavigation default allObjectsDo: [:o |
					((cc includes: o class)
						and: [o canApplyUserInterfaceTheme])
							ifTrue: [o applyUserInterfaceTheme]] " ]].
	]. "fix fonts"
			
	"Project current restoreDisplay."
