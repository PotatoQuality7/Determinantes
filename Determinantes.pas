Program Determinantes ;

Var

matriz, nova : array[0..2520,0..7,0..7] of string; 
original : array[0..7,0..7] of integer;
multiplicador : array[1..2520] of integer;
coluna, maiorcoluna : array[1..7] of integer;
espaco : array[1..3] of string;
i, j, i2, j2, control, counter, count, cont, m, n, num, temp3, temp4, temp5, determinante, linha, loop, e : integer;
temp, temp2 : string;
iniciado, aleatorio, transformar, feito : boolean;

Procedure Demonstrar;
	
	Begin               
	 if transformar = false then
	   begin
		   ClrScr;
	 	   writeln;
	 		 writeln;
	     writeln;
	   end; 
	 for i2 := 1 to m do   
     begin
       if (i2 = ((m DIV 2)+1))AND(odd(m) = true) then
          write('          Determinante de M = | ') 
				else
				  if (i2 = (m DIV 2))AND(odd(m) = false) then
					   write('          Determinante de M = | ')
					 else  
					   write('                              | ');
       for j2 := 1 to n do
         begin                     
           str(i2,temp);
					 str(j2,temp2);
					 temp := concat('m',temp,temp2);
					 write(matriz[1,i2,j2] + ' ');
		     end;
		   if transformar = false then
			    writeln('|')
			  else  
			    writeln('| ',matriz[1,i2,1],' ',matriz[1,i2,2]);
		 iniciado := true;			    
		 end;                	  
					
End; 

Procedure Embelezar;

Var

diferenca : integer;

Begin                                                       

if iniciado = true then
  begin
    for count := 1 to m do
		  begin
			  coluna[count] := 0;
		    maiorcoluna[count] := 0;
			end;
  end;	  
for count := 1 to m do
 begin
	 for cont := 1 to n do
	  begin
		   for temp4 := 1 to length(matriz[1,count,cont]) do
			   begin
				    if copy(matriz[1,count,cont],temp4,1) = ' ' then
						   delete(matriz[1,count,cont],temp4,1);
				 end;
	  end;
 end;	 			 			            
for count := 1 to m do
  begin
    for cont := 1 to n do
      begin
			  if iniciado = false then 
				  begin
					  str(count,temp);
			  		str(cont,temp2);
			      matriz[1,count,cont] := ('m' + temp + temp2);
					end; 			     
				coluna[cont] := length(matriz[1,count,cont]);
			  if coluna[cont] > maiorcoluna[cont] then
		   		 maiorcoluna[cont] := coluna[cont];
			end;
	end;	
for count := 1 to m do
  begin
	  for cont := 1 to n do
		  begin
			  diferenca := (maiorcoluna[cont] - length(matriz[1,count,cont]) + 1) DIV 2;
			  temp4 := maiorcoluna[cont] - (diferenca + length(matriz[1,count,cont])); 
  	    matriz[1,count,cont] := copy(espaco[1],1,diferenca) + matriz[1,count,cont] + copy(espaco[1],1,temp4);				   
	    end;
	end;		  
	Demonstrar;
End;

Procedure Calculos;

Begin

if m = 1 then
  begin
    determinante := original[1,1];
    writeln;
    writeln('                Por ter apenas 1 elemento, o determinate de M e esse elemento.');
    writeln;
    writeln('Entao, o detertminante = ',original[1,1]);
	end  
 else
   if m = 2 then 
     begin
		   determinante := (original[1,1]*original[2,2])-(original[1,2]*original[2,1]);
		   writeln;
			 writeln('Para obtermos o determinante, simplesmente aplicamos o metodo de Cramer:');
			 writeln;
			 writeln;
			 writeln('            Determinante de M = | a b |');
			 writeln('                                | c d |');
			 writeln;
			 writeln;
			 writeln('Levamos o produto de a e d, e subtraimos pelo produto de b e c. (ad - bc)');
			 writeln;
			 writeln('Ou seja, (',original[1,1],'*',original[2,2],') - (',original[1,2],'*',original[2,1],')');
			 writeln;
			 writeln('        = ',original[1,1]*original[2,2],'-',original[1,2]*original[2,1]);
			 writeln;
			 writeln('        = ',determinante);
		 end
		else
		  if m = 3 then 
       begin
         transformar := true;
         temp3 := (original[1,1]*original[2,2]*original[3,3])+(original[1,2]*original[2,3]*original[3,1])+(original[1,3]*original[2,1]*original[3,2]);
         temp4 := (original[3,1]*original[2,2]*original[1,3])+(original[3,2]*original[2,3]*original[1,1])+(original[3,3]*original[2,1]*original[1,2]);
		     determinante := temp3 - temp4;
		   	 writeln;
			 	 writeln('Para obtermos o determinante, simplesmente aplicamos o metodo de Sarrus:');
			   writeln;
			   writeln;
			   writeln('                            | a b c | a b');
			   writeln('                            | d e f | d e');                                                                                                                                                                                                                                                                 
			   writeln('                            | g h i | g h');
			   writeln;
				 writeln('Levamos o determinante e escrevemos as primeiras duas colunas do lado direito.');
			   writeln;
				 writeln('Ou seja:');
			   writeln;
				 Demonstrar;
			   transformar := false;
			 	 writeln;
			   writeln;
			   writeln('Em seguida, somamos os produtos das diagonais aei, bfg, e cdh, e subtraimos pela soma dos produtos das diagonais gec, hfa, e idb.');
			   writeln;
				 writeln('Temos:   ((',original[1,1],'*',original[2,2],'*',original[3,3],')+(',original[1,2],'*',original[2,3],'*',original[3,1],')+(',original[1,3],'*',original[2,1],'*',original[3,2],')) - ((',original[3,1],'*',original[2,2],'*',original[1,3],')+(',original[3,2],'*',original[2,3],'*',original[1,1],')+(',original[3,3],'*',original[2,1],'*',original[1,2],'))');
			   writeln;
			   writeln('       = (',original[1,1]*original[2,2]*original[3,3],'+',original[1,2]*original[2,3]*original[3,1],'+',original[1,3]*original[2,1]*original[3,2],') - (',original[3,1]*original[2,2]*original[1,3],'+',original[3,2]*original[2,3]*original[1,1],'+',original[3,3]*original[2,1]*original[1,2],')');
			   writeln;
			   writeln('       = ',temp3,'-',temp4);
			   writeln;
			   writeln('       = ',determinante);
		   end
		  else 		
		    repeat     
				  control := 1;
				  num := num*m;           		             
					linha := 0;
			    for counter := 1 to num do
			      begin           
			        i := 1;
			        inc(linha);
							temp4 := 12 + (6*loop);   			     
							feito := false;      
							for count := 1 to m do
			          begin                  
		      				 j := 0;
			             espaco[3] := copy(espaco[1],1,length(matriz[1,1,linha]));
			             val(matriz[control,1,linha],multiplicador[counter],e);
			             inc(temp4);
			             if (odd(m-1) = false)AND(feito = false) then
			                begin
			                   temp4 := temp4 + ((m-1) DIV 2) + 1;
			                   temp3 := ((counter-1)*12) + 2;
			                   gotoxy(temp3,temp4);
											   textcolor(7);write(multiplicador[counter]);textcolor(10);
											   feito := true;
											   temp4 := temp4 - ((m-1) DIV 2) - 1; 
											end 
			              else
									    if (odd(m-1) = true)AND(feito = false) then
										      begin
										        temp4 := temp4 + ((m-1) DIV 2) + 2;  
										        temp3 := ((counter-1)*12) + 2;      
										        if multiplicador[counter] < 0 then
										           temp3 := temp3 - 2;																								        										        
			                   		gotoxy(temp3,temp4);
											      textcolor(7);write(multiplicador[counter]);textcolor(10);
											      feito := true;
											      temp4 := temp4 - ((m-1) DIV 2) - 1;
											    end   
			                 else
										     if feito = true then
							      			  begin
															temp3 := ((counter-1)*12) + 3;
															gotoxy(temp3,temp4);
															write('|');
			                      end;  
			             temp3 := 3+((counter-1)*12); 
									 for cont := 1 to m do
			               begin        
			                  if (count <> 1)AND(cont <> linha) then
			                   begin        
														inc(j);                      
														nova[counter,i,j] := matriz[control,count,cont];
																																										
													  temp3 := temp3 + 2;                 
													  gotoxy(temp3,temp4);
														write(nova[counter,i,j],' ');  
													  if j = m-1 then
													     inc(i);
											   end;  
			               end;     
			             if count <> 1 then
								      writeln('|');
						    end;
						    if (linha = m)AND(cont = m) then
								   inc(control);  
								if linha = m then
			             linha := 0; 
							readln;
							writeln;
							temp4 := 14 + (6*loop) + (m DIV 2);
							temp3 := 12*counter;
							gotoxy(temp3,temp4);
							if counter < num then
							   if multiplicador[counter+1] < 0 then
								    write('-')
							    else 
								    write('+');   
			      end;
			      for counter := 1 to num do
			        begin
			          for count := 1 to m do
			            begin
			              for cont := 1 to m do
			                begin 
			                  matriz[counter,count,cont] := nova[counter,count,cont];
			                  nova[counter,count,cont] := '';
											end;
									end;
			        end;         
			      dec(m);  
			      inc(loop);
			   until matriz[num,1,3] = '';  
					     
End;


Begin

repeat 
  ClrScr;
  writeln;    
  cursoron;
  iniciado := false;
	espaco[1] := '                    '; 
  for count := 1 to m do
    begin
      for cont := 1 to n do
        begin
          matriz[1,count,cont] := '';
        end;
        coluna[count] := 0;
        maiorcoluna[count] := 0;
		end;
  writeln('                     Qual e o a ordem da sua matriz?');
  write('                                     ');read(m);
  while (m <= 0)OR(m > 7) do
   begin
     ClrScr;
     writeln;
     writeln(m);
     writeln('                      Ordem invalida. (1-7)');
     read(m);
   end;  
   n := m;	  
   num := 1;   
	 ClrScr; 
   Embelezar; 
		for i := 1 to m do
		  begin
			  for j := 1 to n do
		      begin	
					  espaco[2] := '     ';
					  writeln;   
						str(i,temp);
						str(j,temp2);       
					  matriz[1,i,j] := 'm' + temp + temp2;
						writeln(espaco[2],'Escreva ',matriz[1,i,j]);
						read(matriz[1,i,j]);                   
					  if length(matriz[1,i,j]) > 1 then
					    for count := 1 to length(matriz[1,i,j]) do
					      begin
					        if copy(matriz[1,i,j],count,1) <> '0' then
					          begin
										  matriz[1,i,j] := copy(matriz[1,i,j],count,length(matriz[1,i,j]));
										  break;
										end;
									if count = length(matriz[1,i,j]) then
									   delete(matriz[1,i,j],1,length(matriz[1,i,j])-1);	  																											        
					      end;																																			
						val(matriz[1,i,j],temp3,temp4);
						while(temp4 = 1) do
					    begin
					      ClrScr;        
					      writeln(matriz[1,i,j]);
					      writeln;
					      writeln('Opah, use apenas numeros.');
					      read(matriz[1,i,j]);
						    val(matriz[1,i,j],temp3,temp4);
							end;		 									
							original[i,j] := temp3;						 							 							 							 
							Embelezar; 
					end;			 	 	  					  					  
			end;
			writeln;
			writeln;
			Embelezar;      
			Calculos;                                   
			writeln;						
			writeln('          Aperte "r" para repetir.');
		  temp := readkey;						
		temp := upcase(temp);			
until temp <> 'R';       

End.