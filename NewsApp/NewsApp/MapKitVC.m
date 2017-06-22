//
//  MapKitVC.m
//  NewsApp
//
//  Created by rtuser on 6/19/17.
//  Copyright © 2017 rt_user. All rights reserved.
//

#import "MapKitVC.h"
#import "MapAnnotations.h"
#import "MapTVC.h"

@interface MapKitVC () <MKMapViewDelegate> {
    NSDictionary *dctnry;
}

@end

@implementation MapKitVC

- (void)viewDidLoad {
    [super viewDidLoad];
  //  UIViewController* vc = [[UIViewController alloc]init];
    
    // Do any additional setup after loading the view.
    dctnry = @{@"NY":@"B6DytOLCUAAjquD.png", @"DC":@"white-house_318-27080.jpg", @"CA":@"apple_logo_40k_090318web.png"};
    mapview = [[MKMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    mapview.mapType = MKMapTypeStandard;
//    mapview.showsUserLocation = YES;
    [self.view addSubview:mapview];
    mapview.delegate = self;
    
    CLLocationCoordinate2D coordinateWH; //38.897868, -77.036508
    coordinateWH.latitude = 38.897868;
    coordinateWH.longitude = -77.036508;
    
    MKCoordinateSpan spanWH;
    spanWH.latitudeDelta = 0.2;
    spanWH.longitudeDelta = 0.2;
    
    MKCoordinateRegion regionWH;
    regionWH.center = coordinateWH;
    regionWH.span = spanWH;
    
    //[mapview setRegion:regionWH];
    
    CLLocationCoordinate2D coordinateNY; //40.759131, -73.985067
    coordinateNY.latitude = 40.759131;
    coordinateNY.longitude = -73.985067;
    
    MKCoordinateSpan spanNY;
    spanNY.latitudeDelta = 0.002;
    spanNY.longitudeDelta = 0.002;
    
    MKCoordinateRegion regionNY;
    regionNY.center = coordinateNY;
    regionNY.span = spanNY;
    
  //  [mapview setRegion:regionNY];
    
    CLLocationCoordinate2D coordinateCA; //38.429553, -121.472690
    coordinateCA.latitude = 38.429553;
    coordinateCA.longitude = -121.472690;
    
    MKCoordinateSpan spanCA;
    spanCA.latitudeDelta = 0.2;
    spanCA.longitudeDelta = 0.2;
    
    //MKCoordinateRegion regionCA = [MKCoordinateRegionMake(coordinateCA, spanCA)];
    
    MKCoordinateRegion regionCA;
    regionCA.center = coordinateCA;
    regionCA.span = spanCA;
    
//    [mapview setRegion:regionCA];
    
    MapAnnotations *annotationWH = [[MapAnnotations alloc] init];
    annotationWH.coordinate = coordinateWH;
    annotationWH.identify = @"DC";
    annotationWH.title = @"White House";
    annotationWH.subtitle = @"WH Blog Feed";
    
    MapAnnotations *annotationNY = [[MapAnnotations alloc] init];
    annotationNY.coordinate = coordinateNY;
    annotationNY.identify = @"NY";

    annotationNY.title = @"Times Square";
    annotationNY.subtitle = @"Trending Blog Feed";
    
    MapAnnotations *annotationCA = [[MapAnnotations alloc] init];
    annotationCA.coordinate = coordinateCA;
    annotationCA.title = @"AppleInc";
    annotationCA.identify = @"CA";

    annotationCA.subtitle = @"WWDC17 Blog Feed";
    [mapview.self addAnnotation:annotationWH];
    [mapview.self addAnnotation:annotationNY];
    [mapview.self addAnnotation:annotationCA];

}

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MapAnnotations *temp = (MapAnnotations *) annotation;
    MKPinAnnotationView *viewWH = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    viewWH.pinTintColor = [UIColor cyanColor];
    viewWH.enabled = YES;
    viewWH.canShowCallout = YES;
    UIImageView *imgWH = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[dctnry objectForKey:temp.identify]]];
    imgWH.frame = CGRectMake(0, 0, 30, 30);
    viewWH.leftCalloutAccessoryView = imgWH;
    viewWH.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    return viewWH;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    MapAnnotations *annWH = (MapAnnotations *) view.annotation;
    [mapview deselectAnnotation:annWH animated:YES];
//    NSString *message = [NSString stringWithFormat:@"Pin at: %f , %f", annWH.coordinate.latitude, annWH.coordinate.longitude];
    //UIAlertView *alrt = [[UIAlertView alloc] initWithTitle:@"Location" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    //    UIAlertController *alrt = [[UIAlertController alloc] init];
    //    alrt.title = @"Location";
    //    alrt.message = message;
//    UIAlertController *alertWH = [UIAlertController alertControllerWithTitle: @"Location" message:message preferredStyle:UIAlertControllerStyleAlert];
//    [alertWH addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
//    [self presentViewController:alertWH animated:YES completion:nil];
    
//    id annotation = view.annotation; // replace id with with your annotation class
//    // get the id
//    NSInteger whateverID = annotation.whateverID;
//    // create the detailviewcontroller
   
    UIViewController *controller = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    UIView * viewTemp = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    viewTemp.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor orangeColor];
    [controller.view addSubview:viewTemp];
    controller.navigationItem.title = annWH.title;
    //controller.annotation = annotationView.annotation;
    [self.navigationController pushViewController:controller animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
