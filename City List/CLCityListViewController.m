//
//  CLCityListViewController.m
//  City List
//
//  Created by MichaelHsu on 12/10/24.
//  Copyright (c) 2012年 MichaelHsu. All rights reserved.
//

#import "CLCityListViewController.h"
#import "CLDataSource.h"
#import "CLCityCell.h"
#import "CLDetailViewController.h"

@interface CLCityListViewController ()

@end

@implementation CLCityListViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[[CLDataSource sharedDataSource] arrayWithCountryInContinent:_passContinent] count];
//    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[CLDataSource sharedDataSource] arrayWithCountryInContinent:_passContinent][section];
//    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *country = [[CLDataSource sharedDataSource] arrayWithCountryInContinent:_passContinent][section];
//    NSLog(@"%@", country);
    return [[[CLDataSource sharedDataSource] arrayWithCityInContinent:_passContinent :country] count];
//    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Fetch airport data by index path from city list
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    NSString *country = [[CLDataSource sharedDataSource] arrayWithCountryInContinent:_passContinent][section];

    NSDictionary *city = [[CLDataSource sharedDataSource] arrayWithCityInContinent:_passContinent :country][row];
    
    // Assign values to views in cell
    CLCityCell *cityCell = (CLCityCell *)cell;
    cityCell.cityName.text = city[CLDataSourceDictKeyCity];
    
    return cell;
}

#pragma mark - Storyboard

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *cell = (UITableViewCell *)sender;
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        // Fetch data by index path from data source
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        //  選到第幾個section
        NSUInteger section = indexPath.section;
        NSUInteger row = indexPath.row;
        //  選到的continent name
//        NSString *contient = [[CLDataSource sharedDataSource] arrayWithContinent][section];
        NSDictionary *country = [[CLDataSource sharedDataSource] arrayWithCountryInContinent:_passContinent][section];
        NSDictionary *city = [[CLDataSource sharedDataSource] arrayWithCityInContinent:_passContinent :country][row];
        
        NSLog(@"點選 %@", city);
        
        // Feed data to the destination of the segue
        CLDetailViewController *detailPage = segue.destinationViewController;
        
        detailPage.city = city;
//        NSLog(@"%@", detailPage.city);
        
    }
}

@end
