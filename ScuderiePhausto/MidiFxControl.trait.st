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
MidiFxControl >> delayAmountTo: aMIDIValue in: aTimeInSeconds [


	| startValue |
	startValue := self masterDelayAmount .

	self
		sweepFrom: startValue
		to: aMIDIValue
		in: aTimeInSeconds
		during: [ :v | self masterDelayAmountForSweep: v ]
		final: [ :v | self masterDelayAmount: v ]
]

{ #category : 'sweeping' }
MidiFxControl >> delayTimeTo: aMIDIValue in: aTimeInSeconds [

	| startValue |
	startValue := self masterDelayTime .

	self
		sweepFrom: startValue
		to: aMIDIValue
		in: aTimeInSeconds
		during: [ :v | self masterDelayTimeForSweep: v ]
		final: [ :v | self masterDelayTime v ]
]

{ #category : 'setting' }
MidiFxControl >> lfo1Depth: aMIDIValue [

|normValue|
normValue :=( 64 - aMIDIValue ) abs.
	self midiSender sendCC: 73 withValue: aMIDIValue onChannel: 15.
	masterCutoff := aMIDIValue
]

{ #category : 'setting' }
MidiFxControl >> lfo1Multiplier: aMIDIValue [

	self midiSender sendCC: 68 withValue: aMIDIValue onChannel: 15.
	masterCutoff := aMIDIValue
]

{ #category : 'setting' }
MidiFxControl >> lfo1Speed: aMIDIValue [

	self midiSender sendCC: 67 withValue: aMIDIValue onChannel: 15.
	masterCutoff := aMIDIValue
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
