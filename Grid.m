//
//  Grid.m
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import "Grid.h"
#define  BLUE 0
#define GREEN 1
#define RED 2
#define HIDDEN 3

@implementation Grid
@synthesize cells ;
//Grid model instantiates a mutable array with size of 400. (
- (id)init
{
    self = [super init];
    if (self) {
        cells = [[NSMutableArray alloc] initWithCapacity:400];
        for (int i = 0 ; i<400; i++) {
            if([self checkCellLocation:i]) {
                cells[i] = [NSNumber numberWithInt:HIDDEN];
            }
            else if (i==130) {
                cells[i] =[NSNumber numberWithInt:RED];
            }
            else if (i==270){
                cells[i] = [NSNumber numberWithInt:GREEN];
                
            }
            else {
                cells[i] = [NSNumber numberWithInt:BLUE] ;
            }
        }
        
    }
    return self;
}

-(void)changeCellState:(int)cellNumber with:(int)color {
    cells[cellNumber] =[NSNumber numberWithInt:color]; ;
}
//this method identify the boundaries ( when a player hitts the wall)
-(BOOL)checkCellLocation:(int)i {
    
    return ( (i<=20)|| (i%20 == 0) || (380<=i && i<=400) || ((i+1)%20==(0)));
    
}
-(int)getCellState:(int)cellNumber {
    NSNumber *number = cells[cellNumber];
    return [number intValue];
}


@end
