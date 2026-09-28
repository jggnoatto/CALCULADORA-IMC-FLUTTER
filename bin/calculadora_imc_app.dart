import 'dart:convert';
import 'dart:io';

import 'package:calculadora_imc_app/pessoa.dart';

void main(List<String> arguments) {
  print('Bem vindo à calculadora de IMC!');

  String nome = lerConsoleComTexto("Digite o seu Nome");
  double peso = lerConsoleDouble("Digite o seu peso");
  double  altura = lerConsoleDouble("Digite a sua altura");

  Pessoa pessoa = Pessoa(nome, peso, altura);

  print(classificarIMC(pessoa));
}

String lerConsoleComTexto(String texto){
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}

double lerConsoleDouble(String texto){
  var numero = double.tryParse(lerConsoleComTexto(texto));
  while (numero == null || numero <= 0){
    print("Insira o número novamente");
    numero = double.tryParse(lerConsoleComTexto(texto));
  } 
  return numero;
}

double calcularIMC(Pessoa pessoa) {
  double resultado = pessoa.getPeso() / (pessoa.getAltura() * pessoa.getAltura());
  return resultado;
}

String classificarIMC(Pessoa pessoa) {
  var resultado = calcularIMC(pessoa);
  var classificacao = "";
  if(resultado < 16) {
    classificacao = "magreza grave";
  } else if(resultado < 17) {
    classificacao = "magreza moderada";
  } else if(resultado < 18.5) {
    classificacao = "magreza leve";
  } else if(resultado < 25) {
    classificacao = "saudável";
  } else if(resultado < 30) {
    classificacao = "sobrepeso";
  } else if(resultado < 35) {
    classificacao = "obesidade grau I";
  } else if(resultado < 40) {
    classificacao = "obesidade grau II";
  } else {
    classificacao = "obesidade grau III";
  } if (resultado <= 0.0) {
    return "O seu resultado foi inválido, refaça o teste";
  } else {
    return "${pessoa.getNome()}, o seu IMC é ${resultado.toStringAsFixed(2)} e a sua classificação é $classificacao.";
  } 
}