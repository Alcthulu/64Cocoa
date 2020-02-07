//
//  MainMenuController.m
//  64Cocoa
//
//  Created by Alvaro on 15/12/2019.
//  Copyright © 2019 AlvaroRosaARG. All rights reserved.
//
#import <Cocoa/Cocoa.h>

#import "MainMenuController.h"
#import "SettingsController.h"

@interface MainMenuController(){
    SettingsController * settingsController;}
@end

@implementation MainMenuController{
    Boolean jugando;
}


-(id) init {
    self = [super init];
    
    if(nil == self)
        return nil;
    
    settingsController = [[SettingsController alloc] init];
    //[settingsController showWindow:self];

    
    if(nil == juego){
        juego = [[Juego alloc] init];
    }
    

    jugando = false;
    
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(handleNuevoObjetivo:)
                           name:sendNewDifficulty
                           object:nil];
    [notificationCenter addObserver:self
                           selector:@selector(handleNuevoTitulo:)
                               name:sendNewTitle
                             object:nil];
    
    
    return self;
}

NSString * updateTable = @"updateTable";

extern NSString * sendNewDifficulty;
extern NSString * sendNewTitle;


//metodo para enviar las notificaciones de actualización de la tabla
-(void)enviarEstadoParaTabla{
    
    NSString* tablero[16];
    NSDictionary * notificationInfo = nil;
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    
    for (int i=0; i<4; i++){
        for (int j=0; j<4; j++){
            if([juego getCasilla:i col:j] <= 0){
                tablero [j+(i*4)] = @"";
            }else{
                tablero [j+(i*4)] = [NSString stringWithFormat:@"%d",[juego getCasilla:i col:j]];
            }
        }
    }
    
    
    notificationInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:tablero[0],tablero[1],tablero[2],tablero[3],tablero[4],tablero[5], tablero[6],tablero[7],tablero[8],tablero[9],tablero[10],tablero[11],tablero[12],tablero[13],tablero[14],tablero[15],nil]
                                                   forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",nil]];
    [notificationCenter postNotificationName:updateTable
                                      object:nil
                                    userInfo:notificationInfo];
}

-(void) handleNuevoObjetivo:(NSNotification *)aNotification{
    NSDictionary * aDictionary = nil;
    NSString * dificultad;
    
    aDictionary = [aNotification userInfo];
    dificultad = [aDictionary objectForKey:@"dificultad"];
    
    if([dificultad isEqualToString:@"Easy"]){
        [juego setObjetivo:64];
        [Objetivo setStringValue:[NSString stringWithFormat:@"%d", [juego getObjetivo]]];
    }else  if([dificultad isEqualToString:@"Normal"]){
        [juego setObjetivo:2048];
        [Objetivo setStringValue:[NSString stringWithFormat:@"%d", [juego getObjetivo]]];
    }else  if([dificultad isEqualToString:@"Hard"]){
        [juego setObjetivo:4096];
        [Objetivo setStringValue:[NSString stringWithFormat:@"%d", [juego getObjetivo]]];
    }

}

-(void) handleNuevoTitulo:(NSNotification *)aNotification{
    NSDictionary * aDictionary = nil;
    NSString * titulo;
    
    aDictionary = [aNotification userInfo];
    titulo = [aDictionary objectForKey:@"titulo"];
    
    [window setTitle:titulo];
    
}



-(IBAction)showSettings:(id)sender{
    [settingsController showWindow:self];
}

-(IBAction)playAction:(id)sender{
    if(!jugando){
        jugando = true;
        [self nuevoNumero];
        [PlayButton setTitle:@"Restart"];
        [Objetivo setStringValue:[NSString stringWithFormat:@"%d", [juego getObjetivo]]];
        /*
         
         
         ENVIAR NOTIFICACION----------------------------------------------
         
         
         
         */
        [self enviarEstadoParaTabla];
    }else{
        [self reset];
        jugando = false;
    }
}

-(IBAction)MoveDown:(id)sender{
    if(jugando){
        Boolean movimiento = false;
        Boolean sumado[4] = { false, false, false, false};
        for(int columna = 0; columna < 4; columna++){
            for (int fila = 2; fila >= 0; fila--) {
                if([juego getCasilla:fila col:columna] != 0){
                    for( int k = fila; k < 3; k++){
                        if([juego getCasilla:k+1 col:columna] == 0){
                            [juego setCasilla:[juego getCasilla:k col:columna] row:k+1 col:columna];
                            [[self getLabel:k+1 columna:columna] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:k+1 col:columna]]];
                            [juego setCasilla:0 row:k col:columna];
                            [[self getLabel:k columna:columna] setStringValue:@""];
                            movimiento = true;
                        }
                        else if ([juego getCasilla:k+1 col:columna] == [juego getCasilla:k col:columna] && !sumado[columna]){
                            [juego setCasilla:[juego getCasilla:k col:columna]*2 row:k+1 col:columna];
                            [[self getLabel:k+1 columna:columna] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:k+1 col:columna]]];
                            [juego setCasilla:0 row:k col:columna];
                            [[self getLabel:k columna:columna] setStringValue:@""];
                            movimiento = true;
                            sumado[columna] = true;
                            if([juego getCasilla:k+1 col:columna] == [juego getObjetivo]) [self win];
                        }
                    }
                }
            }
        }
        if(movimiento){
            [self nuevoNumero];
        }else if([self isFull]){
            [self lose];
        }
        /*
         
         
         ENVIAR NOTIFICACION----------------------------------------------
         
         
         
         */
        [self enviarEstadoParaTabla];

    }
}

-(IBAction)MoveUp:(id)sender{
    if(jugando){
        Boolean movimiento = false;
        Boolean sumado[4] = { false, false, false, false};
        for(int columna = 0; columna < 4; columna++){
            for (int fila = 1; fila < 4; fila++) {
                if([juego getCasilla:fila col:columna] != 0){
                    for( int k = fila; k > 0; k--){
                        if([juego getCasilla:k-1 col:columna] == 0){
                            [juego setCasilla:[juego getCasilla:k col:columna] row:k-1 col:columna];
                            [[self getLabel:k-1 columna:columna] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:k-1 col:columna]]];
                            [juego setCasilla:0 row:k col:columna];
                            [[self getLabel:k columna:columna] setStringValue:@""];
                            movimiento = true;
                        }
                        else if ([juego getCasilla:k-1 col:columna] == [juego getCasilla:k col:columna] && !sumado[columna]){
                            [juego setCasilla:[juego getCasilla:k col:columna]*2 row:k-1 col:columna];
                            [[self getLabel:k-1 columna:columna] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:k-1 col:columna]]];
                            [juego setCasilla:0 row:k col:columna];
                            [[self getLabel:k columna:columna] setStringValue:@""];
                            movimiento = true;
                            sumado[columna] = true;
                            if([juego getCasilla:k-1 col:columna] == [juego getObjetivo]) [self win];
                        }
                    }
                }
            }
        }
        if(movimiento){
            [self nuevoNumero];
        }else if([self isFull]){
            [self lose];
        }
        /*
         
         
         ENVIAR NOTIFICACION----------------------------------------------
         
         
         
         */
        [self enviarEstadoParaTabla];

    }
}

-(IBAction)MoveRight:(id)sender{
    if(jugando){
        Boolean movimiento = false;
        Boolean sumado[4] = { false, false, false, false};
        for(int fila = 0; fila < 4; fila++){
            for (int columna = 2; columna >= 0; columna--) {
                if([juego getCasilla:fila col:columna] != 0){
                    for( int k = columna; k < 3; k++){
                        if([juego getCasilla:fila col:k+1] == 0){
                            [juego setCasilla:[juego getCasilla:fila col:k] row:fila col:k+1];
                            [[self getLabel:fila columna:k+1] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:fila col:k+1]]];
                            [juego setCasilla:0 row:fila col:k];
                            [[self getLabel:fila columna:k] setStringValue:@""];
                            movimiento = true;
                        }
                        else if ([juego getCasilla:fila col:k+1] == [juego getCasilla:fila col:k] && !sumado[fila]){
                            [juego setCasilla:[juego getCasilla:fila col:k]*2 row:fila col:k+1];
                            [[self getLabel:fila columna:k+1] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:fila col:k+1]]];
                            [juego setCasilla:0 row:fila col:k];
                            [[self getLabel:fila columna:k] setStringValue:@""];
                            movimiento = true;
                            sumado[fila] = true;
                            if([juego getCasilla:fila col:k+1] == [juego getObjetivo]) [self win];
                        }
                    }
                }
            }
        }
        if(movimiento){
            [self nuevoNumero];
        }else if([self isFull]){
            [self lose];
        }
        /*
         
         
         ENVIAR NOTIFICACION----------------------------------------------
         
         
         
         */
        [self enviarEstadoParaTabla];

    }
}

-(IBAction)MoveLeft:(id)sender{
    if(jugando){
        Boolean movimiento = false;
        Boolean sumado[4] = { false, false, false, false};
        for(int fila = 0; fila < 4; fila++){
            for (int columna = 1; columna < 4; columna++) {
                if([juego getCasilla:fila col:columna] != 0){
                    for( int k = columna; k > 0; k--){
                        if([juego getCasilla:fila col:k-1] == 0){
                            [juego setCasilla:[juego getCasilla:fila col:k] row:fila col:k-1];
                            [[self getLabel:fila columna:k-1] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:fila col:k-1]]];
                            [juego setCasilla:0 row:fila col:k];
                            [[self getLabel:fila columna:k] setStringValue:@""];
                            movimiento = true;
                        }
                        else if ([juego getCasilla:fila col:k-1] == [juego getCasilla:fila col:k] && !sumado[fila]){
                            [juego setCasilla:[juego getCasilla:fila col:k]*2 row:fila col:k-1];
                            [[self getLabel:fila columna:k-1] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:fila col:k-1]]];
                            [juego setCasilla:0 row:fila col:k];
                            [[self getLabel:fila columna:k] setStringValue:@""];
                            movimiento = true;
                            sumado[fila] = true;
                            if([juego getCasilla:fila col:k-1] == [juego getObjetivo]) [self win];
                        }
                    }
                }
            }
        }
        if(movimiento){
            [self nuevoNumero];
        }else if([self isFull]){
            [self lose];
        }
        /*
         
         
         ENVIAR NOTIFICACION----------------------------------------------
         
         
         
         */
        [self enviarEstadoParaTabla];

    }
}

-(Boolean) isFull{
    Boolean full = true;
    for( int fila = 0; fila < 4; fila++){
        for( int columna = 0; columna < 4; columna++){
            if([juego getCasilla:fila col:columna] == 0){
                full = false;
                return full;
            }
        }
    }
    return full;
}

-(void) reset{
    for( int fila = 0; fila < 4; fila++){
        for( int columna = 0; columna < 4; columna++){
            [juego setCasilla:0 row:fila col:columna];
            [[self getLabel:fila columna:columna] setStringValue:@""];
        }
    }
    [PlayButton setTitle:@"Play"];
    [Win setStringValue:@""];
    [Lose setStringValue:@""];
}

-(void) nuevoNumero{
    int numero = arc4random() % 2;
    if( numero == 1) numero = 2;
    else numero = 4;
    int fila, columna;
    do {
        fila = arc4random() % 4;
        columna = arc4random() % 4;
    } while ([juego getCasilla:fila col:columna] != 0);
    [juego setCasilla:numero row:fila col:columna];
    [[self getLabel:fila columna:columna] setStringValue:[NSString stringWithFormat:@"%d",[juego getCasilla:fila col:columna]]];
}

-(NSTextField*) getLabel:(int)row columna:(int)column{
    switch (row)
    {
        case 0:
            switch (column)
        {
            case 0:
                return Label0x0;
                break;
            case 1:
                return Label0x1;
                break;
            case 2:
                return Label0x2;
                break;
            case 3:
                return Label0x3;
                break;
        }
            break;
        case 1:
            switch (column)
        {
            case 0:
                return Label1x0;
                break;
            case 1:
                return Label1x1;
                break;
            case 2:
                return Label1x2;
                break;
            case 3:
                return Label1x3;
                break;
        }
            break;
        case 2:
            switch (column)
        {
            case 0:
                return Label2x0;
                break;
            case 1:
                return Label2x1;
                break;
            case 2:
                return Label2x2;
                break;
            case 3:
                return Label2x3;
                break;
                
        }
            break;
        case 3:
            switch (column)
        {
            case 0:
                return Label3x0;
                break;
            case 1:
                return Label3x1;
                break;
            case 2:
                return Label3x2;
                break;
            case 3:
                return Label3x3;
                break;
        }
            break;
    }
    return nil;
}

-(void) win{
    jugando = false;
    [Win setStringValue:@"YOU WIN"];
}

-(void) lose{
    jugando = false;
    [Lose setStringValue:@"YOU LOSE"];
}

@end
