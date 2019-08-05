Class {
	#name : #VisitorClassGenerator,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'visitorName',
		'root'
	],
	#category : #'Badetitou-Utils'
}

{ #category : #generating }
VisitorClassGenerator >> createVisitorClass [
	^ visitorName asClass
]

{ #category : #generating }
VisitorClassGenerator >> generateVisitor [
	| visitorClass |
	visitorClass := self createVisitorClass.
	self root withAllSubclasses do: [ :aClass | self generateVisitorOf: aClass in: visitorClass]
]

{ #category : #generating }
VisitorClassGenerator >> generateVisitorOf: aClass in: visitorClass [
	| selector |
	aClass = self root
		ifFalse: [ visitorClass class
				compile:
					'visit' , aClass name , ': a' , aClass name
						,
							'
	^ self visit' , aClass superclass name , ': a' , aClass name
				classified: 'generated' ]
		ifTrue: [ visitorClass class
				compile:
					'visit' , aClass name , ': a' , aClass name
						,
							'
	^ self subclassResponsibility'
				classified: 'generated' ].
	selector := aClass class compile: 'accept: a', self visitorName, '
	^ a', self visitorName, ' visit', aClass name, ': self' classified: '*', self packageName, '-generated'.
]

{ #category : #accessing }
VisitorClassGenerator >> packageName [
	^ packageName
]

{ #category : #accessing }
VisitorClassGenerator >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
VisitorClassGenerator >> root [
	"Must be the root class for your Visitor"

	^ root
]

{ #category : #accessing }
VisitorClassGenerator >> root: anObject [
	root := anObject
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNAction: aCSNAction [
	^ self visitCSNOriginedEntity: aCSNAction
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNActionAppel: aCSNActionAppel [
	^ self visitCSNAction: aCSNActionAppel
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNActionService: aCSNActionService [
	^ self visitCSNAction: aCSNActionService
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNAttribute: aCSNAttribute [
	^ self visitCSNOriginedEntity: aCSNAttribute
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNAutoComplete: aCSNAutoComplete [
	^ self visitCSNInput: aCSNAutoComplete
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNBusinessPage: aCSNBusinessPage [
	^ self visitCSNContainer: aCSNBusinessPage
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNChart: aCSNChart [
	^ self visitCSNContainer: aCSNChart
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNClickHandler: aCSNClickHandler [
	^ self visitCSNAction: aCSNClickHandler
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNContainer: aCSNContainer [
	^ self visitCSNWidget: aCSNContainer
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNCoreCellWidth: aCSNCoreCellWidth [
	^ self visitCSNAttribute: aCSNCoreCellWidth
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNCoreColSpan: aCSNCoreColSpan [
	^ self visitCSNAttribute: aCSNCoreColSpan
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNCoreHorizontalAlignement: aCSNCoreHorizontalAlignement [
	^ self visitCSNAttribute: aCSNCoreHorizontalAlignement
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNCoreRowSpan: aCSNCoreRowSpan [
	^ self visitCSNAttribute: aCSNCoreRowSpan
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNCoreVerticalAlignement: aCSNCoreVerticalAlignement [
	^ self visitCSNAttribute: aCSNCoreVerticalAlignement
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNDialog: aCSNDialog [
	^ self visitCSNContainer: aCSNDialog
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNDynamicFieldset: aCSNDynamicFieldset [
	^ self visitCSNAttribute: aCSNDynamicFieldset
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNGroupFieldset: aCSNGroupFieldset [
	^ self visitCSNAttribute: aCSNGroupFieldset
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNHTML: aCSNHTML [
	^ self visitCSNContainer: aCSNHTML
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNInput: aCSNInput [
	^ self visitCSNContainer: aCSNInput
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLBorderLayout: aCSNLBorderLayout [
	^ self visitCSNLLayout: aCSNLBorderLayout
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLCell: aCSNLCell [
	^ self visitCSNWidget: aCSNLCell
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLGridLayout: aCSNLGridLayout [
	^ self visitCSNLLayout: aCSNLGridLayout
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLHorizontalLayout: aCSNLHorizontalLayout [
	^ self visitCSNLLayout: aCSNLHorizontalLayout
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLLayout: aCSNLLayout [
	^ self visitCSNOriginedEntity: aCSNLLayout
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLVerticalLayout: aCSNLVerticalLayout [
	^ self visitCSNLLayout: aCSNLVerticalLayout
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLeaf: aCSNLeaf [
	^ self visitCSNWidget: aCSNLeaf
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNLightFieldset: aCSNLightFieldset [
	^ self visitCSNAttribute: aCSNLightFieldset
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNModal: aCSNModal [
	^ self visitCSNVariableAttribute: aCSNModal
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNModel: aCSNModel [
	^ self visitCSNVariableAttribute: aCSNModel
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNOpen: aCSNOpen [
	^ self visitCSNVariableAttribute: aCSNOpen
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNOriginedEntity: aCSNOriginedEntity [
	^ self subclassResponsibility
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNPage: aCSNPage [
	^ self visitCSNContainer: aCSNPage
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNProgressBar: aCSNProgressBar [
	^ self visitCSNContainer: aCSNProgressBar
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNRichTextArea: aCSNRichTextArea [
	^ self visitCSNInput: aCSNRichTextArea
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNService: aCSNService [
	^ self visitCSNOriginedEntity: aCSNService
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNServiceAPI: aCSNServiceAPI [
	^ self visitCSNOriginedEntity: aCSNServiceAPI
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNSplitButton: aCSNSplitButton [
	^ self visitCSNInput: aCSNSplitButton
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNSwitch: aCSNSwitch [
	^ self visitCSNInput: aCSNSwitch
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIAbsoluteHeight: aCSNUIAbsoluteHeight [
	^ self visitCSNUIHeight: aCSNUIAbsoluteHeight
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIAbsoluteWidth: aCSNUIAbsoluteWidth [
	^ self visitCSNUIWidth: aCSNUIAbsoluteWidth
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIAlt: aCSNUIAlt [
	^ self visitCSNAttribute: aCSNUIAlt
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIButton: aCSNUIButton [
	^ self visitCSNContainer: aCSNUIButton
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUICanvas: aCSNUICanvas [
	^ self visitCSNContainer: aCSNUICanvas
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIClass: aCSNUIClass [
	^ self visitCSNAttribute: aCSNUIClass
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIDisabled: aCSNUIDisabled [
	^ self visitCSNAttribute: aCSNUIDisabled
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIFieldset: aCSNUIFieldset [
	^ self visitCSNUIPanel: aCSNUIFieldset
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIHeading1: aCSNUIHeading1 [
	^ self visitCSNLeaf: aCSNUIHeading1
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIHeading2: aCSNUIHeading2 [
	^ self visitCSNLeaf: aCSNUIHeading2
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIHeading3: aCSNUIHeading3 [
	^ self visitCSNLeaf: aCSNUIHeading3
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIHeading4: aCSNUIHeading4 [
	^ self visitCSNLeaf: aCSNUIHeading4
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIHeading5: aCSNUIHeading5 [
	^ self visitCSNLeaf: aCSNUIHeading5
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIHeading6: aCSNUIHeading6 [
	^ self visitCSNLeaf: aCSNUIHeading6
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIHeight: aCSNUIHeight [
	^ self visitCSNAttribute: aCSNUIHeight
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIId: aCSNUIId [
	^ self visitCSNAttribute: aCSNUIId
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIImage: aCSNUIImage [
	^ self visitCSNLeaf: aCSNUIImage
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInput: aCSNUIInput [
	^ self visitCSNLeaf: aCSNUIInput
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	^ self visitCSNUIInput: aCSNUIInputCheckbox
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputColor: aCSNUIInputColor [
	^ self visitCSNUIInput: aCSNUIInputColor
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputDate: aCSNUIInputDate [
	^ self visitCSNUIInput: aCSNUIInputDate
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputDatetimeLocal: aCSNUIInputDatetimeLocal [
	^ self visitCSNUIInput: aCSNUIInputDatetimeLocal
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputEmail: aCSNUIInputEmail [
	^ self visitCSNUIInputText: aCSNUIInputEmail
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputFile: aCSNUIInputFile [
	^ self visitCSNUIInput: aCSNUIInputFile
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputMonth: aCSNUIInputMonth [
	^ self visitCSNUIInput: aCSNUIInputMonth
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputNumber: aCSNUIInputNumber [
	^ self visitCSNUIInput: aCSNUIInputNumber
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputPassword: aCSNUIInputPassword [
	^ self visitCSNUIInputText: aCSNUIInputPassword
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputRadio: aCSNUIInputRadio [
	^ self visitCSNUIInput: aCSNUIInputRadio
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputRange: aCSNUIInputRange [
	^ self visitCSNUIInput: aCSNUIInputRange
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputReset: aCSNUIInputReset [
	^ self visitCSNUIInput: aCSNUIInputReset
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputSearch: aCSNUIInputSearch [
	^ self visitCSNUIInput: aCSNUIInputSearch
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputSubmit: aCSNUIInputSubmit [
	^ self visitCSNUIInput: aCSNUIInputSubmit
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputTel: aCSNUIInputTel [
	^ self visitCSNUIInput: aCSNUIInputTel
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputText: aCSNUIInputText [
	^ self visitCSNUIInput: aCSNUIInputText
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputTime: aCSNUIInputTime [
	^ self visitCSNUIInput: aCSNUIInputTime
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputUrl: aCSNUIInputUrl [
	^ self visitCSNUIInput: aCSNUIInputUrl
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIInputWeek: aCSNUIInputWeek [
	^ self visitCSNUIInput: aCSNUIInputWeek
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUILabel: aCSNUILabel [
	^ self visitCSNAttribute: aCSNUILabel
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUILink: aCSNUILink [
	^ self visitCSNLeaf: aCSNUILink
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIList: aCSNUIList [
	^ self visitCSNLeaf: aCSNUIList
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIMax: aCSNUIMax [
	^ self visitCSNAttribute: aCSNUIMax
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIMaxlength: aCSNUIMaxlength [
	^ self visitCSNAttribute: aCSNUIMaxlength
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIMin: aCSNUIMin [
	^ self visitCSNAttribute: aCSNUIMin
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIName: aCSNUIName [
	^ self visitCSNAttribute: aCSNUIName
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIOrderedList: aCSNUIOrderedList [
	^ self visitCSNUIList: aCSNUIOrderedList
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIPanel: aCSNUIPanel [
	^ self visitCSNContainer: aCSNUIPanel
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIParagraph: aCSNUIParagraph [
	^ self visitCSNLeaf: aCSNUIParagraph
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIPlaceholder: aCSNUIPlaceholder [
	^ self visitCSNAttribute: aCSNUIPlaceholder
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIReadonly: aCSNUIReadonly [
	^ self visitCSNAttribute: aCSNUIReadonly
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIRelativeHeight: aCSNUIRelativeHeight [
	^ self visitCSNUIHeight: aCSNUIRelativeHeight
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIRelativeWidth: aCSNUIRelativeWidth [
	^ self visitCSNUIWidth: aCSNUIRelativeWidth
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIRequired: aCSNUIRequired [
	^ self visitCSNAttribute: aCSNUIRequired
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUISelect: aCSNUISelect [
	^ self visitCSNUIInput: aCSNUISelect
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUISize: aCSNUISize [
	^ self visitCSNAttribute: aCSNUISize
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUISrc: aCSNUISrc [
	^ self visitCSNAttribute: aCSNUISrc
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIStyle: aCSNUIStyle [
	^ self visitCSNAttribute: aCSNUIStyle
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUITab: aCSNUITab [
	^ self visitCSNContainer: aCSNUITab
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUITabManager: aCSNUITabManager [
	^ self visitCSNContainer: aCSNUITabManager
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUITable: aCSNUITable [
	^ self visitCSNContainer: aCSNUITable
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUITextarea: aCSNUITextarea [
	^ self visitCSNLeaf: aCSNUITextarea
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUITitle: aCSNUITitle [
	^ self visitCSNAttribute: aCSNUITitle
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUITree: aCSNUITree [
	^ self visitCSNContainer: aCSNUITree
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIUnorderedList: aCSNUIUnorderedList [
	^ self visitCSNUIList: aCSNUIUnorderedList
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIValue: aCSNUIValue [
	^ self visitCSNAttribute: aCSNUIValue
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNUIWidth: aCSNUIWidth [
	^ self visitCSNAttribute: aCSNUIWidth
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNVariableAttribute: aCSNVariableAttribute [
	^ self visitCSNAttribute: aCSNVariableAttribute
]

{ #category : #generated }
VisitorClassGenerator >> visitCSNWidget: aCSNWidget [
	^ self visitCSNOriginedEntity: aCSNWidget
]

{ #category : #accessing }
VisitorClassGenerator >> visitorName [
	^ visitorName
]

{ #category : #accessing }
VisitorClassGenerator >> visitorName: anObject [
	visitorName := anObject
]
