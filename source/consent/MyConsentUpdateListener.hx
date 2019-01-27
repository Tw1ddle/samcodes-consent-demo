package consent;

#if gdprconsent

import extension.consent.Consent;
import extension.consent.ConsentStatus;
import extension.consent.ConsentUpdateListener;
import states.PlayState;

class MyConsentUpdateListener extends ConsentUpdateListener
{
	public function new(game:PlayState) {
		super();
	}
	
	// Note - these callbacks trigger when consent is updated *from some remote server*, not when we set it locally
	
	override public function onConsentInfoUpdated(consentStatus:ConsentStatus):Void {
		ConsentWrapper.listenerMessages.push("Successfully updated consent status from server with status: " + consentStatus.toString());
	}
	
	override public function onFailedToUpdateConsentInfo(errorDescription:String):Void {
		ConsentWrapper.listenerMessages.push("Failed to update consent status from server with error: " + errorDescription);
	}
}

#end