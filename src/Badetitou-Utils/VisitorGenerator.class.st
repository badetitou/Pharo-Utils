"
Use me to create the visitor from a root class

```
VisitorGenerator new 
	packageName: 'Badetitou-Visitor'; 
	root: FASTEntity; 
	visitorName: #'FASTVisitor'; 
	generateVisitor.
```
"
Class {
	#name : #VisitorGenerator,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'visitorName',
		'root',
		'rejectedPrefix',
		'createTraitVisitor'
	],
	#category : #'Badetitou-Utils'
}

{ #category : #generating }
VisitorGenerator >> commentString [

	^ String streamContents: [ :stream | 
		  stream
			  << 'I am a visitor for ';
			  << self root printString ]
]

{ #category : #accessing }
VisitorGenerator >> createClassVisitor [
	createTraitVisitor := false
]

{ #category : #accessing }
VisitorGenerator >> createTraitVisitor [
	createTraitVisitor := true
]

{ #category : #generating }
VisitorGenerator >> createVisitorClass [
	^ Object
		subclass: self visitorName
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName
]

{ #category : #generating }
VisitorGenerator >> createVisitorTrait [
	^ Trait
		named: self visitorName
		uses: {}
		slots: {}
		package: self packageName
]

{ #category : #accessing }
VisitorGenerator >> defaultRejectedPrefix [
	^ ''
]

{ #category : #generating }
VisitorGenerator >> generateVisitor [
	| visitor |
	visitor := createTraitVisitor ifTrue: [ self createVisitorTrait ] ifFalse: [ self createVisitorClass ].
	visitor comment: self commentString.
	self root withAllSubclasses do: [ :aClass | self generateVisitorOf: aClass in: visitor]
]

{ #category : #generating }
VisitorGenerator >> generateVisitorOf: aClass in: visitorClass [

	| selector |
	aClass = self root
		ifFalse: [ 
			visitorClass
				compile: 'visit' , (aClass name withoutPrefix: self rejectedPrefix) , ': a' , aClass name , '
	<generated>
	^ self visit' , (aClass superclass name withoutPrefix: self rejectedPrefix) , ': a' , aClass name
				classified: 'visiting' ]
		ifTrue: [ 
			visitorClass
				compile: 'visit' , (aClass name withoutPrefix: self rejectedPrefix) , ': a' , aClass name , '
	^ self subclassResponsibility'
				classified: 'visiting' ].
	selector := aClass
		            compile: 'accept: a' , self visitorName , '
	<generated>
	^ a' , self visitorName , ' visit' , (aClass name withoutPrefix: self rejectedPrefix) , ': self'
		            classified: '*' , self packageName , '-generated'
]

{ #category : #accessing }
VisitorGenerator >> initialize [
	createTraitVisitor := false
]

{ #category : #accessing }
VisitorGenerator >> packageName [
	^ packageName
]

{ #category : #accessing }
VisitorGenerator >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
VisitorGenerator >> rejectedPrefix [
	^ rejectedPrefix ifNil: [ self defaultRejectedPrefix ]
]

{ #category : #accessing }
VisitorGenerator >> rejectedPrefix: aPrefix [
	rejectedPrefix := aPrefix 
]

{ #category : #accessing }
VisitorGenerator >> root [
	"Must be the root class for your Visitor"

	^ root
]

{ #category : #accessing }
VisitorGenerator >> root: anObject [
	root := anObject
]

{ #category : #accessing }
VisitorGenerator >> visitorName [
	^ visitorName
]

{ #category : #accessing }
VisitorGenerator >> visitorName: anObject [
	visitorName := anObject
]
