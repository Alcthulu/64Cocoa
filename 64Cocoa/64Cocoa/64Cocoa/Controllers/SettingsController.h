//
//  SettingsController.h
//  64Cocoa
//
//  Created by Alvaro on 15/12/2019.
//  Copyright © 2019 AlvaroRosaARG. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsController : NSWindowController{
    
    IBOutlet NSTextField * titleTextField;
    IBOutlet NSButton * Easy;
    IBOutlet NSButton * Normal;
    IBOutlet NSButton * Hard;

}

@end

NS_ASSUME_NONNULL_END
