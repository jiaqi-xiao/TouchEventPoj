//
//  TouchTabBar.h
//  TouchEventPoj
//
//  Created by xiaojiaqi03 on 2021/10/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TouchTabBar : UITabBar

@property(nonatomic, weak) UITabBarController* parentController;

@end

NS_ASSUME_NONNULL_END
