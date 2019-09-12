"
Use me to create the visitor from a root class

ex.


VisitorGenerator new 
	packageName: 'Badetitou-Visitor'; 
	root: FASTEntity; 
	visitorName: #'FASTVisitor'; 
	generateVisitor.
"
Class {
	#name : #VisitorGenerator,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'visitorName',
		'root'
	],
	#category : #'Badetitou-Utils'
}

{ #category : #generating }
VisitorGenerator >> createVisitorClass [
	^ Object
		subclass: self visitorName
		instanceVariableNames: ''
		classVariableNames: ''
		package: self packageName
]

{ #category : #generating }
VisitorGenerator >> generateVisitor [
	| visitorClass |
	visitorClass := self createVisitorClass.
	self root withAllSubclasses do: [ :aClass | self generateVisitorOf: aClass in: visitorClass]
]

{ #category : #generating }
VisitorGenerator >> generateVisitorOf: aClass in: visitorClass [
	| selector |
	aClass = self root
		ifFalse: [ visitorClass
				compile:
					'visit' , aClass name , ': a' , aClass name
						,
							'
	<generated>
	^ self visit' , aClass superclass name , ': a' , aClass name
				classified: 'visiting' ]
		ifTrue: [ visitorClass
				compile:
					'visit' , aClass name , ': a' , aClass name
						,
							'
	^ self subclassResponsibility'
				classified: 'visiting' ].
	selector := aClass compile: 'accept: a', self visitorName, '
	<generated>
	^ a', self visitorName, ' visit', aClass name, ': self' classified: '*', self packageName, '-generated'.
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
