//
//  CLDataSource.m
//  City List
//
//  Created by MichaelHsu on 12/10/24.
//  Copyright (c) 2012年 MichaelHsu. All rights reserved.
//

#import "CLDataSource.h"

// Dictionary Keys
NSString * const CLDataSourceDictKeyCity = @"City";
NSString * const CLDataSourceDictKeyRegion = @"Region";
NSString * const CLDataSourceDictKeyCountry = @"Country";
NSString * const CLDataSourceDictKeyContinent = @"Continent";
NSString * const CLDataSourceDictKeyLocal = @"Local";
NSString * const CLDataSourceDictKeyImage = @"Image";

@implementation CLDataSource

#pragma mark -
#pragma mark Object Lifecycle

+ (CLDataSource *)sharedDataSource {
    static dispatch_once_t once;
    static CLDataSource *sharedDataSource;
    dispatch_once(&once, ^ {
        sharedDataSource = [[self alloc] init];
    });
    return sharedDataSource;
}

- (id)init {
    if (self = [super init]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"citylist" ofType:@"plist"];
        cityList = [NSArray arrayWithContentsOfFile:path];
//        NSLog(@"%@",path );
    }
    return self;
}

#pragma mark -
#pragma mark Interfaces
//- (void)refresh{
//
//}
//- (void)cleanCache{
//
//}

- (NSArray *)arrayWithContinent {
    NSArray *continents;
    if (!continents) {
        // Save Continents into a set (remove duplicates result).
        NSMutableSet *continentsSet = [NSMutableSet set];
        for (NSDictionary *city in cityList)
            [continentsSet addObject:city[CLDataSourceDictKeyContinent]];
        
        // Convert set to array and sort the array.
        continents = [[continentsSet allObjects] sortedArrayUsingComparator:
                      ^NSComparisonResult(id obj1, id obj2) {
                          return [obj1 compare:obj2];
                      }];
    }
    return continents;
}

- (NSArray *)arrayWithCountryInContinent:(NSString *)continent {
    NSArray *resultCities;
    NSArray *resultCountry;
    if (!resultCities) {
        // Filter array
        resultCities = [cityList filteredArrayUsingPredicate:
                        [NSPredicate predicateWithBlock:
                         ^BOOL(id evaluatedObject, NSDictionary *bindings) {
                             NSDictionary *city = (NSDictionary *)evaluatedObject;
                             return [city[CLDataSourceDictKeyContinent] isEqualToString:continent];
                         }]];
        // Sort array
//        resultCities = [resultCities sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//            return [obj1[CLDataSourceDictKeyCity] compare:obj2[CLDataSourceDictKeyCity]];
//        }];
        // Save Country into a set (remove duplicates result).
        NSMutableSet *countrySet = [NSMutableSet set];
        for (NSDictionary *city in resultCities)
            [countrySet addObject:city[CLDataSourceDictKeyCountry]];
        
        // Convert set to array and sort the array.
        resultCountry = [[countrySet allObjects] sortedArrayUsingComparator:
                      ^NSComparisonResult(id obj1, id obj2) {
                          return [obj1 compare:obj2];
                      }];
    }

//    NSLog(@"%@", countries);
    return resultCountry;
}

- (NSArray *)arrayWithCityInContinent:(NSString *)continent :(NSString *)country{
    NSArray *resultCities;
    
    if (!resultCities) {
        // Filter array
        resultCities = [cityList filteredArrayUsingPredicate:
                        [NSPredicate predicateWithBlock:
                         ^BOOL(id evaluatedObject, NSDictionary *bindings) {
                             NSDictionary *city = (NSDictionary *)evaluatedObject;
                             return [city[CLDataSourceDictKeyContinent] isEqualToString:continent];
                         }]];
        // Filter array2
        resultCities = [cityList filteredArrayUsingPredicate:
                        [NSPredicate predicateWithBlock:
                         ^BOOL(id evaluatedObject, NSDictionary *bindings) {
                             NSDictionary *city = (NSDictionary *)evaluatedObject;
                             return [city[CLDataSourceDictKeyCountry] isEqualToString:country];
                         }]];
        // Sort array
        resultCities = [resultCities sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj1[CLDataSourceDictKeyCity] compare:obj2[CLDataSourceDictKeyCity]];
        }];
        
    }
//    NSLog(@"%@", resultCities);
    
    return resultCities;
    
}

@end
