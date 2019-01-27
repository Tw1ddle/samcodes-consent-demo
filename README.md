# Haxe GDPR Consent Demo

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-consent-demo/blob/master/LICENSE)
[![Build Status](https://img.shields.io/travis/Tw1ddle/samcodes-consent-demo.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/samcodes-consent-demo)

Demo of Google Mobile Ads [Consent SDK bindings](https://github.com/Tw1ddle/samcodes-consent) for Android and iOS Haxe OpenFL targets.

## Usage

This demo app uses HaxeFlixel and one of my haxelibs, so install these first:

```bash
haxelib install flixel
haxelib install samcodes-consent # Or use lib/samcodes-consent submodule in the repo
```

Enter your AdMob publisher id in the ```ConsentWrapper``` class for the Consent SDK to work with. You can also optionally set your privacy policy URL.

## Screenshots

Pre-rendered consent screen:

![](screenshots/prerendered-consent-dialog.png?raw=true)

Screenshot of the actual demo:

![](screenshots/app-screenshot.png?raw=true)

## Notes
 * Run the JavaScript build [here](https://github.com/Tw1ddle/samcodes-consent-demo/index.html). There's no web-based consent support yet.
 * Got an idea or suggestion? Open an issue on GitHub, or send Sam a message on [Twitter](https://twitter.com/Sam_Twidale).