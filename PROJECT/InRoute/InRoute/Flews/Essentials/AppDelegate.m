//
//  AppDelegate.m
//  InRoute
//
//  Created by Admin on 24/03/2020.
//  Copyright © 2020 g4play. All rights reserved.
//

#import "AppDelegate.h"
#import "UserNotifications/UserNotifications.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Register for remote notifications.
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert +UNAuthorizationOptionSound;
    // Override point for customization after application launch.
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Пошли в торговый центр";
    content.subtitle = @"";
    content.body = @"Еще не прокладывал маршрут? Самое время!";
    content.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60*60*24 repeats:YES];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"UYLLocalNotification" content:content      trigger:trigger];
    // add notification for current notification centre
    if([[NSUserDefaults standardUserDefaults] valueForKey:@"notifications"]){
    }
    else{
        NSString *test = @"true";
        [[NSUserDefaults standardUserDefaults] setValue:test forKey:@"notifications"];
        [center addNotificationRequest:request withCompletionHandler:nil];
    }
    return YES;
}
- (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6] ;
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [dict setObject:val forKey:key];
    }
    return dict;
}
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Геопозиция"
                                                                   message:[NSString stringWithFormat:@"Вы случайно не в "] preferredStyle:UIAlertControllerStyleAlert];
    NSLog(@"12322");
    UIAlertAction* actionCancel = [UIAlertAction actionWithTitle:@"Нет" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction* actionYes= [UIAlertAction actionWithTitle:@"Да" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:actionYes];
    [alert addAction:actionCancel];
    return YES;
}
- (BOOL)application:(UIApplication *)application
willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions{
    return YES;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
