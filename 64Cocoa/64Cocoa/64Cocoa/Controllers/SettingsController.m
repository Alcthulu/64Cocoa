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
}



-(void) handleTabla:(NSNotification *)aNotification{
    NSDictionary * aDictionary = nil;
    
    
    aDictionary = [aNotification userInfo];
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
        NSString * Valor = casillasTabla[row];
        return Valor;
        
    }
    
    return nil ;
}


/*
 
 
 
 
 ---------------------AQUI CREAR UN HANDLER QUE RECIBA LA NOTIFICACION CON EL OBJETO DEL TIPO DE --------------------------------
 ---------------------DATO CREADO PARA RELlENAR LAS FILAS DE LA TABLA. CON ESTE OBJETO CREAREMOS --------------------------------
 ---------------------LAS CELDAS PARA LA TABLA Y LAS AÑADIREMOS EN CASO DE NO EXISTIR UNA FILA   --------------------------------
 ---------------------CON EL IDENTIFICADOR REFERENTE A ESTA CASILLA. DESDE EL PRINCIPIO SE       --------------------------------
 ---------------------PASARAN TODAS LAS CASILLAS Y SE CREARAN TODAS LAS CASILLAS CON LO CUAL LO  --------------------------------
 ---------------------UNICO QUE HABRÁ QUE HACER SERÁ ACTUALIZARLAS                               --------------------------------
 ---------------------OTRA OPCIÓN ES CADA VEZ QUE LLEGUE UNA NOTIFICACIÓN ELIMINAR TODAS LAS     --------------------------------
 ---------------------CELDAS DE LA TABLA Y AÑADIR LAS CELDAS CORRESPONDIENTES DE LAS CASILLAS QUE--------------------------------
 ---------------------CONTENGAN UN VALOR DISTINTO A CERO                                         --------------------------------
 
 
 
 */

@end
