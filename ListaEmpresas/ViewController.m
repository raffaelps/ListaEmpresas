//
//  ViewController.m
//  ListaEmpresas
//
//  Created by Raffael Patrício de Souza on 03/08/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self carregarEmpresas];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)carregarEmpresas
{
    NSString *plistCaminho = [[NSBundle mainBundle] pathForResource:@"empresas" ofType:@"plist"];
    
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    
    NSArray *dados = [pl objectForKey:@"Empresas"];
    
    empresas = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in dados)
    {
        NSString *nome = [item objectForKey:@"nome"];
        NSString *quant = [item objectForKey:@"quantFuncionarios"];
        
        Empresa *e = [[Empresa alloc] initWithNome:nome andQuantFuncionarios:quant];
        
        [empresas addObject:e];
        
        [e release];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return empresas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CelulaEmpresaCacheID = @"CelulaEmpresaCacheID";
    
    UITableViewCell *cell = [self.tabelaEmpresas dequeueReusableCellWithIdentifier:CelulaEmpresaCacheID];
    
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CelulaEmpresaCacheID] autorelease];
    }
    
    Empresa *empresa = [empresas objectAtIndex:indexPath.row];
    cell.textLabel.text = empresa.nome;
    cell.detailTextLabel.text = empresa.quantFuncionarios;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Empresa *emp = [empresas objectAtIndex:indexPath.row];
    
    NSString *mensagem = [NSString stringWithFormat:@"Nome: %@ \n Quantidade de Funcionários: %@", emp.nome, emp.quantFuncionarios ];
    
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Empresa"
        message:mensagem
        delegate:nil
        cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    
    [alert show];
    
    [self.tabelaEmpresas deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [empresas removeObjectAtIndex:indexPath.row];
    [self.tabelaEmpresas reloadData];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remover";
}

- (IBAction)botaoEditarTag:(id)sender
{
    if ([self.botaoEditar.title isEqualToString:@"Editar"])
    {
        [self.tabelaEmpresas setEditing:YES animated:YES];
        self.botaoEditar.title = @"Pronto";
    }
    else
    {
        [self.tabelaEmpresas setEditing:NO animated:YES];
        self.botaoEditar.title = @"Editar";
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

@end
