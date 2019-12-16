//
//  MainMenuController.h
//  64Cocoa
//
//  Created by Alvaro on 15/12/2019.
//  Copyright © 2019 AlvaroRosaARG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

#import "Juego.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainMenuController : NSObject{
    Juego * juego;
    IBOutlet NSTextField * Label0x0;
    IBOutlet NSTextField * Label0x1;
    IBOutlet NSTextField * Label0x2;
    IBOutlet NSTextField * Label0x3;
    IBOutlet NSTextField * Label1x0;
    IBOutlet NSTextField * Label1x1;
    IBOutlet NSTextField * Label1x2;
    IBOutlet NSTextField * Label1x3;
    IBOutlet NSTextField * Label2x0;
    IBOutlet NSTextField * Label2x1;
    IBOutlet NSTextField * Label2x2;
    IBOutlet NSTextField * Label2x3;
    IBOutlet NSTextField * Label3x0;
    IBOutlet NSTextField * Label3x1;
    IBOutlet NSTextField * Label3x2;
    IBOutlet NSTextField * Label3x3;
    
    IBOutlet NSTextField * Objetivo;
    IBOutlet NSTextField * Win;
    IBOutlet NSTextField * Lose;
    IBOutlet NSButton * PlayButton;
    
    IBOutlet NSWindow * window;
    
    
        
    
}

-(IBAction)showSettings:(id)sender;
-(IBAction)playAction:(id)sender;
-(IBAction)MoveDown:(id)sender;
-(IBAction)MoveUp:(id)sender;
-(IBAction)MoveRight:(id)sender;
-(IBAction)MoveLeft:(id)sender;

-(Boolean) isFull;
-(void) reset;
-(void) nuevoNumero;
@end

NS_ASSUME_NONNULL_END
