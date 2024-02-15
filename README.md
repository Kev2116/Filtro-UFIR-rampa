# Filtro-UFIR-rampa
El filtro de respuesta al impulso de rampa es un tipo de filtro FIR (Respuesta al Impulso Finita) que se caracteriza por tener una respuesta en frecuencia que sigue una pendiente lineal (l = 1), su respuesta al impulso se asemeja a una rampa, lo que significa que su salida aumenta linealmente con el tiempo.
El funcionamiento del filtro de rampa se basa en la convolución de la señal de entrada con la respuesta al impulso de rampa. Al aplicar esta operación, se obtiene la señal de salida filtrada, que presenta una respuesta en frecuencia lineal.
El Dr. Yuriy S. Shmaliy en su artículo “Implementation of Digital Unbiased FIR Filters with Polynomial Impulse Responses” propone la implementación del filtro de rampa (l =1) utilizando un diagrama a bloques. Este diagrama requiere 6 multiplicadores, 4 sumadores y 3 retardos temporales en su implementación.
El código presentado es una implementación en VHDL que es un lenguaje de descripción de hardware. Dicho lenguaje es utilizado para programar FPGAs (Field Programmable Gates Array).
Para una implementación más completa se utilizó Simulink en donde se crearon los bloques de las operaciones matemáticas, en donde se simularon y adicionalmente, se creó el código en VHDL utilizando el Code Generator que proporciona Simulink. Para la implementación en la FPGA se utilizó el software ISE Design Suite 14.7.
Si se desea más información sobre el filtro se puede consultar en el siguiente enlace: 
https://ieeexplore.ieee.org/document/7096314
