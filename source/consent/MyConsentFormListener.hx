package consent;

import consent.MyConsentFormListener;
import extension.consent.Consent;
import extension.consent.ConsentFormListener;
import extension.consent.ConsentStatus;

class MyConsentFormListener extends ConsentFormListener
{
	public function new() {
		super();
	}
	
	// Note that the consent form has to be successfully loaded before we will be able to open it
	
	override public function onConsentFormLoaded():Void {
		
		// Open/display the consent form right after it loads
		var willDisplayForm = Consent.displayConsentForm();
		trace("Consent form did load, form display attempt returned initial result: " + willDisplayForm);
		
		Main.spamStuff();
	}
	
	override public function onConsentFormOpened():Void {
		trace("Consent form was opened");
		
		Main.spamStuff();
	}
	
	override public function onConsentFormClosed(consentStatus:ConsentStatus, userPrefersAdFree:Bool):Void {
		trace("Consent form did close with consent status: " + Std.string(consentStatus.toString()) + " and user ad free preference: " + Std.string(userPrefersAdFree));
		
		Main.spamStuff();
	}
	
	override public function onConsentFormError(errorDescription:String):Void {
		trace("Consent form error: " + errorDescription);
		
		Main.spamStuff();
	}
}