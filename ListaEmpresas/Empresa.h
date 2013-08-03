//
//  Empresa.h
//  ListaEmpresas
//
//  Created by Raffael Patrício de Souza on 03/08/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Empresa : NSObject
{
    NSString *nome;
    NSString *quantFuncionarios;
}

-(id)initWithNome:(NSString*)nomeEmpresa andQuantFuncionarios:(NSString*)funcionarios;

@property(nonatomic,retain)NSString *nome;
@property(nonatomic,retain)NSString *quantFuncionarios;

@end
