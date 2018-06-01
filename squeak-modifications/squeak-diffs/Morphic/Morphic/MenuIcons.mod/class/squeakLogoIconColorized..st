accessing - icons
squeakLogoIconColorized: aColor

	^ self squeakLogoIcon
		collectColors: [:c | aColor alpha: c alpha]