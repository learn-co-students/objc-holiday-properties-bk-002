//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSArray *holidays = self.database[season];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSArray *supplies = self.database[season][holiday];
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    return [[self.database[season] allKeys] containsObject:holiday];
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    return [self.database[season][holiday] containsObject:supply];
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    NSMutableDictionary  *holidays = [self.database mutableCopy];
    NSMutableDictionary *seasons = [holidays[season] mutableCopy];
    [seasons setObject:@[] forKey:holiday];
    holidays[season] = seasons;
    self.database = holidays;
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    NSMutableDictionary *mDatabase = [self.database mutableCopy];
    NSMutableArray *supplies = [mDatabase[season][holiday] mutableCopy];
    [supplies addObject:supply];
    mDatabase[season][holiday] = supplies;
    self.database = mDatabase;
}

@end
