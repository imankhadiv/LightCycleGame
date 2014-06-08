//
//  ComputerPlayer.h
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grid.h"

@interface ComputerPlayer : NSObject

@property int computerHeadPositon ;

-(id)initWithGrid:(Grid *)grd;
-(void)move;
-(BOOL)checkCollsion:(int)pos ;


@end
