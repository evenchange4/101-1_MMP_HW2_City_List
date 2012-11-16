//
//  CLDetailViewController.h
//  City List
//
//  Created by MichaelHsu on 12/10/25.
//  Copyright (c) 2012年 MichaelHsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLDetailViewController : UIViewController

@property (nonatomic, strong) NSDictionary *city;

@property (strong, nonatomic) IBOutlet UILabel *continentName;
@property (strong, nonatomic) IBOutlet UILabel *countryName;
@property (strong, nonatomic) IBOutlet UILabel *cityName;
@property (strong, nonatomic) IBOutlet UILabel *regionName;
@property (strong, nonatomic) IBOutlet UILabel *local;
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end
