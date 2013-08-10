//
//  ViewController.h
//  ListaEmpresas
//
//  Created by Raffael Patrício de Souza on 03/08/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *empresas;
}

@property (nonatomic,retain)IBOutlet UITableView *tabelaEmpresas;

@end
