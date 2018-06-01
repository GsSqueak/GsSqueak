initialization
newPages: pageList
	"Replace all my pages with the given list of BookPageMorphs.  After this call, currentPage may be invalid."

	pages := pages species new.
	pages addAll: pageList