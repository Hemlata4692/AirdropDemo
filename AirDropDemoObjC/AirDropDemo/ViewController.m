//
//  ViewController.m
//  AirDropDemo
//
//  Created by Hema on 03/04/17.
//  Copyright © 2017 Ranosys. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () {
    NSMutableArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableViewAirDrop;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //["10 Great iPhone Tips.pdf", "camera-photo-tips.html", "foggy.jpg", "Hello World.ppt", "glico.jpg", "Why Appcoda.doc"]
    dataArray=[[NSMutableArray alloc] initWithObjects:@"10 Great iPhone Tips.pdf",@"camera-photo-tips.html",@"foggy.jpg", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate/data-source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=[dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"detail"]) {
          DetailViewController *vc = [segue destinationViewController];
        NSIndexPath *index= _tableViewAirDrop.indexPathForSelectedRow;
        vc.fileName=[dataArray objectAtIndex:index.row];
    }
  }

#pragma mark - end

@end
