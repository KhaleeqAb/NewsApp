//
//  TopStoriesVC.m
//  NewsApp
//
//  Created by rtuser on 6/19/17.
//  Copyright © 2017 rt_user. All rights reserved.
//

#import "TopStoriesVC.h"
#import "TopStoriesDetailVc.h"

@interface TopStoriesVC () <UITableViewDataSource,UITableViewDelegate> {
    
    NSURL *url;
    NSData *myData;
    NSDictionary *dctnry;
    NSDictionary *dctnry1;
    NSString *urlString;
    
}

@end

@implementation TopStoriesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    urlString = [NSString stringWithFormat:@"https://newsapi.org/v1/articles?source=techcrunch&apiKey=2dadb6e29fd64552b835893728c77188"];
    url = [NSURL URLWithString:urlString];
    myData = [NSData dataWithContentsOfURL:url];
    dctnry = [NSJSONSerialization JSONObjectWithData:myData options:0 error:nil];
    //  NSLog(@"%@",dictnry);
    dctnry1 = [dctnry objectForKey:@"articles"];
    NSLog(@"%@",dctnry1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dctnry1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    //Configure the cell...
    
    
    NSString *str = [[dctnry1 valueForKeyPath:@"urlToImage"]objectAtIndex:indexPath.row];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
    
    cell.imageView.image = [UIImage imageWithData:imageData];
    CGSize itemSize = CGSizeMake(90, 90);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //[[cell imageView] setImage:[UIImage imageWithData:imageData]];
    
    
    //cell.imageView.image = [[dctnry1 valueForKeyPath:@"urlToImage"] objectAtIndex:indexPath.row];

    cell.textLabel.text = [[dctnry1 valueForKeyPath:@"title"]objectAtIndex:indexPath.row];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    //cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 4;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    cell.textLabel.textAlignment=NSTextAlignmentRight;
    cell.detailTextLabel.text = [[dctnry1 valueForKeyPath:@"author"]objectAtIndex:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
     TopStoriesDetailVc *seg = (TopStoriesDetailVc *)segue.destinationViewController;
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    seg.msg = [[dctnry1 valueForKeyPath:@"description"] objectAtIndex:index.row];
    
    
}


@end
