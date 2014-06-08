//
//  MainViewController.h
//  acp13ir
//
//  Created by Iman Rastkhadivmasouleh on 12/11/2013.
//  Copyright (c) 2013 Iman Rastkhadiv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIButton *playButton;

-(IBAction)unwindToMain:(UIStoryboardSegue *)seg;

- (IBAction)startGame:(id)sender;



@end
