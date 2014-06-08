//
//  HumanPlayer.h
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grid.h"

@interface HumanPlayer : NSObject

@property int playerHeadPosition ;

-(id)initWithGrid:(Grid *)grd;
-(void)moveTo:(int)direction;
-(BOOL)checkCollsion:(int)pos ;


@end
