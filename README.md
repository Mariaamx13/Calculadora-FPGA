# Calculadora FPGA

Proyecto de Vivado (Verilog) que implementa un receptor UART sobre una FPGA
Artix-7 (Basys 3). El diseño recibe bytes por el puerto serial RS-232 y los
almacena en un pequeño banco de registros, como base para una calculadora
controlada por PC.

## Estado del proyecto

El módulo sintetizable actual (`top.v`) implementa únicamente la **recepción
UART y el almacenamiento del dato recibido**. Los módulos `Calculadora.v` y
`Transmisor.v` corresponden a trabajo en progreso hacia la calculadora
completa (parseo de operandos/operador y transmisión del resultado).

## Estructura del proyecto

```
Calculadora-FPGA-main/
├── Calculadora.xpr                          # Proyecto de Xilinx Vivado (v2022.2)
├── Calculadora.srcs/
│   ├── sources_1/new/
│   │   ├── top.v                            # Módulo top-level (instanciado en la FPGA)
│   │   ├── Receptor.v                       # Receptor UART (RxD -> datos_rx)
│   │   ├── FlipFlop.v                       # Banco de registros (memoria) de 3 posiciones
│   │   ├── Calculadora.v                    # WIP: integración receptor + data_handler
│   │   └── Transmisor.v                     # WIP: transmisor UART (envío de resultado)
│   ├── constrs_1/new/
│   │   └── si.xdc                           # Restricciones físicas (pines) para Basys 3
│   └── utils_1/imports/synth_1/
│       └── TransmisorFPGA_PC.dcp            # Checkpoint de síntesis importado
└── Calculadora.hw/                          # Configuración de hardware/target de Vivado
```

## Módulos

### `top.v`
Módulo top-level. Conecta el receptor UART con el banco de registros:
- **Entradas:** `clk`, `rst`, `RxD`
- Instancia `Receptor` (recibe el byte serial) y `flipflop` (lo almacena).
- `write_en` se activa cuando `datos_rx` es distinto de cero; `direc` está
  fijo en `2'b00`, por lo que actualmente siempre escribe en el mismo
  registro (`reg_file[0]`).

### `Receptor.v`
Receptor UART bit-a-bit con máquina de estados (IDLE / recepción):
- Reloj del sistema: 100 MHz (`clk_freq = 100_000_000`)
- Baud rate: 9600 (`baud_rate = 9_600`)
- Sobremuestreo ×4 para sincronizar el muestreo con el bit de inicio.
- Trama de 10 bits (1 start + 8 datos + 1 stop); expone el byte de datos en
  `datos_rx`.

### `FlipFlop.v` (módulo `flipflop`)
Banco de 3 registros de 8 bits (`reg_file[0..2]`). Escribe `datoRx` en la
posición indicada por `direc` cuando `write_en` está activo, y expone los 3
registros permutados en `data_out_0/1/2` según `direc`.

### `Calculadora.v` *(no integrado)*
Pensado como módulo superior de la calculadora completa: instancia
`Receptor` y un `data_handler` (no incluido en el repo) para separar el
byte recibido en `num1`, `num2` y `op`.

### `Transmisor.v` *(no integrado)*
Transmisor UART por software: serializa `data` bit a bit (LSB primero,
usando `resp` como línea de salida) y usa `tx_ready` para indicar cuándo
puede aceptar un nuevo byte a transmitir.

## Hardware objetivo

- **Placa:** Digilent Basys 3
- **FPGA:** Xilinx Artix-7, `xc7a35ticpg236-1L`
- **Herramienta:** Xilinx Vivado 2022.2

### Restricciones (`si.xdc`)
Pines activos en el archivo de restricciones:
| Señal | Pin  | Descripción                     |
|-------|------|----------------------------------|
| `clk` | W5   | Reloj del sistema (100 MHz)      |
| `rst` | U18  | Botón de reset                   |
| `RxD` | B18  | Entrada UART (interfaz USB-RS232)|

El resto de recursos de la placa (switches, LEDs, display de 7 segmentos,
botones adicionales, VGA, Pmod, PS/2, Quad-SPI) están definidos pero
comentados en `si.xdc`, listos para habilitarse según se necesiten.

## Cómo abrir el proyecto

1. Instalar **Xilinx Vivado 2022.2** (o compatible).
2. Abrir `Calculadora.xpr` desde Vivado (`Open Project`).
3. Verificar que `top.v` esté marcado como *Top Module* en `sources_1`.
4. Ejecutar **Run Synthesis** → **Run Implementation** → **Generate
   Bitstream**.
5. Programar la Basys 3 con el bitstream generado.

## Uso

Con la placa programada, enviar un byte por el puerto serie (9600 baudios,
8N1) hacia el pin `RxD` (conector USB-RS232 de la Basys 3). El receptor
UART decodifica el byte y lo almacena en `reg_file[0]` del banco de
registros de `FlipFlop.v`.
