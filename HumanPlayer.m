//
//  HumanPlayer.m
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import "HumanPlayer.h"

@implementation HumanPlayer
{
    Grid *grid ;
}
@synthesize playerHeadPosition ;

-(id)initWithGrid:(Grid *)grd {
    self = [super init];
    if(self) {
        
        grid = grd ;
        playerHeadPosition = 270 ;
        
    }
    return self ;
}
-(void)moveTo:(int)direction {
    
    if([self checkIfBoxedIn:playerHeadPosition]){
        NSLog(@"Game Over! human player lost!");
    }
    else {
        
        switch (direction) {
            case 0:
                playerHeadPosition-=20;
                break;
            case 1:
                
                playerHeadPosition+=1;
                break;
            case 2:
                
                playerHeadPosition+=20;
                break;
            case 3:
                
                playerHeadPosition-=1;
                break;
                
        }
       
    }
}
-(BOOL)checkIfBoxedIn:(int)pos {
    return ([self checkCollsion:(pos-20)]&&[self checkCollsion:(pos+20)] && [self checkCollsion:(pos+1)]&&[self checkCollsion:(pos-1)]);
}

//checks if the player is in the blue cell
-(BOOL)checkCollsion:(int)pos {
    
    int num = [grid getCellState:pos];
    return (num==1 || num==3 || num ==2) ;
}

@end
