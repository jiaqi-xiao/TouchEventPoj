//
//  AppDelegate.m
//  TouchEventPoj
//
//  Created by xiaojiaqi03 on 2021/10/11.
//

#import "AppDelegate.h"
#import "BlockView.h"
#import "SubBlockView.h"
#import "TouchTabBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // 创建TabBar的VC
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    self.window.rootViewController = tabBarViewController;
    // 自定义一个TabBar的View 并改变原本UITabBarController的View
    TouchTabBar* touchTabBar = [TouchTabBar new];
    touchTabBar.parentController = tabBarViewController;
    [tabBarViewController setValue:touchTabBar forKey:@"tabBar"]; // 通过KVC赋值
    
    // 生成纯色Image
    UIImage *imageBrwon = UIColorAsImage([UIColor blueColor], CGSizeMake(100, 150));
    UIImage *imageRed = UIColorAsImage([UIColor redColor], CGSizeMake(100, 150));
    
    // 左侧蓝色按钮
    UIViewController *item1 = [[UIViewController alloc] init];
    item1.view.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    item1.tabBarItem.title = @"Blue";
    item1.tabBarItem.image = [imageBrwon imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 右侧红色按钮
    UIViewController *item2 = [[UIViewController alloc] init];
    item2.view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    item2.tabBarItem.title = @"Red";
    item2.tabBarItem.image = [imageRed imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 将子VC赋给TabBarVC
    [tabBarViewController addChildViewController:item1];
    [tabBarViewController addChildViewController:item2];
    
    // 显示Window
    [self.window makeKeyAndVisible];
    
    
    // 棕色色块View
    BlockView *brownView = [[BlockView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    brownView.backgroundColor = [[UIColor brownColor]colorWithAlphaComponent:0.8];
    brownView.msg = @"brownView";
    // 绿色色块View
    SubBlockView *greenView = [[SubBlockView alloc]initWithFrame:CGRectMake(100, 100, 100, 250)];
    greenView.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.8];
    greenView.msg = @"greenView";
    // 棕色块为item1(蓝色)的的子View，绿色块为棕色块的子View
    [item1.view addSubview:brownView];
    [brownView addSubview:greenView];
    
    return YES;
}

UIKIT_EXTERN UIImage * __nullable UIColorAsImage(UIColor * __nonnull color, CGSize size) {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
