//
//  AppDelegate.h
//  NewsApp
//
//  Created by rt_user on 6/19/17.
//  Copyright © 2017 rt_user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

