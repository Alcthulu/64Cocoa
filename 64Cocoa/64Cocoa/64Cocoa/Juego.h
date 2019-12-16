//
//  Juego.h
//  64Cocoa
//
//  Created by Alvaro on 15/12/2019.
//  Copyright © 2019 AlvaroRosaARG. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Juego : NSObject {
    int tablero[4][4];
    int objetivo;
}

-(int) getCasilla: (int)row col:(int)column;
-(void) setCasilla: (int)value row:(int)row col:(int)column;

-(int) getObjetivo;
-(void) setObjetivo: (int)value;



@end

NS_ASSUME_NONNULL_END
