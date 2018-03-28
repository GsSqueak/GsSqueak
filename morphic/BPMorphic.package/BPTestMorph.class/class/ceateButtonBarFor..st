as yet unclassified
ceateButtonBarFor: aTestMorph
  | commitBtn abortBtn continueBtn exitBtn |
  commitBtn := (SimpleButtonMorph newWithLabel: 'commit')
    openInWorld;
    target: aTestMorph;
    actionSelector: 'commit'.
  abortBtn := (SimpleButtonMorph newWithLabel: 'abort')
    openInWorld;
    left: commitBtn right;
    target: aTestMorph;
    actionSelector: 'abort'.
  continueBtn := (SimpleButtonMorph newWithLabel: 'continue')
    openInWorld;
    left: abortBtn right;
    target: aTestMorph;
    actionSelector: 'continue'.
  exitBtn := (SimpleButtonMorph newWithLabel: 'exit')
    openInWorld;
    left: continueBtn right;
    target: aTestMorph;
    actionSelector: 'die'