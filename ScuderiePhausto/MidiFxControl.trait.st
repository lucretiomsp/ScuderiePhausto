"
I control an extrernal Analog Heat FX 
"
Trait {
	#name : 'MidiFxControl',
	#instVars : [
		'masterDelayTime',
		'masterDelayAmount',
		'masterResonance',
		'masterCutoff',
		'masterFilterType',
		'midiSender',
		'masterDelayFeedback'
	],
	#category : 'ScuderiePhausto-TurboPhausto',
	#package : 'ScuderiePhausto',
	#tag : 'TurboPhausto'
}

{ #category : 'sweeping' }
MidiFxControl >> cutoffSweepTo: aMIDIValue in: aTimeInSeconds [
	"  sweep the value of the selected parameter in a TimeInSeconds - the value is update every 10 milliseconds"
   | startValue |

    startValue := self masterCutoff.

    self
        sweepFrom: startValue
        to: aMIDIValue
        in: aTimeInSeconds 
        during: [ :v | self masterCutoffForSweep: v ]
        final:  [ :v | self masterCutoff: v ].
]

{ #category : 'sweeping' }
MidiFxControl >> decrementingProcessTo: aMidiValue from: aValue step: aStepValue numberOfStep: aNumberOfSteps interval: aStepDelay [

	| currentValue |
	currentValue := aValue.
	^ [
		  aNumberOfSteps timesRepeat: [
				  currentValue := currentValue - aStepValue.
				  self masterCutoffForSweep: currentValue asInteger.
				  aStepDelay wait ].
		  self masterCutoff: aMidiValue ]
]

{ #category : 'sweeping' }
MidiFxControl >> delayAmountTo: aMIDIValue in: aTimeInseconds [

	| startValue currentValue range timeInDeciSec step numberOfSteps stepDelay incrementingProcess decrementingProcess |
	startValue := self masterDelayAmount.
	range := (startValue max: aMIDIValue) - (startValue min: aMIDIValue).
	timeInDeciSec := aTimeInseconds * 10.
	step := range / timeInDeciSec.
	stepDelay := Delay forSeconds: 0.1.
	numberOfSteps := timeInDeciSec.
	currentValue := startValue.
	decrementingProcess := [
		                       numberOfSteps timesRepeat: [
				                       currentValue := currentValue - step.
				                       self masterDelayAmount:
					                       currentValue asInteger.
				                       stepDelay wait ] . self masterDelayAmount:aMIDIValue ].
	incrementingProcess := incrementingProcess := [
		                                              numberOfSteps
			                                              timesRepeat: [
					                                              currentValue := currentValue
					                                                              +
					                                                              step.
					                                              self
						                                              masterDelayAmount:
						                                              currentValue
							                                              asInteger.
					                                              stepDelay wait ] . self masterDelayAmount:aMIDIValue ].
	startValue < aMIDIValue
		ifTrue: [ incrementingProcess fork ]
		ifFalse: [ decrementingProcess fork ]
]

{ #category : 'sweeping' }
MidiFxControl >> delayTimeTo: aMIDIValue in: aTimeInseconds [

	| startValue currentValue range timeInDeciSec step numberOfSteps stepDelay incrementingProcess decrementingProcess |
	startValue := self masterDelayTime.
	range := (startValue max: aMIDIValue) - (startValue min: aMIDIValue).
	timeInDeciSec := aTimeInseconds * 10.
	step := range / timeInDeciSec.
	stepDelay := Delay forSeconds: 0.1.
	numberOfSteps := timeInDeciSec.
	currentValue := startValue.
	decrementingProcess := [
		                       numberOfSteps timesRepeat: [
				                       currentValue := currentValue - step.
				                       self masterDelayTime:
					                       currentValue asInteger.
				                       stepDelay wait ] . self masterDelayTime:aMIDIValue].
	incrementingProcess := incrementingProcess := [
		                                              numberOfSteps
			                                              timesRepeat: [
					                                              currentValue := currentValue
					                                                              +
					                                                              step.
					                                              self
						                                              masterDelayTime:
						                                              currentValue
							                                              asInteger.
					                                              stepDelay wait ] . self masterDelayTime:aMIDIValue].
	startValue < aMIDIValue
		ifTrue: [ incrementingProcess fork ]
		ifFalse: [ decrementingProcess fork ]
]

{ #category : 'sweeping' }
MidiFxControl >> incrementingProcessTo: aMidiValue from: aValue step: aStepValue numberOfStep: aNumberOfSteps interval: aStepDelay [

	| currentValue |
	currentValue := aValue.
	^ [
		  aNumberOfSteps timesRepeat: [
				  currentValue := currentValue +aStepValue.
				  self masterCutoffForSweep: currentValue asInteger.
				  aStepDelay wait ].
		  self masterCutoff: aMidiValue ]
]

{ #category : 'accessing' }
MidiFxControl >> masterCutoff [

	^ masterCutoff
]

{ #category : 'setting' }
MidiFxControl >> masterCutoff: aMIDIValue [

	self midiSender sendCC: 22 withValue: aMIDIValue onChannel: 15.
	masterCutoff  := aMIDIValue 
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterCutoffForSweep: aMIDIValue [

	self midiSender sendCC: 22 withValue: aMIDIValue onChannel: 15.

]

{ #category : 'accessing' }
MidiFxControl >> masterDelayAmount [

	^ masterDelayAmount
]

{ #category : 'setting' }
MidiFxControl >> masterDelayAmount: aMIDIValue [

	self midiSender sendCC: 113 withValue: aMIDIValue onChannel: 16.
	masterDelayAmount := aMIDIValue 
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterDelayAmountForSweep: aMIDIValue [

	self midiSender sendCC: 113 withValue: aMIDIValue onChannel: 16.

]

{ #category : 'setting' }
MidiFxControl >> masterDelayFeedback: aMIDIValue [

	self midiSender sendCC: 110 withValue: aMIDIValue onChannel: 16.
	masterDelayFeedback := aMIDIValue 
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterDelayFeedbackForSweep: aMIDIValue [

	self midiSender sendCC: 110 withValue: aMIDIValue onChannel: 16
]

{ #category : 'accessing' }
MidiFxControl >> masterDelayTime [

	^ masterDelayTime
]

{ #category : 'setting' }
MidiFxControl >> masterDelayTime: aMIDIValue [

	self midiSender sendCC: 107 withValue: aMIDIValue onChannel: 16.
	masterDelayTime := aMIDIValue 
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterDelayTimeForSweep: aMIDIValue [

	self midiSender sendCC: 107 withValue: aMIDIValue onChannel: 16
]

{ #category : 'accessing' }
MidiFxControl >> masterFilterType [

	^ masterFilterType
]

{ #category : 'setting' }
MidiFxControl >> masterFilterType: aFilterType [

	| filterTypes filterType  |
	filterTypes := Dictionary new.
	filterTypes
		add: #lp -> 1;
		add: #bp -> 5;
		add: #hp -> 9.
	filterType := filterTypes at: aFilterType ifAbsent: 1.
	self midiSender sendCC: 30 withValue: filterType onChannel: 15.
	
	masterFilterType := filterType 
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterFilterTypeForSweep: aFilterType [

	| filterTypes filterType |
	filterTypes := Dictionary new.
	filterTypes
		add: #lp -> 1;
		add: #bp -> 5;
		add: #hp -> 9.
	filterType := filterTypes at: aFilterType ifAbsent: 1.
	self midiSender sendCC: 30 withValue: filterType onChannel: 15
]

{ #category : 'accessing' }
MidiFxControl >> masterResonance [

	^ masterResonance
]

{ #category : 'setting' }
MidiFxControl >> masterResonance: aMIDIValue [

	self midiSender sendCC: 23 withValue: aMIDIValue onChannel: 15.
	masterResonance := aMIDIValue 
	
]

{ #category : 'sweeping' }
MidiFxControl >> masterResonanceForSweep: aMIDIValue [

	self midiSender sendCC: 23 withValue: aMIDIValue onChannel: 15
]

{ #category : 'accessing' }
MidiFxControl >> midiSender [ 
 
^ midiSender
]

{ #category : 'accessing' }
MidiFxControl >> midiSender: aMidiSender [

midiSender := aMidiSender 

	
]

{ #category : 'sweeping' }
MidiFxControl >> sweepFrom: startValue to: targetValue in: aTimeInSeconds during: stepBlock final: finalBlock [

"generic method template for parameter sweeping"
	| numberOfSteps step stepDelay totalDuration currentValue |
	numberOfSteps := (aTimeInSeconds * 10) asInteger max: 1.
	stepDelay := Delay forMilliseconds: 100.

	step := targetValue - startValue / numberOfSteps.
	currentValue := startValue.

	[
		numberOfSteps timesRepeat: [
				currentValue := currentValue + step.
				stepBlock value: currentValue asInteger.
				stepDelay wait ] ] fork.

	totalDuration := Delay forMilliseconds: (100 * (numberOfSteps + 1)).

	[
		totalDuration wait.
		finalBlock value: targetValue ] fork
]
