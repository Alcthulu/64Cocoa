//
//  MainMenuController.m
//  64Cocoa
//
//  Created by Alvaro on 15/12/2019.
//  Copyright © 2019 AlvaroRosaARG. All rights reserved.
//

#import "MainMenuController.h"
#import "SettingsController.h"

@implementation MainMenuController{
    SettingsController * settingsController;
}

-(id) init {
    self = [super init];
    
    if(nil == self)
        return nil;
    
    return self;
}

-(IBAction)showSettings:(id)sender{
    if(nil == settingsController)
        settingsController = [[SettingsController alloc] init];
    [settingsController showWindow:self];
}


@end
