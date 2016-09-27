//
//  ViewController.m
//  缓存01
//
//  Created by 优谱德 on 16/9/27.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "ViewController.h"
#import "CusCell.h"
#import "Model.h"
#import "CacheManager.h"
#import "Util/Util.h"

#define cacheName @"cache.data"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *log;

@property(nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initUI];
}

#pragma mark - view life circle

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    
    // 缓存数据
    if (self.dataSource.count >= 20) {
        
        CacheManager *manager = [CacheManager sharedManager];
        [manager cacheModelArray:self.dataSource toPath:[Util getTmpDirectory] withName:cacheName];
    }
    
}

#pragma mark - init

- (void)initData {
    
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    
    // 检测有无缓存
    CacheManager *manager = [CacheManager sharedManager];
    
    NSMutableArray *mut_arr = [manager getModelArrayFromPath:[Util getTmpDirectory] withName:cacheName];
    
    if (mut_arr.count < 20) {
        
        // 去网络取得数据
        NSLog(@"从plist取出数据");
        
        self.log.text = @"从plist取出数据";
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cache" ofType:@"plist"];
        NSMutableArray *arr = [[NSMutableArray alloc] initWithContentsOfFile:path];
        
        for (int i = 0; i < arr.count; i ++) {
            
            NSDictionary *dic = arr[i];
            
            Model *model = [Model initModelWithDic:dic];
            [self.dataSource addObject:model];
        }
        
        
    }else {
        
        
        self.log.text = @"从tmp取出数据";
        self.dataSource = mut_arr;
    }
    
    
}

- (void)initUI {

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


#pragma mark - tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cell_id = @"CusCell";
    
    CusCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"CusCell" owner:self options:nil].firstObject;
    }
    
    /* 配置cell */
    
    Model *model = self.dataSource[indexPath.row];
    
    cell.cusImageView.image = [UIImage imageNamed:model.img];
    cell.nameLabel.text = model.name;
    
    return cell;
    
}
- (IBAction)backIt:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
