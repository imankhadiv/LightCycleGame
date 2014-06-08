//
//  GridView.m
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import "GridView.h"

@implementation GridView
/*this view initialized 400 cells(20*20). Just (18*18) of them are visible. The first row and the first column and also the last row and the last column are invisible. (those are initialized to help when a player hits the wall.
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float width = (frame.size.width)/18 ;
        _cells = [[NSMutableArray alloc] initWithCapacity:324];
        
        int i = 0 ;
        int k = 0 ;
        while(i<400){
            if([self checkCellLocation:i]){
          
                [self insertSubview:[[CellView alloc] initWithFrame:CGRectMake(0,0,0,i)] atIndex:i] ;
                
                i++;
                continue;
            }
            
            for(int j = 0;j < frame.size.width; j+=width){
                for( int c = 0 ;c < frame.size.width;c+=width){
                    if([self checkCellLocation:i]) {
                        [self insertSubview:[[CellView alloc] initWithFrame:CGRectMake(0, 0,0,i)] atIndex:i];
                        
                        c-=width;
                    }
                    else{
                        _cells[k] = [[CellView alloc] initWithFrame:CGRectMake(c, j,width, width)];
                        
                        [self insertSubview:_cells[k] atIndex:i ];
                        [self addSubview:_cells[k]];
                        k++;
                    }
                    i++;
                }
                
            }
        }
        
    }
    
    return self;
    
}
//this method changes the color of the cell
-(void)changeSubView:(int)i withStatus:(int)s{
    
    NSArray *myViews = [self subviews];
    CellView *v = myViews[i];
    v.status = s;
    [v setNeedsDisplay];
    
}

-(BOOL)checkCellLocation:(int)i {
    
    return ( (i<=20)|| (i%20 == 0) || (380<=i && i<=400) || ((i+1)%20==(0))); //These are boundaries of the grid  
    
}




@end
