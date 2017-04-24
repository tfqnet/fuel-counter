//
//  carList.m
//  Petrol Count
//
//  Created by PETRONAS ICT SDN BHD on 22/04/2017.
//  Copyright © 2017 TfqNet. All rights reserved.
//

#import "carList.h"

@interface carList ()

@end

@implementation carList
@synthesize carTbl,db,car_tableview;

- (void)viewDidLoad {
    [super viewDidLoad];
    db = [DBController sharedDatabaseController:@"fuelDB.sqlite"];
    carTbl = [db ExecuteQuery:@"SELECT * FROM car_tbl"];
    
    car_tableview.tableFooterView = [UIView new];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self checkTableCount];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Delegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return carTbl.rows.count;    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    NSArray *row = [carTbl.rows objectAtIndex:indexPath.row];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:MyIdentifier];
    }
    
    // Here we use the provided setImageWithURL: method to load the web image
    // Ensure you use a placeholder image otherwise cells will be initialized with no image
    
    
    
    cell.textLabel.text = [row objectAtIndex:0];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",[row objectAtIndex:2],[row objectAtIndex:1]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark Others

-(void)checkTableCount
{
    UILabel *emptyList = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2-15, self.view.frame.size.width, 30)];
    emptyList.text = @"Register your first car now :)";
    emptyList.textAlignment = NSTextAlignmentCenter;
    emptyList.numberOfLines = 0;
    
    
    [self.view addSubview:emptyList];
    if(carTbl.rows.count<1){
        emptyList.hidden = NO;
    }
    else{
        emptyList.hidden = YES;
    }
    
    
}



@end












