//
//  GridView.h
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView.h"

@interface GridView : UIView


@property  NSMutableArray *cells;

-(void)changeSubView:(int)i withStatus:(int)s;

@end
