package states;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.util.FlxAxes;
import states.PlayState;

class SampleSubState extends FlxSubState {
	private var created: Bool = false;
	private var game: PlayState;
	
	private var buttonsGroup: FlxTypedSpriteGroup<TextButton>;
	private var clearTextLogButton:TextButton;
	private var toggleDebuggerButton:TextButton;
	private var spamDebugTextButton:TextButton;
	
	public function new(game:PlayState) {
		super();
		this.game = game;
	}
	
	override public function create():Void {
		super.create();
		
		destroySubStates = false;
		
		if(!created) {
			buttonsGroup = new FlxTypedSpriteGroup<TextButton>();

			clearTextLogButton = new TextButton(0, 0, "Clear Text Log", onClearTextLogClick);
			toggleDebuggerButton = new TextButton(0, 0, "Toggle Debugger", onToggleDebuggerClick);
			spamDebugTextButton = new TextButton(0, 0, "Spam Debug Text", onSpamDebugTextClick);

			var buttons:Array<TextButton> = [];
			
			buttons = [clearTextLogButton, toggleDebuggerButton, spamDebugTextButton];
			
			var x:Float = 0;
			for (button in buttons) {
				button.x = x;
				button.scale.set(1, 4);
				button.updateHitbox();
				button.label.offset.y = -20;
				x += button.width + 30;
				buttonsGroup.add(button);
			}

			buttonsGroup.screenCenter(FlxAxes.X);
			buttonsGroup.y = FlxG.height * 0.25;
			add(buttonsGroup);
			
			created = true;
		}
	}
	
	private function onClearTextLogClick():Void {
		this.game.clearLog();
	}
	
	private function onToggleDebuggerClick():Void {
		FlxG.debugger.visible = !FlxG.debugger.visible;
	}
	
	public static function onSpamDebugTextClick():Void {
		Main.spamStuff();
	}
}