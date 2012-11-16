//
//  CLDetailViewController.m
//  City List
//
//  Created by MichaelHsu on 12/10/25.
//  Copyright (c) 2012年 MichaelHsu. All rights reserved.
//

#import "CLDetailViewController.h"
#import "CLDataSource.h"


@interface CLDetailViewController ()

@end

@implementation CLDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@", self.city);
    self.continentName.text = self.title = self.city[CLDataSourceDictKeyContinent];
    self.countryName.text = self.city[CLDataSourceDictKeyCountry];
    self.cityName.text = self.city[CLDataSourceDictKeyCity];
    self.regionName.text = self.city[CLDataSourceDictKeyRegion];
    self.local.text = self.city[CLDataSourceDictKeyLocal];

    UIImage *image = [UIImage imageNamed:self.city[CLDataSourceDictKeyImage]];
    self.image.image = image;
}

@end
