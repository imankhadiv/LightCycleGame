//
//  ViewController.h
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 11/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ComputerPlayer.h"
#import "Grid.h"
#import "HumanPlayer.h"
#import "GridView.h"

@interface ViewController : UIViewController
{
    
}
@property (strong, nonatomic) IBOutlet UIView *backButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIView *resultView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


@property (weak, nonatomic) IBOutlet UIImageView *upArrow;


@property (weak, nonatomic) IBOutlet UIImageView *rightArrow;

@property (weak, nonatomic) IBOutlet UIImageView *downArrow;

@property (weak, nonatomic) IBOutlet UIImageView *leftArrow;

- (IBAction)startGame:(id)sender;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event ;

@end
