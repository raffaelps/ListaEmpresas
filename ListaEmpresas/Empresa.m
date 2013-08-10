//
//  Empresa.m
//  ListaEmpresas
//
//  Created by Raffael Patrício de Souza on 03/08/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import "Empresa.h"

@implementation Empresa

@synthesize nome,quantFuncionarios;

- (id) initWithNome:(NSString *)nomeEmpresa andQuantFuncionarios:(NSString *)funcionarios
{
    if (self = [super init])
    {
        self.nome = nomeEmpresa;
        self.quantFuncionarios = funcionarios;
    }
    
    return self;
}

-(void) dealloc {
    [nome release];
    [quantFuncionarios release];
    [super dealloc];
}

@end
