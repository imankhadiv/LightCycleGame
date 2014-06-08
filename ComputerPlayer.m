//
//  ComputerPlayer.m
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//
/*
 
 The computer player not only can find blue cells of its immediate neighbors (up, down, left, right) but also can decide which of those cells have more blue cells in their neighbors and then those which have more blue cells have more priority. In other words if the next move to top has three blue cells, to left has two blue cells and to left also has 3 blue cells the computer chooses randomly between top and left.
 */
#import "ComputerPlayer.h"

@implementation ComputerPlayer
{
    Grid *grid;
    bool flag;
}


@synthesize computerHeadPositon ;

-(id)initWithGrid:(Grid *)grd {
    self = [super init];
    if(self) {
        
        grid = grd ;
        computerHeadPositon = 130 ;
        flag = 1;
        
    }
    return self ;
}

-(void)move {
    //flag is used to force computer initialy move towards player
    if (flag) {
        computerHeadPositon+=20;
        flag = 0 ;
    }
    
    else if([self checkIfBoxedIn:computerHeadPositon]){
        NSLog(@"Game Over! Player Won");
    }
    else {
        
        int random = [self getBlueCellsIndex:computerHeadPositon];
        
        switch (random) {
            case 0:
                computerHeadPositon-=20;
                break;
            case 1:
                
                computerHeadPositon+=1;
                break;
            case 2:
                
                computerHeadPositon+=20;
                break;
            case 3:
                computerHeadPositon-=1;
                break;
            default:
                break;
        }
        
    }
}
-(BOOL)checkIfBoxedIn:(int)pos {
    if ([self checkCollsion:(pos-20)]&&[self checkCollsion:(pos+20)]&&[self checkCollsion:(pos+1) ] && [self checkCollsion:(pos-1)]){
        return true;
    }
    return false;
}

-(BOOL)checkCollsion:(int)pos {
    
    int num = [grid getCellState:pos];
    return (num==1 || num==3 || num ==2) ;
}

-(int)getBlueCellsIndex:(int)pos {
    //up is the state of the top cell
    int up = [grid getCellState:(pos-20)];
    int upPPos=0;
    if(up==0){
        
        upPPos = [self countBlueCells:(pos-20)]; //upPPos is the number of blue cells of top cell
    }
    int right = [grid getCellState:(pos+1)];
    int rightPPos = 0;
    if(right==0){
        rightPPos = [self countBlueCells:(pos+1)];
    }
    int bottom = [grid getCellState:(pos+20)];
    int bottomPPos = 0;
    if(bottom==0){
        bottomPPos = [self countBlueCells:(pos+20)];
    }
    int left = [grid getCellState:(pos-1)];
    int leftPPos = 0;
    if(left ==0) {
        leftPPos = [self countBlueCells:(pos-1)];
    }
    
    
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    [temp addObject:[NSNumber numberWithInt:up]];
    [temp addObject:[NSNumber numberWithInt:right]];
    [temp addObject:[NSNumber numberWithInt:bottom]];
    [temp addObject:[NSNumber numberWithInt:left]];
    //firstPriorityMovementArray holds directions which have 3 blue cells
    NSMutableArray *firstPriorityMovmentArray = [[NSMutableArray alloc] init];
    NSMutableArray *secondPiorityMovementArray = [[NSMutableArray alloc] init];
    NSMutableArray *lastPriorityMovementArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<4; i++) {
        NSNumber *num = [temp objectAtIndex:i];
        if (i==0){
            //if top cell was blue and it had three blue cells
            if ([num intValue]==0 && upPPos==3){
                [firstPriorityMovmentArray addObject:[NSNumber numberWithInt:i]];
                
            }
            //if top cell was blue and it had three blue cells
            
            else if ([num intValue]==0 &&upPPos==2){
                [secondPiorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }
            else if ([num intValue]==0 && upPPos==1){
                [lastPriorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }
        }
        else if (i==1) {
            if ([num intValue]==0&&(rightPPos==3)){
                [firstPriorityMovmentArray addObject:[NSNumber numberWithInt:i]];
            }
            else if ([num intValue]==0 &&rightPPos==2){
                [secondPiorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }
            else if ([num intValue]==0 && (rightPPos==1)){
                [lastPriorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }}
        else if (i==2){
            if ([num intValue]==0&&(bottomPPos==3)){
                [firstPriorityMovmentArray addObject:[NSNumber numberWithInt:i]];
            }
            else if ([num intValue]==0 &&bottomPPos==2){
                [secondPiorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }
            else if ([num intValue]==0 && (bottomPPos==1)){
                [lastPriorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }
        }
        else if (i==3){
            if ([num intValue]==0&&(leftPPos==3)){
                [firstPriorityMovmentArray addObject:[NSNumber numberWithInt:i]];
            }
            else if ([num intValue]==0 &&leftPPos==2){
                [secondPiorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }
            else if ([num intValue]==0 && (leftPPos==1)){
                [lastPriorityMovementArray addObject:[NSNumber numberWithInt:i]];
            }}
    }
    
    int numberOfPossibleMovement1 = [firstPriorityMovmentArray count];
    int numberOfPossibleMovement2 = [secondPiorityMovementArray count];
    int numberOfPossibleMovement3 = [lastPriorityMovementArray count];
    NSLog(@"number of possible movements 1:%i",numberOfPossibleMovement1);
    NSLog(@"number of possible movements 2:%i",numberOfPossibleMovement2);
    NSLog(@"number of possible movements 3:%i",numberOfPossibleMovement3);
    
    if ( numberOfPossibleMovement1 > 0){
        int random = arc4random() % numberOfPossibleMovement1 ;
        
        return [[firstPriorityMovmentArray objectAtIndex:random] intValue];
    }
    else if ( numberOfPossibleMovement2 > 0){
        int random = arc4random() % numberOfPossibleMovement2 ;
        
        return [[secondPiorityMovementArray objectAtIndex:random] intValue];
    }
    else if  ( numberOfPossibleMovement3 > 0){
        int random = arc4random() % numberOfPossibleMovement3 ;
        
        return [[lastPriorityMovementArray objectAtIndex:random] intValue];
    }
    else {
        //this force computer to go to its last blue cell
        for (int i =0 ;i < 4 ;i++) {
            NSNumber *number = [temp objectAtIndex:i];
            int n = [number intValue];
            if (n==0){
                return i;
            }
            
        }
        return 1;
    }
    
}

-(int)countBlueCells:(int)pos {
    int count = 0 ;
    if ([grid getCellState:(pos+20)]==0)
    {
        count+=1;
    }
    if ([grid getCellState:(pos+1)]==0){
        count+=1;
    }
    if ([grid getCellState:(pos-20)]==0){
        
        count+=1;
    }
    if ([grid getCellState:(pos-1)]==0){
        
        count+=1;
    }
    return count;
}


@end
