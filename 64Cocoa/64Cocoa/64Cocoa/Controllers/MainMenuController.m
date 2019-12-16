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

@implementation MainMenuController{
    SettingsController * settingsController;
    Boolean win;
}

-(id) init {
    self = [super init];
    
    if(nil == self)
        return nil;
    if(nil == tableroLabels){
        tableroLabels[0][0] = Label0x0;
        tableroLabels[0][1] = Label0x1;
        tableroLabels[0][2] = Label0x2;
        tableroLabels[0][3] = Label0x3;
        tableroLabels[1][0] = Label1x0;
        tableroLabels[1][1] = Label1x1;
        tableroLabels[1][2] = Label1x2;
        tableroLabels[1][3] = Label1x3;
        tableroLabels[2][0] = Label2x0;
        tableroLabels[2][1] = Label2x1;
        tableroLabels[2][2] = Label2x2;
        tableroLabels[2][3] = Label2x3;
        tableroLabels[3][0] = Label3x0;
        tableroLabels[3][1] = Label3x1;
        tableroLabels[3][2] = Label3x2;
        tableroLabels[3][3] = Label3x3;
    }
    if(nil == juego){
        juego = [[Juego alloc] init];
    }
    
    win = false;
    
    return self;
}

-(IBAction)showSettings:(id)sender{
    if(nil == settingsController)
        settingsController = [[SettingsController alloc] init];
    [settingsController showWindow:self];
}

-(Boolean)MoveDown{
    Boolean movimiento = false;
    Boolean sumado[4] = { false, false, false, false};
    for(int columna = 0; columna < 4; columna++){
        for (int fila = 2; fila >= 0; fila--) {
            if([juego getCasilla:fila col:columna] != 0){
                for( int k = fila; k < 3; k++){
                    if([juego getCasilla:k+1 col:columna] == 0){
                        [juego setCasilla:[juego getCasilla:k col:columna] row:k+1 col:columna];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:k col:columna];
                        //modificar tambien el contenido del label
                        movimiento = true;
                    }
                    else if ([juego getCasilla:k+1 col:columna] == [juego getCasilla:k col:columna] && !sumado[columna]){
                        [juego setCasilla:[juego getCasilla:k col:columna]*2 row:k+1 col:columna];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:k col:columna];
                        //modificar tambien el contenido del label
                        movimiento = true;
                        sumado[columna] = true;
                        if([juego getCasilla:k+1 col:columna] == [juego getObjetivo]) win = true;
                    }
                }
            }
        }
    }
    return movimiento;
}

-(Boolean)MoveUp{
    Boolean movimiento = false;
    Boolean sumado[4] = { false, false, false, false};
    for(int columna = 0; columna < 4; columna++){
        for (int fila = 1; fila < 4; fila++) {
            if([juego getCasilla:fila col:columna] != 0){
                for( int k = fila; k > 0; k--){
                    if([juego getCasilla:k-1 col:columna] == 0){
                        [juego setCasilla:[juego getCasilla:k col:columna] row:k-1 col:columna];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:k col:columna];
                        //modificar tambien el contenido del label
                        movimiento = true;
                    }
                    else if ([juego getCasilla:k-1 col:columna] == [juego getCasilla:k col:columna] && !sumado[columna]){
                        [juego setCasilla:[juego getCasilla:k col:columna]*2 row:k-1 col:columna];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:k col:columna];
                        //modificar tambien el contenido del label
                        movimiento = true;
                        sumado[columna] = true;
                        if([juego getCasilla:k-1 col:columna] == [juego getObjetivo]) win = true;
                    }
                }
            }
        }
    }
    return movimiento;
}

-(Boolean)MoveRight{
    Boolean movimiento = false;
    Boolean sumado[4] = { false, false, false, false};
    for(int fila = 0; fila < 4; fila++){
        for (int columna = 2; columna >= 0; columna--) {
            if([juego getCasilla:fila col:columna] != 0){
                for( int k = columna; k < 3; k++){
                    if([juego getCasilla:fila col:k+1] == 0){
                        [juego setCasilla:[juego getCasilla:fila col:k] row:fila col:k+1];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:fila col:k];
                        //modificar tambien el contenido del label
                        movimiento = true;
                    }
                    else if ([juego getCasilla:fila col:k+1] == [juego getCasilla:fila col:k] && !sumado[fila]){
                        [juego setCasilla:[juego getCasilla:fila col:k]*2 row:fila col:k+1];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:fila col:k];
                        //modificar tambien el contenido del label
                        movimiento = true;
                        sumado[fila] = true;
                        if([juego getCasilla:fila col:k+1] == [juego getObjetivo]) win = true;
                    }
                }
            }
        }
    }
    return movimiento;
}

-(Boolean)MoveLeft{
    Boolean movimiento = false;
    Boolean sumado[4] = { false, false, false, false};
    for(int fila = 0; fila < 4; fila++){
        for (int columna = 1; columna < 4; columna++) {
            if([juego getCasilla:fila col:columna] != 0){
                for( int k = columna; k > 0; k--){
                    if([juego getCasilla:fila col:k-1] == 0){
                        [juego setCasilla:[juego getCasilla:fila col:k] row:fila col:k-1];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:fila col:k];
                        //modificar tambien el contenido del label
                        movimiento = true;
                    }
                    else if ([juego getCasilla:fila col:k-1] == [juego getCasilla:fila col:k] && !sumado[fila]){
                        [juego setCasilla:[juego getCasilla:fila col:k]*2 row:fila col:k-1];
                        //modificar tambien el contenido del label
                        [juego setCasilla:0 row:fila col:k];
                        //modificar tambien el contenido del label
                        movimiento = true;
                        sumado[fila] = true;
                        if([juego getCasilla:fila col:k-1] == [juego getObjetivo]) win = true;
                    }
                }
            }
        }
    }
    return movimiento;
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
            //asignar el valor al label también
        }
    }
    win = false;
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
}

@end
