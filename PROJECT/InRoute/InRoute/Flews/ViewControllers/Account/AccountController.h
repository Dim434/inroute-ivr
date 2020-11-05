//
//  AccountController.h
//  InRoute
//
//  Created by Dmitry on 23.09.2020.
//  Copyright © 2020 g4play. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *actionController;
@property (weak, nonatomic) IBOutlet UITextView *emailLabel;
@end

NS_ASSUME_NONNULL_END
