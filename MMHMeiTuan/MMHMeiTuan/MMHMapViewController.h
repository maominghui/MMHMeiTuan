//
//  MMHMapViewController.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/20.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHMapViewController : UIViewController<BMKLocationServiceDelegate, BMKMapViewDelegate, BMKGeneralDelegate, BMKGeoCodeSearchDelegate>{
    BMKLocationService *_locService;
    BMKGeoCodeSearch* _geocodesearch;
    BMKPointAnnotation *pointAnnotation;
    BOOL setCenter;
    
}
@end
