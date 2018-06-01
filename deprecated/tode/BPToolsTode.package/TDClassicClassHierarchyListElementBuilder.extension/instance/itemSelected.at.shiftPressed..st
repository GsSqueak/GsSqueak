*BPToolsTode
itemSelected: listElement at: index shiftPressed: shiftPressed
  | aspect classDef itemAttribute classDefClientElement stonArray instClassClientElement environmentClientElement classProtocolClientElement |
  index ifNil: [ ^ nil ].
  index > listElement itemCache size
    ifTrue: [ ^ nil ].
  itemAttribute := listElement itemCache at: index.
  classDef := itemAttribute object.
  aspect := itemAttribute aspect.
  TDClassDefinition
    selectClassNamed: classDef className
    topez: listElement topez.
  classDefClientElement := classDef
    clientElementUsing:
      ((TDEditorSpec topez: listElement topez editorAspect: #'classDefinition')
        windowName: #'classicClassDef';
        windowLocation: #'classicClassDef';
        yourself).
  instClassClientElement := {classDef.
  {{#'instance'.
  #'browseInstanceProtocol:'.
  'instance'.
  'view instance-side methods'.
  true}.
  {#'class'.
  #'browseClassProtocol:'.
  'class'.
  'view class-side methods'.
  false}}}
    clientElementUsing:
      ((TDEditorSpec topez: listElement topez editorAspect: #'buttonBar')
        windowName: #'classicClassButtonBar';
        windowLocation: #'classicClassButtonBar';
        yourself).
  environmentClientElement := {classDef.
  {{#'0'.
  #'browseEnvironment0:'.
  '0'.
  'view methods of environment 0'.
  true}.
  {#'7'.
  #'browseEnvironment7:'.
  '7'.
  'view methods of environment 7'.
  false}}}
    clientElementUsing:
      ((TDEditorSpec topez: listElement topez editorAspect: #'buttonBar')
        windowName: #'environmentButtonBar';
        windowLocation: #'environmentButtonBar';
        yourself).
  classProtocolClientElement := classDef
    clientElementUsing:
      ((TDEditorSpec topez: listElement topez editorAspect: #'classicProtocolList')
        windowName: #'classicProtocolList';
        windowLocation: #'classicProtocol';
        selectionIndex: 1;
        yourself).
  stonArray := {#'editStonElement:'.
  classDefClientElement.
  #'editStonElement:'.
  classProtocolClientElement.
  #'editStonElement:'.
  instClassClientElement.
  #'editStonElement:'.
  environmentClientElement}.
  (theWindowName ~~ #'hierarchy' or: [ selectedClass ~~ classDef theClass ])
    ifTrue: [ 
      | hierarchyClientElement |
      hierarchyClientElement := classDef
        clientElementUsing:
          ((TDEditorSpec topez: listElement topez editorAspect: #'classicHierarchyList')
            windowName: #'hierarchy';
            yourself).
      selectedClass := classDef theClass.
      stonArray
        addAll:
          {#'editStonElement:'.
          hierarchyClientElement} ].
  stonArray addAll: (self enableDisableMenuItems: classDef).
  ^ listElement objectSerializer toString: stonArray