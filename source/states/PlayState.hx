package states;

import flixel.FlxState;
import flixel.util.FlxColor;
import openfl.Lib;
import openfl.events.Event;
import states.SampleSubState;

class PlayState extends FlxState {
	private var eventText:TextItem;
	public var sampleSubState:SampleSubState;
	
	override public function create():Void {
		super.create();
		destroySubStates = false;
		
		bgColor = FlxColor.BLACK;
		
		eventText = new TextItem(0, 0, "Initializing...", 12);
		add(eventText);
		
		sampleSubState = new SampleSubState(this);
		
		Lib.current.stage.addEventListener(Event.ACTIVATE, function(p:Dynamic):Void {
			addText("App received ACTIVATE event");
		});
		Lib.current.stage.addEventListener(Event.DEACTIVATE, function(p:Dynamic):Void {
			addText("App received DEACTIVATE event");
		});
		
		openSubState(sampleSubState);
	}
	
	public function addText(text:String):Void {
		eventText.text = text + "\n" + eventText.text;
	}
	
	public function clearLog():Void {
		eventText.text = "Waiting...";
	}
}