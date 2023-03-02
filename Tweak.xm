#import "Macros.h"
#include "dlfcn.h"
#include "Unity.h"

/***********************************************************
	INSIDE THE FUNCTION BELOW YOU'LL HAVE TO ADD YOUR SWITCHES!
***********************************************************/

void setup() 
{

	// patching offsets directly, without switch
	// patchOffset(ENCRYPTOFFSET("0x1C68D54"), ENCRYPTHEX("0xC0035FD6"));
	
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

	// Offset Switch with one patch

	//                 Байты

	// 0xC0035FD6 - вернуть/завершить/выключить

	// 0x00008052C0035FD6 - False/ложь/никогда

	// 0x20008052C0035FD6 - True/истина/всегда

	[switches addOffsetSwitch:NSSENCRYPT("Antiflash")
	 	description:NSSENCRYPT("Antiflash (offsetswitch)")
	 	offsets: {
	 		// ENCRYPTOFFSET("0x10")
			// ENCRYPTOFFSET("0x18")
			// ENCRYPTOFFSET("0x20")
			ENCRYPTOFFSET("0x1C6A7CC"), // get_Texture
			ENCRYPTOFFSET("0x1C6A7F4"), // get_Enabled
			ENCRYPTOFFSET("0x1C6A7FC"), // HHGFGHJMEHC
			ENCRYPTOFFSET("0x1C6B650"), // IGECLAIGNPF
			ENCRYPTOFFSET("0x1C6B71C"), // NCNEIBJAOPL
			ENCRYPTOFFSET("0x1C6B44C"), // Update 91849 in FlashbangEffectController
			ENCRYPTOFFSET("0x1C6A7EC"), // LICHKIPIGIK
			ENCRYPTOFFSET("0x1C6A82C"), // ALDECIOGHEM in FlashbangEffectController
	 		ENCRYPTOFFSET("0x1C6A8FC"), // KCDDEKGMLMN in FlashbangEffectController
			ENCRYPTOFFSET("0x1C6B01C"), // DEMJCANGHDP in FlashbangEffectController
			ENCRYPTOFFSET("0x1C6B2D8") // LFJPGJBMKNP in FlashbangEffectController
		}
	 	bytes: {
	 		ENCRYPTHEX("0xC0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0xC0035FD6"),
			ENCRYPTHEX("0xC0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6")
		}
	];

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
	timer(20) {
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
						subTitle:NSSENCRYPT("Openware готов к запуску.") 
							closeButtonTitle:nil
								duration:60];
	});
}


%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
