//
//  MMHMoreViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMoreViewController.h"
#import "MMHMoreCell.h"
#import "MMHWebViewController.h"

#define DawnViewBGColor [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1] // #EBEBEB
#define DawnCellBGColor [UIColor colorWithRed:249 / 255.0 green:249 / 255.0 blue:249 / 255.0 alpha:1] // #F9F9F9
#define NightCellBGColor [UIColor colorWithRed:50 / 255.0 green:50 / 255.0 blue:50 / 255.0 alpha:1] // #323232
#define NightCellTextColor [UIColor colorWithRed:111 / 255.0 green:111 / 255.0 blue:111 / 255.0 alpha:1] // #6F6F6F
#define NightCellHeaderTextColor [UIColor colorWithRed:75 / 255.0 green:75 / 255.0 blue:75 / 255.0 alpha:1] // #4B4B4B

@interface MMHMoreViewController ()<UITableViewDataSource,UITableViewDelegate>
{
      NSArray     *arrNames;
     __block UITableView *tbView;
}
@property(nonatomic, strong)UITableView *moreTableView;
@property(nonatomic,strong)NSArray *moreModelArray;

@end

@implementation MMHMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = [UIColor clearColor];
    
    //初始化
    [self initView];
    [self loadMoreMenuData];
    
    self.moreTableView.backgroundColor = DawnViewBGColor;
    self.moreTableView.nightBackgroundColor = NightBGViewColor;
    // Do any additional setup after loading the view.
}

#pragma mark - 加载数据
-(void)loadMoreMenuData{
        self.moreModelArray = [GetPlistArray arrayWithString:@"MoreData.plist"];
}

#pragma mark - 初始化TableView
-(void)initView{
    self.moreTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) withDelegate:self];
    [self.view addSubview:self.moreTableView];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 5;
    }else if (section == 2){
        return 5;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MMHMoreCell *cell = [MMHMoreCell cellWithTableView:tableView indexPath:indexPath moreArray:self.moreModelArray];
    
    cell.textLabel.nightTextColor = NightCellTextColor;
    
    
    if (indexPath.section == 1) {

    if (indexPath.row == 1) {
        //开启夜间模式
        UISwitch *nightModeSwitch = [[UISwitch alloc]init];
        nightModeSwitch.on = [AppConfigure boolForKey:@"APP_THEME_NIGHT_MODE"];
        [nightModeSwitch addTarget:self action:@selector(nightModeSwitch:) forControlEvents:UIControlEventEditingChanged];
        cell.accessoryView = nightModeSwitch;
        }
    }
    else if (indexPath.row == 4)
    {
        
        NSArray* arr = (NSArray*)[arrNames objectAtIndex:indexPath.section];
        cell.textLabel.text = [arr objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.textLabel.textColor = [UIColor blackColor];
        
        NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        
        
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:bundleId];
        CGFloat size = [self folderSizeAtPath:path];
        if(size > 10)
        {
            if(size < 1000)
            {
                [cell setSubText:[NSString stringWithFormat:@"%.0f B",size]];
            }
            else if(size < 1000 * 1000)
            {
                [cell setSubText:[NSString stringWithFormat:@"%.2f KB",size / 1000]];
            }
            else
            {
                [cell setSubText:[NSString stringWithFormat:@"%.2f MB",size / 1000 / 1000]];
            }
        }
    }
    cell.backgroundColor = DawnCellBGColor;
    cell.nightBackgroundColor = NightCellBGColor;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (indexPath.row == 4) {
            NSString *bundled = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleIdentifier"];
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *path = [[paths objectAtIndex:0]stringByAppendingPathComponent:bundled];
            [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
            
            [[GetUrlString sharedManager]showtoast:@"清除缓存成功"];
            
            
            [tbView reloadData];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            //支付帮助
            NSString *urlStr =  [[GetUrlString sharedManager]urlWithPayHelp];
            MMHWebViewController *webVC = [[MMHWebViewController alloc] init];
            webVC.urlStr = urlStr;
            [self.navigationController pushViewController:webVC animated:YES];
        }else if (indexPath.row == 4){
//            //我要应聘
            NSString *urlStr =  [[GetUrlString sharedManager]urlWithHelpWorking];
            MMHWebViewController *webVC = [[MMHWebViewController alloc] init];
            webVC.urlStr = urlStr;
            [self.navigationController pushViewController:webVC animated:YES];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Touch Events

- (void)nightModeSwitch:(UISwitch *)modeSwitch {
    if (modeSwitch.isOn) {
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:NightNavigationBarColor] forBarMetrics:UIBarMetricsDefault];
        self.moreTableView.backgroundColor = NightBGViewColor;
        [DKNightVersionManager nightFalling];
        [AppConfigure setBool:YES forKey:APP_THEME_NIGHT_MODE];
    } else {
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:DawnNavigationBarColor] forBarMetrics:UIBarMetricsDefault];
        self.moreTableView.backgroundColor = DawnViewBGColor;
        [DKNightVersionManager dawnComing];
        // why 要设置两次 TableView 的背景色？因为我发现，在设置界面切换夜间模式到普通模式之后，TableView 的背景色会变黑掉
        // 很奇怪的问题，然后我在调用 dawnComing 方法之后再设置一遍 Tableview 的背景色就可以解决这个问题。。。
        self.moreTableView.backgroundColor = DawnViewBGColor;
        [AppConfigure setBool:NO forKey:APP_THEME_NIGHT_MODE];
    }
    
    [self.moreTableView reloadData];
}

#pragma mark - Private

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 获得文件大小
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

- (float ) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}


@end
