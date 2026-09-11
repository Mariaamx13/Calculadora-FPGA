using System;
using System.IO.Ports;
using System.Text;

namespace Calculadora
{
    public partial class Form1 : Form
    {
        int num1, num2; //se guardan como int por si el usuario pone un dígito mayor a 255
        string op, resultado;
        char[] operadores = new char[] { '+', '-', '÷', '×' }; //array de los operadores, se usa para el separador
        bool tmp = false; // es estético, sirve para evitar borrar el segundo operando, es como una bandera.
        bool reloj = false; //para activar/desactivar el reloj
        int decimalValue; //guarda el dato que llegue de la FPGA





        public Form1()
        {
            InitializeComponent();

        }

        System.IO.Ports.SerialPort s_port = new System.IO.Ports.SerialPort("COM6", 9600, Parity.None, 8, StopBits.One); //se declara el puerto, se introduce el nombre, baudrate, paridad, cantidad de bits y stopbits (1)
        System.Timers.Timer t; //timer para los 30s

        //Código puerto
        private void open_port(byte[] a, byte[] b, byte[] c)
        {
            try
            {
                if (s_port.IsOpen) ; //para evitar que salga el error de que ya hay un puerto abierto
                else s_port.Open();

                s_port.Write(a, 0, a.Length); //se manda num1
                s_port.Write(b, 0, b.Length); //se manda num2
                s_port.Write(c, 0, c.Length); //se manda op
            }
            catch (Exception ex) // por si hay algún error a la hora de abrir el puerto
            {
                MessageBox.Show(ex.Message);
                txtresp.Text = "Error";
            }

        }

        private void port_DataReceived(object sender, SerialDataReceivedEventArgs e) //se activa cada que llegue un dato
        {

            decimalValue = s_port.ReadByte(); //ReadByte lee el dato que haya llegado, tiene el problema de que muestra el valor hasta que llega otro dato TxD

        }


        //Código Calculadora
        private void btnresultado_Click(object sender, EventArgs e)
        {
            textOp.Text += txtresp.Text;
            Separador();

            if (op == "-" && num1 < num2)
            {
                MessageBox.Show("El sustraendo no puede ser mayor al minuendo.");
                textOp.Clear();
                txtresp.Text = "0";
            }
            else if (op == "÷" && num2 == 0)
            {
                MessageBox.Show("No se puede dividir por 0.");
                txtresp.Text = "0";
                textOp.Clear();
            }
            else if (num1 > 255 || num2 > 255)
            {
                MessageBox.Show("Ninguno de los números puede ser mayor a 255");
                txtresp.Text = "0";
                textOp.Clear();
            }
            else
            {
                textOp.Text += "=";

                //Se convierten los números y el operador en un array de byte para ser enviado,
                //estos bytes se descomponen en una secuencia de bits que se transmiten a través del puerto
                byte[] b_num1 = new byte[] { Convert.ToByte(num1) };
                byte[] b_num2 = new byte[] { Convert.ToByte(num2) };
                byte[] b_op;
                if (op == "×")
                {
                    b_op = Encoding.GetEncoding("iso-8859-1").GetBytes("*"); //LATIN-1 no tiene ese caracter por lo que se cambia por un *
                }
                else b_op = Encoding.GetEncoding("iso-8859-1").GetBytes(op);   // se utiliza LATIN-1 para codificar los operadores

                reloj = true;
                timer1.Enabled = true; // se inicia el timer
                open_port(b_num1, b_num2, b_op); //se abre el puerto y se escriben en Rx los datos.

                s_port.DataReceived += new SerialDataReceivedEventHandler(port_DataReceived); //se activa la recepción de datos
                txtresp.Text = decimalValue.ToString(); //se le asigna al textbox el valor de decimalvalue
            }

        }

        private void btn_num(object btn, EventArgs e)
        {

            if (txtresp.Text == "0") //entra el primer número que se vaya a ingresar, por ejemplo si se hará la operación 10-2, el 1 pasaría por este if
            {
                txtresp.Text = (btn as Button).Text; //se agrega 1

            }
            else if (textOp.Text == string.Empty) //Ya para el segundo número no se cumpliría el primer if, ya que txtresp no es 0, entonces entra por este if
            {
                txtresp.Text += (btn as Button).Text;
            }
            else if (textOp.Text != string.Empty) //antes de llegar a este if, se produce btn_op, donde textOp deja de estar vacío
            {
                if (tmp == true) //estético, limpia el dato que haya en txtresp.
                {
                    txtresp.Clear();
                    tmp = false;
                }
                txtresp.Text += (btn as Button).Text; //se agrega num2 a txtresp


            }

        }
        private void btn_op(object sender, EventArgs e)
        {
            if (txtresp.Text != "0") //verifica que no se vaya a poner un operando antes que un número
            {
                if (textOp.Text != string.Empty) //evita se tenga una ecuación con varios operandos
                {
                    ;
                }
                else
                {
                    tmp = true;
                    op = (sender as Button).Text;
                    textOp.Text = txtresp.Text;
                    textOp.Text += (sender as Button).Text;
                }

            }
        }
        private void btnclear_Click(object sender, EventArgs e) //limpia todos los datos que haya
        {
            txtresp.Text = "0";
            textOp.Clear();
        }

        private void btnerase_Click(object sender, EventArgs e) //borra el último dato
        {
            if (textOp.Text == string.Empty)
            {
                if (txtresp.Text == "0") ; //evitar que borren el 0
                else if (txtresp.Text.Length > 0)
                {
                    txtresp.Text = txtresp.Text.Remove(txtresp.Text.Length - 1, 1);
                }
                else
                    txtresp.Text = "0";
            }

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit(); //cierra el programa
        }

        private void btnpartialclear_Click(object sender, EventArgs e)
        {
            txtresp.Text = "0";
        }

        private void btnmin_Click(object sender, EventArgs e) //minimiza el programa
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void Separador() //obtiene los operandos y los convierte a int (estaban en string)
        {
            string[] ec = textOp.Text.Split(operadores);
            num1 = Convert.ToInt32(ec[0]);
            num2 = Convert.ToInt32(ec[1]);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (reloj)
            {
                s_port.Close();
                reloj = false;
                MessageBox.Show("Tiempo de espera agotado");

            }


            timer1.Enabled = false;
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            timer1.Enabled = false; //se asegura de que el timer se apague cuando se cierre el form
            s_port.Close();
        }

    }
}