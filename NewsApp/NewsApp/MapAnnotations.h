//
//  MapAnnotations.h
//  NewsApp
//
//  Created by rtuser on 6/21/17.
//  Copyright © 2017 rt_user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotations : NSObject <MKAnnotation>
    
//@property (nonatomic, assign) CLLocationCoordinate2D coordinateWH;
//@property (nonatomic, assign) CLLocationCoordinate2D coordinateNY;
//@property (nonatomic, assign) CLLocationCoordinate2D coordinateCA;
//@property (nonatomic, copy) NSString *titleWH;
//@property (nonatomic, copy) NSString *titleNY;
//@property (nonatomic, copy) NSString *titleCA;
//@property (nonatomic, copy) NSString *subtitleWH;
//@property (nonatomic, copy) NSString *subtitleNY;
//@property (nonatomic, copy) NSString *subtitleCA;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,  copy) NSString *title;
@property (nonatomic,  copy) NSString *subtitle;
@property (nonatomic,  copy) NSString *identify;



@end
