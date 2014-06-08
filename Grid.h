//
//  Grid.h
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grid : NSObject

@property NSMutableArray * cells ;

-(void)changeCellState:(int)cellNumber with:(int)color;

-(int)getCellState:(int)cellNumber ;

@end
