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

	[switches addSwitch:NSSENCRYPT("Dark Theme")
	 	description:NSSENCRYPT("Dark Theme. Требуется перезагрузка игры.")
	];

	[switches addOffsetSwitch:NSSENCRYPT("Team Radar")
	 	description:NSSENCRYPT("Team Radar (offsetswitch) название метода в 0.22.2: private void JCNNKAPBAMB(byte IFJFLAGGCCL, bool IMNNENLPCKI) { } В Классе public class WeaponryController : Controller, HFKOMFDEEIA, LMMDCGBNHBN")
	 	offsets: {
			ENCRYPTOFFSET("0x1E090FC"),
			ENCRYPTOFFSET("0x1E0932C"),
			ENCRYPTOFFSET("0x1E0961C")
		}
		bytes: {
			ENCRYPTHEX("0xC0035FD6"),
			ENCRYPTHEX("0xC0035FD6"),
			ENCRYPTHEX("0xC0035FD6")
		}
	];

	// 0x1DFD72C
	[switches addOffsetSwitch:NSSENCRYPT("No Drop")
	 	description:NSSENCRYPT("No Drop (offsetswitch) название метода в 0.22.2: private void JCNNKAPBAMB(byte IFJFLAGGCCL, bool IMNNENLPCKI) { } В Классе public class WeaponryController : Controller, HFKOMFDEEIA, LMMDCGBNHBN")
	 	offsets: {ENCRYPTOFFSET("0x1DFD72C")}
		bytes: {ENCRYPTHEX("0x200080D2C0035FD6")}
	];

	// 0x1CE1E90
	[switches addOffsetSwitch:NSSENCRYPT("Stop Time")
	 	description:NSSENCRYPT("Stop Time (offsetswitch) название метода в 0.22.2: public double FGGHPGOOHPH() { } В Классе public class NMLAIGIJBLP")
	 	offsets: {ENCRYPTOFFSET("0x1CA5CA4")}
		bytes: {ENCRYPTHEX("0xC0035FD6")}
	];


	// 0x1CA5CA4
	[switches addOffsetSwitch:NSSENCRYPT("Money Hack")
	 	description:NSSENCRYPT("Money Hack (offsetswitch) название метода в 0.22.2: public GameObject get_Prefab() { } В Классе public class BulletTraceEffectParams : ScriptableObject")
	 	offsets: {ENCRYPTOFFSET("0x1CA5CA4")}
		bytes: {ENCRYPTHEX("0x00008052C0035FD6")}
	];

	// 0x1C58524
	[switches addOffsetSwitch:NSSENCRYPT("Wall Shot")
	 	description:NSSENCRYPT("Wall Shot (offsetswitch) название метода в 0.22.2: public override float BLBDEDPMCMO(HIIDKIGGAHG POHHEDDMNIM, float HHEJAONKIKI) { } В Классе public class BCKEJFLKOPF : GLGMDNDIIED (Рядом с енумом private enum HitCaster.ALPPBHCAFOJ)")
	 	offsets: {ENCRYPTOFFSET("0x1C58524")}
		bytes: {ENCRYPTHEX("0x00F0271EC0035FD6")}
	];

	[switches addOffsetSwitch:NSSENCRYPT("One Hit Kill")
	 	description:NSSENCRYPT("One Hit Kill (offsetswitch)")
	 	offsets: {
			ENCRYPTOFFSET("0x1C45BE0"),
			ENCRYPTOFFSET("0x1C45C08"),
			ENCRYPTOFFSET("0x1C45C28"),
			ENCRYPTOFFSET("0x1C45FA0"),
			ENCRYPTOFFSET("0x1C45F80")
		}
		bytes: {
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6"),
			ENCRYPTHEX("0x00008052C0035FD6")
		}
	];


	// 0x1CDD6D8
	[switches addOffsetSwitch:NSSENCRYPT("FPS Hack")
	 	description:NSSENCRYPT("FPS Hack (offsetswitch) название метода в 0.22.2: private void Update() { } В Классе public class FpsCounter : HudComponentView")
	 	offsets: {ENCRYPTOFFSET("0x1CDD6D8")}
		bytes: {ENCRYPTHEX("0x200080D2C0035FD6")}
	];

	// 0x1C5E908
	[switches addOffsetSwitch:NSSENCRYPT("No Recoil")
		description:NSSENCRYPT("No recoil Название метода в 0.22.2: private bool MCCLJAABJJB() { } В Классе public class GunController : WeaponController")
		offsets: {ENCRYPTOFFSET("0x1C5E908")}
		bytes: {ENCRYPTHEX("0xC0035FD6")}
	];

	[switches addOffsetSwitch:NSSENCRYPT("Plant Anywhere")
		description:NSSENCRYPT("Plant Anywhere Название метода в 0.22.2: internal bool FALEEMFLIPN(BombSite zone) { }, internal bool FALEEMFLIPN(BombSite zone) { }, internal bool DHOAFHJBDMD(BombSite site) { } В Классе [CompilerGenerated] private sealed class BombManager")
		offsets: {
			ENCRYPTOFFSET("0x1C9B54C"),
			ENCRYPTOFFSET("0x1C9B57C"),
			ENCRYPTOFFSET("0x1C9B5C4")
		}
		bytes: {
			ENCRYPTHEX("0x200080D2C0035FD6"),
			ENCRYPTHEX("0x200080D2C0035FD6"),
			ENCRYPTHEX("0x200080D2C0035FD6")
		}
	];

	[switches addOffsetSwitch:NSSENCRYPT("Fast Plant")
		description:NSSENCRYPT("Fast plant Название метода в 0.22.2: public float get_PlantDuration() { } В Классе public class BombParameters : WeaponParameters")
		offsets: {ENCRYPTOFFSET("0x1C9BD8C")}
		bytes: {ENCRYPTHEX("0xE003271EC0035FD6")}
	];

	[switches addOffsetSwitch:NSSENCRYPT("Jump Hack")
		description:NSSENCRYPT("Jump Hack Название метода в 0.22.2: public bool get_isGrounded() { } В Классе public class CharacterController : Collider")
		offsets: {ENCRYPTOFFSET("0x3429078")}
		bytes: {ENCRYPTHEX("0x20008052C0035FD6")}
	];

	// 0x1DA44DC
	[switches addOffsetSwitch:NSSENCRYPT("Respawn Hack")
	 	description:NSSENCRYPT("Respawn Hack (offsetswitch) название метода в 0.22.2: protected override bool LINGLJOKGAO() { } В Классе public class DefuseController : GameController, PHGAGIAPKBA")
	 	offsets: {ENCRYPTOFFSET("0x1DA44DC")}
		bytes: {ENCRYPTHEX("0x20008052C0035FD6")}
	];	

	[switches addOffsetSwitch:NSSENCRYPT("Infinite ammo")
	 	description:NSSENCRYPT("Infinite ammo (offsetswitch) название метода в 0.22.2: public void GLDJJDNNCHB(short LFFGHMHNFCA) { } В Классе public class GJAECFAPFAL")
	 	offsets: {ENCRYPTOFFSET("0x1CE21F8")}
		bytes: {ENCRYPTHEX("0x20008052C0035FD6")}
	];

	// 0x1DA8540

	[switches addOffsetSwitch:NSSENCRYPT("Buy Anywhere")
	 	description:NSSENCRYPT("Buy Anywhere (offsetswitch) название метода в 0.22.2: [CompilerGenerated] private bool AKLKHMADMPI(WeaponBuyZone FHLHLJIOCOG) { } [CompilerGenerated] private bool BFLCNNBGIBE(WeaponBuyZone FHLHLJIOCOG) { } В Классе public class DefuseController : GameController, PHGAGIAPKBA")
	 	offsets: {
			ENCRYPTOFFSET("0x1DA8540"),
			ENCRYPTOFFSET("0x1DAA608")
		}
		bytes: {
			ENCRYPTHEX("0x20008052C0035FD6"),
			ENCRYPTHEX("0x20008052C0035FD6")
		}
	];


	[switches addOffsetSwitch:NSSENCRYPT("Antiflash")
	 	description:NSSENCRYPT("Antiflash (offsetswitch) название метода в 0.22.2: public override void FPCHKPJFNPP(Vector3 BOOCCOPLJNH) { } В Классе public class FlashbangEffectController : GrenadeEffectController")
	 	offsets: {
			ENCRYPTOFFSET("0x1C6AAB0")
		}
	 	bytes: {
			ENCRYPTHEX("0xC0035FD6")
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
		[alert addButton: NSSENCRYPT("Не запускать") actionBlock: ^(void) { }];

		[alert addButton: NSSENCRYPT("Запустить") actionBlock: ^(void) 
		{
			timer(1) {
				bool isOn = [switches isSwitchOn:NSSENCRYPT("Dark Theme")];
				if(isOn == true) {
					#import "Themes/Dark.h"
				}
				if(isOn == false){
					#import "Themes/Light.h"
				}
				setup();
			});
		}];	

		alert.shouldDismissOnTapOutside = NO;
		alert.customViewColor = [UIColor colorWithRed: 0.18 green: 0.18 blue: 0.18 alpha: 1.00];
		alert.showAnimationType = SCLAlertViewShowAnimationSlideInFromCenter;	 

		[alert showSuccess: nil
						subTitle:NSSENCRYPT("Op3nware не продается. Если вы купили Op3nware пожалуйста, пожалуйтесь на продавца сюда: T.ME/Op3nware_bot\nOp3nware is not for sale. If you bought Op3nware please report the seller here: T.ME/Op3nware_bot") 
							closeButtonTitle:nil
								duration:60];
	});
}


%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
