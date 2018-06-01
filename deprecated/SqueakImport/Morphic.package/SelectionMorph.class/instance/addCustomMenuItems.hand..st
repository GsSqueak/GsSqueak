halo commands
addCustomMenuItems: aMenu hand: aHandMorph
	"Add custom menu items to the menu"

	super addCustomMenuItems: aMenu hand: aHandMorph.
	aMenu addList: {
		#-.
		{'place into a row' translated. #organizeIntoRow}.
		{'place into a column' translated. #organizeIntoColumn}.
		#-.
		{'align left edges' translated. #alignLeftEdges}.
		{'align top edges' translated. #alignTopEdges}.
		{'align right edges' translated. #alignRightEdges}.
		{'align bottom edges' translated. #alignBottomEdges}.
		#-.
		{'align centers vertically' translated. #alignCentersVertically}.
		{'align centers horizontally' translated. #alignCentersHorizontally}.
		#-.
		{'distribute vertically' translated. #distributeVertically}.
		{'distribute horizontally' translated. #distributeHorizontally}.
		}


