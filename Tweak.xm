#import "Macros.h"

/***********************************************************
	INSIDE THE FUNCTION BELOW YOU'LL HAVE TO ADD YOUR SWITCHES!
***********************************************************/
void setup() 
{

	// patching offsets directly, without switch
	
	// patchOffset(ENCRYPTOFFSET("0x1C6C2E4"), ENCRYPTHEX("0xC0035FD6"));
	
	/// patchOffset(ENCRYPTOFFSET("0x10020D2D4"), ENCRYPTHEX("0x00008052C0035FD6"));

	// You can write as many bytes as you want to an offset
	/// patchOffset(ENCRYPTOFFSET("0x10020D3A8"), ENCRYPTHEX("0x00F0271E0008201EC0035FD6"));
	// or	
	/// patchOffset(ENCRYPTOFFSET("0x10020D3A8"), ENCRYPTHEX("00F0271E0008201EC0035FD6"));
	// spaces are fine too
	/// patchOffset(ENCRYPTOFFSET("0x10020D3A8"), ENCRYPTHEX("00 F0 27 1E 00 08 20 1E C0 03 5F D6"));


	// Empty switch - usefull with hooking
	[switches addSwitch:NSSENCRYPT("Antiban is enabled")
		description:NSSENCRYPT("Game Anti-cheat manager is disabled.")
	];

	//Or check directly:
	// if([switches isSwitchOn:NSSENCRYPT("Antiflash")]) 
	// {
		// patchOffset(ENCRYPTOFFSET("0x3404FB4"), ENCRYPTHEX("0x200080D2C0035FD6"));
		// patchOffset(ENCRYPTOFFSET("0x1CED4D8"), ENCRYPTHEX("0x20008052C0035FD6"));
		// patchOffset(ENCRYPTOFFSET("0x1C6FDB8"), ENCRYPTHEX("0xC0035FD6"));
	// }

	// // Offset Switch with one patch
	[switches addOffsetSwitch:NSSENCRYPT("Antiflash")
	 	description:NSSENCRYPT("Antiflash")
	 	offsets: 
		{
	 		ENCRYPTOFFSET("0x1C6FDB8")
	 	}
	 	bytes: 
		{
	 		ENCRYPTHEX("0x00008052C0035FD6")
		}
	];

	// // Offset switch with multiple patches
	// [switches addOffsetSwitch:NSSENCRYPT("One Hit Kill")
	// 	description:NSSENCRYPT("Enemy will die instantly")
	// 	offsets: {
	// 		ENCRYPTOFFSET("0x1001BB2C0"),
	// 		ENCRYPTOFFSET("0x1002CB3B0"),
	// 		ENCRYPTOFFSET("0x1002CB3B8")
	// 	}
	// 	bytes: {
	// 		ENCRYPTHEX("0x00E0BF12C0035FD6"),
	// 		ENCRYPTHEX("0xC0035FD6"),
	// 		ENCRYPTHEX("0x00F0271E0008201EC0035FD6")
	// 	}
	// ];

	// // Textfield Switch - used in hooking
	// [switches addTextfieldSwitch:NSSENCRYPT("Custom Gold")
	// 	description:NSSENCRYPT("Here you can enter your own gold amount")
	// 	inputBorderColor:[UIColor colorWithRed: 0.01 green: 0.01 blue: 0.85 alpha: 1.00]
	// ];

	// // Slider Switch - used in hooking
	// [switches addSliderSwitch:NSSENCRYPT("Custom Move Speed")
	// 	description:NSSENCRYPT("Set your custom move speed")
	// 	minimumValue:0
	// 	maximumValue:10
	// 	sliderColor:[UIColor colorWithRed: 0.01 green: 0.01 blue: 0.85 alpha: 1.00]
	// ];
}


/**********************************************************************************************************
		 You can customize the menu here
		 For colors, you can use hex color codes or UIColor itself
			- For the hex color #BD0000 you'd use: UIColorFromHex(0xBD0000)
			- For UIColor you can visit this site: https://www.uicolor.xyz/#/rgb-to-ui
				NOTE: remove the ";" when you copy your UIColor from there!
		 
		 Site to find your perfect font for the menu: http://iosfonts.com/	--> view on mac or ios device
		 See comment next to maxVisibleSwitches!!!!

		 menuIcon & menuButton is base64 data, upload a image to: https://www.browserling.com/tools/image-to-base64 \
		 then replace that string with mine.
************************************************************************************************************/

// If the menu button doesn't show up; Change the timer to a bigger amount.
static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) 
{
	timer(5) {
		SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];

		// Website link, remove it if you don't need it.
		[alert addButton: NSSENCRYPT("Не запускать") actionBlock: ^(void) {	}];

		[alert addButton: NSSENCRYPT("Запустить") actionBlock: ^(void) 
		{
			timer(5) {
				#import "icons.h"
				setup();
			});
		}];	

		alert.shouldDismissOnTapOutside = NO;
		alert.customViewColor = [UIColor colorWithRed: 0.18 green: 0.18 blue: 0.18 alpha: 1.00];
		alert.showAnimationType = SCLAlertViewShowAnimationSlideInFromCenter;	 

		[alert showSuccess: nil
						subTitle:NSSENCRYPT("Openware") 
							closeButtonTitle:nil
								duration:60];
	});
}


%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}