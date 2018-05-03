menu
uncachePageSorter
  self pages do: [ :aPage | aPage removeProperty: #'cachedThumbnail' ]