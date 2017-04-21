//
//  DetailViewController.h
//  Petrol Count
//
//  Created by PETRONAS ICT SDN BHD on 22/04/2017.
//  Copyright © 2017 TfqNet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

