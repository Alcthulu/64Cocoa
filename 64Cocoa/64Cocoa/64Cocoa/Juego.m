//
//  Juego.m
//  64Cocoa
//
//  Created by Alvaro on 15/12/2019.
//  Copyright © 2019 AlvaroRosaARG. All rights reserved.
//

#import "Juego.h"

@implementation Juego

-(id) init{
    self = [super init];
    
    if(nil == self)
        return nil;
    
    for(int i=0; i<4; i++){
        for(int j=0; j<4; j++){
            tablero[i][j] = 0;
        }
    }
    
    objetivo = 64;
    return self;
}

-(int) getCasilla: (int)row col:(int)column{
    return tablero[row][column];
}

-(void) setCasilla: (int)value row:(int)row col:(int)column{
    tablero[row][column] = value;
}

-(int) getObjetivo{
    return objetivo;
}

-(void) setObjetivo: (int)value{
    objetivo = value;
}



@end
