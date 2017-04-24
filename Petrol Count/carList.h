//
//  carList.h
//  Petrol Count
//
//  Created by PETRONAS ICT SDN BHD on 22/04/2017.
//  Copyright © 2017 TfqNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTable.h"
#import "DBController.h"

@interface carList : UIViewController

@property (nonatomic,strong) DBController *db;
@property (nonatomic, strong) DataTable *carTbl;
@property (weak, nonatomic) IBOutlet UITableView *car_tableview;

@end
