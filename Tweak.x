#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIControl.h>
#import <Cephei/HBPreferences.h>
#import <spawn.h>

// hide Labels
%config(generator=internal)
%group qur


%hook SBApplication
- (id)displayName {
    return @"";
} 
%end



%end
%ctor
{
  HBPreferences *Key = [[HBPreferences alloc] initWithIdentifier:@"com.apple.springboard"];
 bool Enable = [([Key objectForKey:@"enableLabels"] ?: @(NO)) boolValue];

if (Enable) {
 %init(qur);

}
}





// hide Labels folder
%config(generator=internal)
%group qus



%hook SBFolder
- (id)displayName {
    return @"";
} 

- (bool)canEditDisplayName {
    return 0;
} 

%end


%end
%ctor
{
  HBPreferences *Key = [[HBPreferences alloc] initWithIdentifier:@"com.apple.springboard"];
 bool Enable = [([Key objectForKey:@"enableLabelsFolder"] ?: @(NO)) boolValue];

if (Enable) {
 %init(qus);

}
}



// hide dock background
%config(generator=internal)
%group quk



%hook SBDockView
- (void)setBackgroundAlpha:(double)arg1 { 
    arg1 = 0;
    %orig;
} 
%end


%end
%ctor
{
  HBPreferences *Key = [[HBPreferences alloc] initWithIdentifier:@"com.apple.springboard"];
 bool Enable = [([Key objectForKey:@"enableHideDock"] ?: @(NO)) boolValue];

if (Enable) {
 %init(quk);

}
}