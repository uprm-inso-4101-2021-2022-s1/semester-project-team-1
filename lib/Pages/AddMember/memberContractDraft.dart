/*


AUTORIZACION PARA RETIRO DIRECTO DE TARJETA DE CREDITO

	Yo, 						 autorizo al gimnasio Acrópolis Fitness a cobrar directamente de mi numero de tarjeta 					
con fecha de expiración 	 la cantidad de $		   (            ) mensual por un término de 		  meses (        ).	
*Iniciales en los paréntesis (     ).
LEA ANTES DE FIRMAR
•	De ser menor de 21 años, el contrato tiene que ser firmado por el padre o encargado. El mismo asumirá la responsabilidad de pago en caso de que el menor no cumpla con los mismos.
•	Si al momento de realizar el cobro la cuenta no tiene fondos, se le cobrará una penalidad de $10.00 adicionales al costo mensual. Esto es aparte de la penalidad de $15 que cobra el banco.
•	Si al momento de hacer el cobro la cuenta no tiene fondos, se tratará de contactar al cliente. De no responder a los intentos de contacto, procederemos a cobrar una vez a la semana hasta que se pueda realizar el cobro.
•	De haber algún cambio en la dirección, número telefónico o cuenta, el cliente será responsable de contactarnos para dar la información nueva.
•	Si la información dada en el contrato es falsa, esto se considerara incumplimiento de contrato, esto conllevara la cancelación del mismo. En adición el cliente tendrá que pagar la totalidad de el contrato cancelado.
•	El contrato sólo se paralizará o cancelará por enfermedad (con excusa médica). El gimnasio se reserva el derecho de decidir si el contrato será cancelado o paralizado.
•	El contrato solo puede ser transferido con previa autorización del gimnasio.
•	La terminación temprana de este contrato conllevará una penalidad de $20 por cada mes restante del mismo, desde la fecha de cancelación. De no cancelar el contrato, tendrá que pagar los meses acumulados a precio regular.
•	De haber un incumplimiento en el contrato, el gimnasio se reserva el derecho de contratar un abogado y notificar a una agencia de crédito para que realice el cobro. Los gastos en los que tenga que incurrir el gimnasio por el incumplimiento tendrá que ser pagado por el cliente.
Yo, 					 acepto que he leído este contrato en su totalidad y estoy de acuerdo con todo lo estipulado en el mismo. Me comprometo a cumplirlo a cabalidad.
					 		Teléfono:				
Firma cliente / tutor / encargado

Fecha:							Dir. Postal:			


*/

String contractDraft = """
LEA ANTES DE FIRMAR
\n•De ser menor de 21 años, el contrato tiene que ser firmado por el padre o encargado. El mismo asumirá la responsabilidad de pago en caso de que el menor no cumpla con los mismos.
\n•Si al momento de realizar el cobro la cuenta no tiene fondos, se le cobrará una penalidad de \$10.00 adicionales al costo mensual. Esto es aparte de la penalidad de \$15 que cobra el banco.
\n•Si al momento de hacer el cobro la cuenta no tiene fondos, se tratará de contactar al cliente. De no responder a los intentos de contacto, procederemos a cobrar una vez a la semana hasta que se pueda realizar el cobro.
\n•De haber algún cambio en la dirección, número telefónico o cuenta, el cliente será responsable de contactarnos para dar la información nueva.
\n•Si la información dada en el contrato es falsa, esto se considerara incumplimiento de contrato, esto conllevara la cancelación del mismo. En adición el cliente tendrá que pagar la totalidad de el contrato cancelado.
\n•El contrato sólo se paralizará o cancelará por enfermedad (con excusa médica). El gimnasio se reserva el derecho de decidir si el contrato será cancelado o paralizado.
\n•El contrato solo puede ser transferido con previa autorización del gimnasio.
\n•La terminación temprana de este contrato conllevará una penalidad de \$20 por cada mes restante del mismo, desde la fecha de cancelación. De no cancelar el contrato, tendrá que pagar los meses acumulados a precio regular.
\n•De haber un incumplimiento en el contrato, el gimnasio se reserva el derecho de contratar un abogado y notificar a una agencia de crédito para que realice el cobro. Los gastos en los que tenga que incurrir el gimnasio por el incumplimiento tendrá que ser pagado por el cliente.
""";

String leerAntesDe = "LEA ANTES DE FIRMAR";

String contractDraft2 = """
Reglamento General Acropolis Fitness:\n
\n1. Esta prohibida la entrada al gimnasio de toda persona no autorizada. Solo se permitirán socios en el área de pesas. No se permiten niños en el área de pesas.
\n2. Toda persona debera hacer el "check-in" en la entrada antes de utilizar las facilidades.
\n3. No se permitirá el uso de las facilidades a personas que tengan su membresía vencida.
\n4. Se requiere vestimenta adecuada para practicar deporte, sudaderas o pantalones cortos y tenis. Esta prohibido entrenar sin camisa, el uso de sudaderas plásticas y mahonés.
\n5. Es compulsorio el uso de las toallas en el área de pesas, de no traer toalla no se le permitirá el uso de las facilidades. Luego de utilizar las maquinas, la persona debe limpiar con su toalla las maquinas. 
\n6. Se permite el uso de candados en los “lockers” pero los mismos deberán ser removidos cuando la persona haya terminado sus ejercicios. No somos responsables por ninguna pertenencia dejada en el gimnasio
\n7. Solo los instructores autorizados por el gimnasio podrán asignar rutinas y orientar a los clientes
\n8. Se deberá obedecer en todo momento las normas que se encuentran rotuladas en el gimnasio, de la persona no seguir estas normas la misma podrá ser removida del gimnasio sin devolución de dinero
\n9. El parking será exclusivo para clientes de el gimnasio mientras se encuentran en las facilidades, espacios son limitados.
\n10. No somos responsables por los vehículos dejados en el estacionamiento, ni las pertenencias dejadas dentro de estos.
\n11. Acrópolis Fitness se reserva el derecho de admisión.
\n12. Cuando finalice los ejercicios debe dejar las pesas en su lugar y dejar el equipo libre para que otros puedan utilizarlo.
\n13. Se debe mantener buena higiene personal para poder hacer el uso de nuestras facilidades.
\n14. Personas menores de 18 años de les requiere firma y autorización de sus padres o encargados.
\n15. En caso de que por enfermedad u otra razón valida la persona no pueda asistir al gimnasio, la membresía podrá ser paralizada. Se debe presentar prueba escrita del porque no puede asistir, ya sea medica u otra circunstancia.
\n16. El incumplimiento de cualquiera de estas reglas puede conllevar la expulsión del gimnasio sin devolución de dinero.
\n\n

Está Prohibido
\n•Fumar
\n•Alimentos en el área de pesas y aeróbicos.
\n•Uso de bebidas alcohólicas.
\n•Dejar caer o tirar las pesas o platos.
\n•Debe mantener un volumen de voz apropiado.
\n•Deberá utilizar un vocabulario apropiado, evitar uso obsceno u ofensivo.
\n•Está terminantemente prohibido la venta de esteroides o cualquier tipo de drogas en el gimnasio.
\n•No se permiten niños en el área de pesas y cardiovascular.
""";

String relevo = """
relevo de responsabilidades al gimnasio Acrópolis Fitness y a sus empleados en 
relación a cualquier daño accidente o causa de acción en contra de Acrópolis Fitness por motivo o 
como resultado de utilización de las facilidades del gimnasio. Este relevo de entenderá de manera 
favorable para Acrópolis Fitness e incluye el pago de cualquier cantidad, costos y honorarios de abogado.
""";
