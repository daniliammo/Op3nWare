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

	// Offset Switch with one patch

	//                 Байты

	// 0xC0035FD6 - вернуть/завершить/выключить

	// 0x00008052C0035FD6 - False/ложь/никогда

	// 0x20008052C0035FD6 - True/истина/всегда


	[switches addOffsetSwitch:NSSENCRYPT("Radar hack")
	 	description:NSSENCRYPT("Radar hack (offsetswitch)")
	 	offsets: {}
		bytes:{}
	]


	[switches addOffsetSwitch:NSSENCRYPT("Antiflash")
	 	description:NSSENCRYPT("Antiflash (offsetswitch)")
	 	offsets: {
			// ENCRYPTOFFSET("0x1C6B44C"), // Update 91849 in FlashbangEffectController
			//// ENCRYPTOFFSET("0x1C6A7CC"), // get_Texture in FlashbangEffect
			//// ENCRYPTOFFSET("0x1C6A7F4"), // get_Enabled in FlashbangEffect
			/// ENCRYPTOFFSET("0x1C6A7FC"), // HHGFGHJMEHC in FlashbangEffect
			// ENCRYPTOFFSET("0x1C6B650"), // IGECLAIGNPF in FlashbangEffectController CRASH
			/// ENCRYPTOFFSET("0x1C6B71C"), // NCNEIBJAOPL in FlashbangEffectController N
			/// ENCRYPTOFFSET("0x1C6A7EC"), // LICHKIPIGIK in FlashbangEffect N
			/// ENCRYPTOFFSET("0x1C6A82C"), // ALDECIOGHEM in FlashbangEffectController N
	 		/// ENCRYPTOFFSET("0x1C6A8FC"), // KCDDEKGMLMN in FlashbangEffectController N 
			// ENCRYPTOFFSET("0x1C6B01C"), // DEMJCANGHDP in FlashbangEffectController ФСЕГДА ЗАФЛЕШЕН
			/// ENCRYPTOFFSET("0x1C6B2D8"), // LFJPGJBMKNP in FlashbangEffectController N

			ENCRYPTOFFSET("0x1C6B3A4"), // KOFEHBKLLJN in FlashBangEffectController WORK

			// ENCRYPTOFFSET("0x1C6B3F4"), // GFHDIDMBLAA in FlashBangEffectController
			/// ENCRYPTOFFSET("0x1C6A824") // get_Duration in FlashbangEffect.CurveByAngle БЕЗ  НЕГО НЕ РАБОТАЕТ
		}
	 	bytes: {
			//// ENCRYPTHEX("0x20008052C0035FD6"), // get_Texture in FlashbangEffect
			//// ENCRYPTHEX("0x20008052C0035FD6"), // get_Enabled in FlashbangEffect
			/// ENCRYPTHEX("0x20008052C0035FD6"), // HHGFGHJMEHC in FlashbangEffect
			// ENCRYPTHEX("0x20008052C0035FD6"), // IGECLAIGNPF in FlashbangEffectController CRASH
			/// ENCRYPTHEX("0x20008052C0035FD6"), // NCNEIBJAOPL in FlashbangEffectController N
			/// ENCRYPTHEX("0x20008052C0035FD6"), // LICHKIPIGIK in FlashbangEffect N
			/// ENCRYPTHEX("0x20008052C0035FD6"), // ALDECIOGHEM in FlashbangEffectController N
	 		/// ENCRYPTHEX("0x20008052C0035FD6"), // KCDDEKGMLMN in FlashbangEffectController N

			// ENCRYPTHEX("0x20008052C0035FD6"), // DEMJCANGHDP in FlashbangEffectController ФСЕГДА ЗАФЛЕШЕН

			/// ENCRYPTHEX("0x20008052C0035FD6"), // LFJPGJBMKNP in FlashbangEffectController N

			ENCRYPTHEX("0x00008052C0035FD6"), // KOFEHBKLLJN in FlashBangEffectController WORK

			// ENCRYPTHEX("0x20008052C0035FD6"), // GFHDIDMBLAA in FlashBangEffectController
			/// ENCRYPTHEX("0x20008052C0035FD6") // get_Duration in FlashbangEffect.CurveByAngle БЕЗ  НЕГО НЕ РАБОТАЕТ
		}
	];

	// Textfield Switch - used in hooking
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
	timer(25) {
		SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];

		// Website link, remove it if you don't need it.
		[alert addButton: NSSENCRYPT("Не запускать") actionBlock: ^(void) {	}];

		[alert addButton: NSSENCRYPT("Запустить") actionBlock: ^(void) 
		{
			timer(1) {
				#import "icons.h"
				setup();
			});
		}];	

		alert.shouldDismissOnTapOutside = NO;
		alert.customViewColor = [UIColor colorWithRed: 0.18 green: 0.18 blue: 0.18 alpha: 1.00];
		alert.showAnimationType = SCLAlertViewShowAnimationSlideInFromCenter;	 

		[alert showSuccess: nil
						subTitle:NSSENCRYPT("Op3nware готов к запуску.\n Это окно закроется через 60 секунд") 
							closeButtonTitle:nil
								duration:60];
	});
}


%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
