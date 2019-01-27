package consent;

#if gdprconsent

import consent.MyConsentFormListener;
import extension.consent.Consent;
import extension.consent.ConsentFormListener;
import extension.consent.ConsentStatus;
import states.PlayState;

class MyConsentFormListener extends ConsentFormListener
{
	public function new(game:PlayState) {
		super();
	}
	
	// Note that the consent form has to be successfully loaded before we will be able to open it
	
	override public function onConsentFormLoaded():Void {
		
		// Open/display the consent form right after it loads
		var willDisplayForm = Consent.displayConsentForm();

		ConsentWrapper.listenerMessages.push("Consent form did load, form display attempt returned initial result: " + willDisplayForm);
	}
	
	override public function onConsentFormOpened():Void {
		ConsentWrapper.listenerMessages.push("Consent form was opened");
	}
	
	override public function onConsentFormClosed(consentStatus:ConsentStatus, userPrefersAdFree:Bool):Void {
		ConsentWrapper.listenerMessages.push("Consent form did close with consent status: " + Std.string(consentStatus.toString()));
		ConsentWrapper.listenerMessages.push("... and user ad free preference: " + Std.string(userPrefersAdFree));
	}
	
	override public function onConsentFormError(errorDescription:String):Void {
		ConsentWrapper.listenerMessages.push("Consent form error: " + errorDescription);
	}
}

#end