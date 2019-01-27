package consent;

#if gdprconsent

import consent.MyConsentFormListener;
import consent.MyConsentUpdateListener;
import extension.consent.Consent;
import states.PlayState;

/**
   Wrapper for functionality for figuring out whether users consent to seeing personalized ads etc.
**/
class ConsentWrapper
{
	private static var updateListener:MyConsentUpdateListener;
	private static var consentListener:MyConsentFormListener;
	
	public static var listenerMessages:Array<String> = []; // Messages from the listeners
	public static var admobPublisherId = "TODO"; // Your AdMob publisher id here
	
	// Setup listeners
	public static function init(game:PlayState):Void {
		updateListener = new MyConsentUpdateListener(game);
		consentListener = new MyConsentFormListener(game);
		
		Consent.setConsentUpdateListener(updateListener);
		Consent.setConsentFormListener(consentListener);
	}
	
	public static function requestStatus():Void {
		Consent.requestStatus(admobPublisherId);
	}
	
	// NOTE at time of writing the form refuses to load/display if the user isn't inside the EEA
	public static function requestConsentForm():Void {
		var privacyUrl = "https://www.samcodes.co.uk/"; // Your privacy URL goes here
		var personalizedAdsButtonOption = true;
		var nonPersonalizedAdsButtonOption = true;
		var adFreeButtonOption = false;
		Consent.requestConsentForm(privacyUrl, personalizedAdsButtonOption, nonPersonalizedAdsButtonOption, adFreeButtonOption);
	}
	
	public static function displayConsentForm():Bool {
		return Consent.displayConsentForm();
	}
	
	public static function isUserInEEAOrUnknown():Bool {
		return Consent.isRequestLocationInEeaOrUnknown();
	}
}

#else

// Stub
class ConsentWrapper
{
	public static var listenerMessages:Array<String> = []; // Messages from the listeners
	public static var admobPublisherId = "TODO"; // Your AdMob publisher id here
	
	public static function init(game:PlayState):Void {
	}
	public static function requestStatus():Void {
	}
	public static function requestConsentForm():Void {
	}
	public static function displayConsentForm():Bool {
		return false;
	}
	public static function isUserInEEAOrUnknown():Bool {
		return false;
	}
}

#end