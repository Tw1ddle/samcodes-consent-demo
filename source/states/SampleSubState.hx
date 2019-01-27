package states;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.util.FlxAxes;
import states.PlayState;
import consent.ConsentWrapper;

class SampleSubState extends FlxSubState {
	private var created:Bool = false;
	private var game:PlayState;
	
	private var buttonsGroup:FlxTypedSpriteGroup<TextButton>;
	private var requestConsentStatusButton:TextButton;
	private var userInEEAButton:TextButton;
	private var showConsentFormButton:TextButton;
	private var clearTextLogButton:TextButton;
	
	public function new(game:PlayState) {
		super();
		this.game = game;
	}
	
	override public function create():Void {
		super.create();
		
		destroySubStates = false;
		
		if (!created) {
			// Setup the consent listeners
			ConsentWrapper.init(game);
			
			buttonsGroup = new FlxTypedSpriteGroup<TextButton>();

			requestConsentStatusButton = new TextButton(0, 0, "Request Consent Status", onRequestConsentStatusClick);
			userInEEAButton = new TextButton(0, 0, "Is User In EEA", onUserInEEAButtonClick);
			showConsentFormButton = new TextButton(0, 0, "Show Consent Form", onShowConsentFormButtonClick);
			clearTextLogButton = new TextButton(0, 0, "Clear Text Log", onClearTextLogClick);

			var buttons:Array<TextButton> = [];
			
			buttons = [requestConsentStatusButton, userInEEAButton, showConsentFormButton, clearTextLogButton];
			
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
			
			if (ConsentWrapper.admobPublisherId == "TODO") {
				game.addText("Publisher id is not set in ConsentWrapper.hx, nothing will work!");
			}
			
			created = true;
		}
	}
	
	override public function update(dt:Float):Void {
		super.update(dt);
		
		// Add any new messages posted by the listener to the text log
		for (s in ConsentWrapper.listenerMessages) {
			game.addText(s);
		}
		ConsentWrapper.listenerMessages = [];
	}
	
	private function onRequestConsentStatusClick():Void {
		game.addText("Will request consent status...");
		ConsentWrapper.requestStatus();
	}
	
	private function onUserInEEAButtonClick():Void {
		game.addText("Will check if user is in the EEA: " + ConsentWrapper.isUserInEEAOrUnknown());
	}
	
	private function onShowConsentFormButtonClick():Void {
		game.addText("Will request to show the consent form");
		ConsentWrapper.requestConsentForm();
	}
	
	private function onClearTextLogClick():Void {
		this.game.clearLog();
	}
}