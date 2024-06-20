programa {
  inclua biblioteca Util --> u
  inteiro opc_menu, aux = 0
  inteiro pontuacao_cartas[40] = {28,29,30,37,32,33,34,35,36,37,28,29,30,38,32,33,34,40,36,37,28,29,30,31,32,33,34,35,36,37,28,29,30,31,32,33,34,40,36,37}
  cadeia cartasE[6], cartasJ1[3], cartasJ2[3]
  logico auxiliar = falso
  inteiro numeroRodadas 
  inteiro numeroMao
  inteiro maoP1 = 0, maoP2 = 0, rodadaP1 = 0, rodadaP2 = 0, cartasP1[3], cartasP2[3]
  cadeia cartaJogada1
  cadeia cartaJogada2
  inteiro jogador1, jogador2
  cadeia baralho[40]={"4 de Ouro", 
  "5 de Ouro", 
  "6 de Ouro", 
  "7 de Ouro", 
  "11 de Ouro", 
  "12 de Ouro", 
  "13 de Ouro", 
  "1 de Ouro", 
  "2 de Ouro", 
  "3 de Ouro",
  "4 de Espada",
  "5 de Espada",
  "6 de Espada",
  "7 de Espada",
  "11 de Espada",
  "2 de Espada", 
  "13 de Espada",
  "1 de Espada",
  "2 de Espada",
  "3 de Espada",
  "4 de Copa",
  "5 de Copa",
  "6 de Copa",
  "7 de Copa", 
  "11 de Copa", 
  "12 de Copa", 
  "13 de Copa", 
  "1 de Copa", 
  "2 de Copa",
  "3 de Copa",
  "4 de Paus",
  "5 de Paus",
  "6 de Paus",
  "7 de Paus",
  "11 de Paus",
  "12 de Paus",
  "13 de Paus",
  "1 de Paus",
  "2 de Paus",
  "3 de Paus"}
  funcao inicio() {

    menuInicio()

  }



  funcao menuJogo(){
    para(numeroMao = 0; numeroMao < 12; numeroMao++){
    sorteioCartas()
      para(numeroRodadas = 0; numeroRodadas < 3; numeroRodadas++){
        cartaJogada1 = ""
       
        escreva("Rodada - Jogador ", 1, ": ", rodadaP1,"\n")
        escreva("Rodada - Jogador ", 2, ": ", rodadaP2,"\n")
        escreva("MÃ£o - Jogador ", 1, ": ", maoP1,"\n")
        escreva("MÃ£o - Jogador ", 2, ": ", maoP2,"\n")
        auxiliar = falso
        enquanto(auxiliar == falso){
          cartasJUm()
          jogaCartasUm()
        }

        cartaJogada2 = ""
        escreva("Rodada - Jogador ", 1, ": ", rodadaP1,"\n")
        escreva("Rodada - Jogador ", 2, ": ", rodadaP2,"\n")
        escreva("MÃ£o - Jogador ", 1, ": ", maoP1,"\n")
        escreva("MÃ£o - Jogador ", 2, ": ", maoP2,"\n")
        auxiliar = falso
        faca{
          cartasJDois()
          jogaCartasDois()
        }enquanto(auxiliar == falso)
        acharindice()
      }
      VencedorMao()
    }
  }
    funcao jogaCartasUm(){
    escreva("Qual carta vai jogar?\n")
    leia(cartaJogada1)
    auxiliar = falso

    para(inteiro I = 0; I < 3; I++){
      se(cartaJogada1 == cartasJ1[I]){
        cartasJ1[I] = "Jogada!"
        auxiliar = verdadeiro
        pare
      }
    }
    se(auxiliar == falso){
      escreva("Carta InvÃ¡lida, tente uma carta valida!!! \n")
    }
  }
  funcao jogaCartasDois(){
    escreva("Qual carta vai jogar?\n")
    leia(cartaJogada2)
    auxiliar = falso
    para(inteiro I = 0; I < 3; I++){
      se(cartaJogada2 == cartasJ2[I]){
        cartasJ2[I] = "Jogada!"
        auxiliar = verdadeiro
        pare
      }
    }

    se(auxiliar == falso){
      escreva("Carta InvÃ¡lida, tente uma carta valida!!! \n")
    }
  }
  funcao cartasJUm(){
    escreva("Cartas do Jogador 1: \n")
    para(inteiro I = 0; I < 3; I++){
      escreva(cartasJ1[I],"\n")
    }
  }
  funcao cartasJDois(){
    escreva("Cartas do Jogador 2: \n")
    para(inteiro I = 0; I < 3; I++){
      escreva(cartasJ2[I],"\n")
    }
  }
  funcao VencedorMao(){
    se(numeroRodadas == 3){
      se(rodadaP1 > rodadaP2){
        maoP1 ++
      }
      senao se(rodadaP1 < rodadaP2){
        maoP2 ++
      }
      rodadaP1 = 0
      rodadaP2 = 0
    }
  }
    funcao menuInicio(){
    escreva("Bem vindo ao jogo de TRUCO!\n")
    escreva("Deseja escolher qual opção?\n")
    escreva("1- Jogar\n")
    escreva("2- Sair\n")
    leia(opc_menu)
    escolha(opc_menu){
      caso 1:
        menuJogo()
      pare

      caso 2:
      escreva("Tenha um bom dia!")
      pare
    } 
  }
  funcao sorteioCartas(){
    cartasE[0] = ""
    cartasE[1] = ""
    cartasE[2] = ""
    cartasE[3] = ""
    cartasE[4] = ""
    cartasE[5] = ""
    aux = 0
    auxiliar = falso
    enquanto(aux<6){
      inteiro sorteado = u.sorteia(0, 39)
      para(inteiro I=0;I<6;I++){
        se(cartasE[I]==baralho[sorteado]){
          auxiliar=verdadeiro
        }
      }  
      se(auxiliar==falso){
        cartasE[aux] = baralho[sorteado]
        aux++
      }
    }
  maos()
  }
  funcao maos(){
    para(inteiro I=0;I<3;I++){  
      cartasJ1[I] = cartasE[I] 
      cartasJ2[I] = cartasE[I+3] 
    }
  }
  funcao VencedorRodada(inteiro jogador1, inteiro jogador2){
      se(jogador1 > jogador2){
        rodadaP1++
      }
      senao se(jogador1 < jogador2){
        rodadaP2++
      }
      senao se(jogador1 == jogador2){
        rodadaP1++
        rodadaP2++
      }
  }
  funcao acharindice(){
    para(inteiro I=0; I<40;I++){
      se(cartaJogada1==baralho[I]){
        jogador1 = pontuacao_cartas[I] 
      }
      se(cartaJogada2==baralho[I]){
        jogador2 = pontuacao_cartas[I]
      }
    }
  VencedorRodada(jogador1, jogador2)

  }
}

