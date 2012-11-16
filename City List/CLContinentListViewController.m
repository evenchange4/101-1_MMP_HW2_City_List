//
//  CLContinentListViewController.m
//  City List
//
//  Created by MichaelHsu on 12/10/24.
//  Copyright (c) 2012年 MichaelHsu. All rights reserved.
//

#import "CLContinentListViewController.h"
#import "CLContinentCell.h"
#import "CLDataSource.h"
#import "CLCityListViewController.h"

@interface CLContinentListViewController ()

@end

@implementation CLContinentListViewController
 
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    NSLog(@"%d", [[[CLDataSource sharedDataSource] arrayWithContinent] count]);
    return [[[CLDataSource sharedDataSource] arrayWithContinent] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%@", [[CLDataSource sharedDataSource] arrayWithContinent] [section]);
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"continentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch airport data by index path from city list
    NSUInteger section = indexPath.section;
//    NSUInteger row = 1;
//    NSString *continentsection = [[CLDataSource sharedDataSource] arrayWithContinent][section];
    NSDictionary *continent = [[CLDataSource sharedDataSource] arrayWithContinent][section];
//    NSLog(@"%@", continent);

    // Assign values to views in cell
    CLContinentCell *continentCell = (CLContinentCell *)cell;
    continentCell.continentName.text = continent;
    
    return cell;
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *cell = (UITableViewCell *)sender;

    if ([segue.identifier isEqualToString:@"showCityList"]) {
        // Fetch data by index path from data source
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        //  選到第幾個section
        NSUInteger section = indexPath.section;
//        NSUInteger row = indexPath.row;
        //  選到的continent name
        NSString *continent = [[CLDataSource sharedDataSource] arrayWithContinent][section];
//        NSDictionary *country = [[CLDataSource sharedDataSource] arrayWithCountryInContinent:continent];
//        NSDictionary *city = [[CLDataSource sharedDataSource] arrayWithCityInContinent:continent];

        NSLog(@"點選 %@", continent);

        // Feed data to the destination of the segue
        CLCityListViewController *listCityPage = segue.destinationViewController;
        
        listCityPage.passContinent = continent;
//        NSLog(@"%@", listCityPage.passContinent);

    }
}
@end
