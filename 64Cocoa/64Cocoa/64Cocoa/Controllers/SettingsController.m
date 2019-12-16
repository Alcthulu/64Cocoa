//
//  SettingsController.m
//  64Cocoa
//
//  Created by Alvaro on 15/12/2019.
//  Copyright © 2019 AlvaroRosaARG. All rights reserved.
//

#import "SettingsController.h"

@interface SettingsController ()

@end

@implementation SettingsController


-(id) init {
    if(nil == [super initWithWindowNibName:@"Settings"]) return nil;
    return self;
}

NSString * sendNewDifficulty = @"sendNewDifficulty";

-(IBAction)Easy:(id)sender{
    NSString* dificultad = nil;
    NSDictionary * notificationInfo = nil;
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    dificultad = @"Easy";
    
    notificationInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:dificultad,nil]
                                                   forKeys:[NSArray arrayWithObjects:@"dificultad",nil]];
    [notificationCenter postNotificationName:sendNewDifficulty
                                      object:nil
                                    userInfo:notificationInfo];
    
}

-(IBAction)Normal:(id)sender{
    NSString* dificultad = nil;
    NSDictionary * notificationInfo = nil;
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    dificultad = @"Normal";
    
    notificationInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:dificultad,nil]
                                                   forKeys:[NSArray arrayWithObjects:@"dificultad",nil]];
    [notificationCenter postNotificationName:sendNewDifficulty
                                      object:nil
                                    userInfo:notificationInfo];
    
}

-(IBAction)Hard:(id)sender{
    NSString* dificultad = nil;
    NSDictionary * notificationInfo = nil;
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    dificultad = @"Hard";
    
    notificationInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:dificultad,nil]
                                                   forKeys:[NSArray arrayWithObjects:@"dificultad",nil]];
    [notificationCenter postNotificationName:sendNewDifficulty
                                      object:nil
                                    userInfo:notificationInfo];
    
}

-(IBAction)Title:(id)sender{
    
}

-(IBAction)Size:(id)sender{
    
}

@end
