//
//  YGHAppDelegate.m
//  Tomcatall
//
//  Created by mac on 14-9-15.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHAppDelegate.h"
NSMutableDictionary *dic;
@implementation YGHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *array=@[@"cymbal_",@"fart_",@"eat_",@"drink_",@"scratch_",@"pie_"];
    NSBundle *bundel=[NSBundle mainBundle];
    NSString *path=[bundel pathForResource:@"Tom Plist" ofType:@".plist"];
    dic=[NSMutableDictionary dictionaryWithContentsOfFile:path];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    view.image=[UIImage imageNamed:@"angry_00.jpg"];
    view.tag=10;
    
    [self.window addSubview:view];
    for(NSUInteger i=0;i<6;i++)
    {
      
        UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
        but.frame=CGRectMake(i%2*240+20, i/2*50+300, 60, 60);
        [but setTitle:array[i] forState:UIControlStateNormal];
        [but setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [but setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",array[i]]] forState:UIControlStateNormal];
        but.tag=i;
        [but addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self.window addSubview:but];
    }
    [self creatbutton];

   
    return YES;
}
-(void)creatbutton
{
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(110, 80, 100, 50)];
    but.backgroundColor=[UIColor clearColor];
    [but setTitle:@"knockout_" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *but1=[[UIButton alloc]initWithFrame:CGRectMake(110, 350, 100, 50)];
    but1.backgroundColor=[UIColor clearColor];
     [but1 setTitle:@"stomach_" forState:UIControlStateNormal];
     [but1 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *but2=[[UIButton alloc]initWithFrame:CGRectMake(110, 430, 50, 30)];
    but2.backgroundColor=[UIColor clearColor];
     [but2 setTitle:@"foot_right_" forState:UIControlStateNormal];
     [but2 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *but3=[[UIButton alloc]initWithFrame:CGRectMake(170, 430, 50, 30)];
    but3.backgroundColor=[UIColor clearColor];
     [but3 setTitle:@"foot_left_" forState:UIControlStateNormal];
     [but3 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [but3 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *but4=[[UIButton alloc]initWithFrame:CGRectMake(210, 400, 40, 30)];
     [but4 setTitle:@"angry_" forState:UIControlStateNormal];
     [but4 setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    but4.backgroundColor=[UIColor clearColor];
    [but4 addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:but];
    [self.window addSubview:but1];
    [self.window addSubview:but2];
    [self.window addSubview:but3];
     [self.window addSubview:but4];
}

-(void)action:(UIButton *)but
{
    NSString *str=but.titleLabel.text;
    int count=[dic[str] intValue] ;
    NSArray *images=[self packing:str withcount:count];
    UIImageView *view=(UIImageView *)[self.window viewWithTag:10];
   if(!view.isAnimating)
   { view.animationImages=images;
    view.animationDuration=0.1*count;
    view.animationRepeatCount=1;
    [view startAnimating];
   }
    
    
}
-(NSArray *)packing:(NSString *)title withcount:(int)count
{
    NSBundle *bundle=[[NSBundle mainBundle]init];
    
    NSMutableArray *array=[[NSMutableArray alloc]init];
    for(NSUInteger i=0;i<count;i++)
    {
        NSString *path=[bundle pathForResource:[NSString stringWithFormat:@"%@%02d.jpg",title,i] ofType:nil];
        UIImage *image=[UIImage imageWithContentsOfFile:path];
        [array addObject:image];
        
    }
    return array;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
