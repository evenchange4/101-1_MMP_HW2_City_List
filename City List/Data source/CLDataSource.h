//
//  CLDataSource.h
//  City List
//
//  Created by MichaelHsu on 12/10/24.
//  Copyright (c) 2012年 MichaelHsu. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const CLDataSourceDictKeyCity;
extern NSString * const CLDataSourceDictKeyRegion;
extern NSString * const CLDataSourceDictKeyCountry;
extern NSString * const CLDataSourceDictKeyContinent;
extern NSString * const CLDataSourceDictKeyLocal;
extern NSString * const CLDataSourceDictKeyImage;


@interface CLDataSource : NSObject{
    NSArray *cityList;
}
+ (CLDataSource *)sharedDataSource;

- (NSArray *)arrayWithContinent;
- (NSArray *)arrayWithCountryInContinent:(NSString *)continent;
- (NSArray *)arrayWithCityInContinent:(NSString *)continent :(NSString *)country;

@end
