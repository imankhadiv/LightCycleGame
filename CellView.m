//
//  CellView.m
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import "CellView.h"

@implementation CellView
@synthesize status;

- (id)initWithFrame:(CGRect)frame and:(int)i

{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        status = i;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext() ;
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    [self setCellColor:status];
    
    CGContextSetLineWidth(context,1);
    CGContextFillRect(context, rect);
    CGContextStrokeRect(context,rect);
}


//each cell can have four color,blue,red,green and gray (gray shows the collison)
-(void)setCellColor:(int)i {
    CGContextRef con = UIGraphicsGetCurrentContext() ;
    
    if (i==0) {
        CGContextSetFillColorWithColor(con,[UIColor blueColor].CGColor);
        
    } else if (i==1){
        CGContextSetFillColorWithColor(con,[UIColor greenColor].CGColor);
    }
    else if (i== 2) {
        CGContextSetFillColorWithColor(con,[UIColor redColor].CGColor);
    }
    else
        
        CGContextSetFillColorWithColor(con,[UIColor grayColor
                                            ].CGColor);
}




@end
