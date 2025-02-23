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
    
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(handleTabla:)
                               name:updateTable
                             object:nil];
    
    casillasTabla[0] = @"0x0";
    casillasTabla[1] = @"0x1";
    casillasTabla[2] = @"0x2";
    casillasTabla[3] = @"0x3";
    casillasTabla[4] = @"1x0";
    casillasTabla[5] = @"1x1";
    casillasTabla[6] = @"1x2";
    casillasTabla[7] = @"1x3";
    casillasTabla[8] = @"2x0";
    casillasTabla[9] = @"2x1";
    casillasTabla[10] = @"2x2";
    casillasTabla[11] = @"2x3";
    casillasTabla[12] = @"3x0";
    casillasTabla[13] = @"3x1";
    casillasTabla[14] = @"3x2";
    casillasTabla[15] = @"3x3";
    
    [Tabla reloadData];
    
    
    return self;
}

NSString * sendNewDifficulty = @"sendNewDifficulty";
NSString * sendNewTitle = @"sendNewTitle";

extern NSString * updateTable;


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
    NSString* titulo = nil;
    NSDictionary * notificationInfo = nil;
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    titulo = [titleTextField stringValue];
    
    notificationInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:titulo,nil]
                                                   forKeys:[NSArray arrayWithObjects:@"titulo",nil]];
    [notificationCenter postNotificationName:sendNewTitle
                                      object:nil
                                    userInfo:notificationInfo];
    
    
}



-(void) handleTabla:(NSNotification *)aNotification{
    NSDictionary * aDictionary = nil;
    aDictionary = [aNotification userInfo];
    
    for (int i=0; i<16; i++){
         valoresTabla[i] = [aDictionary objectForKey:[NSString stringWithFormat:@"%d", i]];
    }
    [Tabla reloadData];
    
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return 16;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{//devuelve el objeto de la fila row y columna tableColumn
    NSString * column=[tableColumn identifier];    
    
    if([column  isEqualToString:@"Casilla"]){
        NSString * Casilla = casillasTabla[row];
        return Casilla;
        
    }
    if([column  isEqualToString:@"Valor"]){
        NSString * Valor = valoresTabla[row];
        return Valor;
        
    }
    
    return nil ;
}

@end
