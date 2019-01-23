package consent;

import consent.MyConsentFormListener;
import consent.MyConsentUpdateListener;
import extension.consent.Consent;

/**
   Wrapper for functionality for figuring out whether users consent to seeing personalized ads etc.
**/
class ConsentWrapper
{
	private static var updateListener = new MyConsentUpdateListener();
	private static var consentListener = new MyConsentFormListener();
	
	// Setup listeners
	public static function init():Void {
		Consent.setConsentUpdateListener(updateListener);
		Consent.setConsentFormListener(consentListener);
	}
	
	public static function requestStatus():Void {
		var publisherId:String = "YOUR_ADMOB_PUBLISHER_ID_MUST_GO_HERE";
		Consent.requestStatus(publisherId);
	}
	
	// NOTE at time of writing the form refuses to load/display if the user isn't inside the EEA
	public static function requestConsentForm():Void {
		var privacyUrl = "https://www.samcodes.co.uk/";
		var personalizedAdsButtonOption = true;
		var nonPersonalizedAdsButtonOption = true;
		var adFreeButtonOption = false;
		Consent.requestConsentForm(privacyUrl, personalizedAdsButtonOption, nonPersonalizedAdsButtonOption, adFreeButtonOption);
	}
	
	public static function displayConsentForm():Bool {
		return Consent.displayConsentForm();
	}
}
